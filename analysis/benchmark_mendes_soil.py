#!/usr/bin/env python3
import os, re, argparse
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
from scipy.stats import spearmanr

def read_auto(fp, index_col=None):
    comp = "infer"
    sep = "\t" if fp.endswith((".tsv",".tsv.gz")) else ("," if fp.endswith((".csv",".csv.gz")) else "\t")
    return pd.read_csv(fp, sep=sep, compression=comp, index_col=index_col)

def normalize_ko_index(idx):
    s = idx.astype(str).str.strip()
    s = s.str.replace(r'^(?i)(KO:|KEGG:|ko:)', '', regex=True)
    s = s.str.upper()
    return s

def read_picrust2_ko(pred_fp):
    df = read_auto(pred_fp)
    id_cands = [c for c in df.columns if re.match(r'(?i)^(function|#OTU\\s*ID|#OTUID|ko|id)$', str(c))]
    if id_cands:
        df = df.set_index(id_cands[0])
    else:
        df = df.rename(columns={df.columns[0]:'function'}).set_index('function')
    drop = [c for c in df.columns if c.lower() in {'description','descrip','pathway','level1','level2','level3'}]
    df = df.drop(columns=drop, errors='ignore')
    for c in df.columns: df[c] = pd.to_numeric(df[c], errors='coerce')
    df.index = normalize_ko_index(df.index)
    df = df[df.index.str.match(r'^K\\d{5}$', na=False)]
    return df

def to_cpm(df):
    return df.div(df.sum(axis=0).replace(0, np.nan), axis=1) * 1e6

def load_alias_map(alias_tsv):
    runs = read_auto(alias_tsv)
    if not {'run_accession','sample_alias'}.issubset(runs.columns):
        raise SystemExit(f"{alias_tsv} must contain 'run_accession' and 'sample_alias'.")
    runs['sample_alias'] = runs['sample_alias'].map(lambda x: re.sub(r'\\s+','', str(x).strip()))
    return dict(zip(runs['run_accession'], runs['sample_alias']))

def rename_pred_columns(pred_cpm, alias_map):
    pred = pred_cpm.rename(columns=alias_map)
    keep = [c for c in pred.columns if c.startswith(('Bulk','RAG','RTP'))]
    return pred.loc[:, keep]

def build_shotgun_lwm(soil_lwm_dir):
    cands = [os.path.join(soil_lwm_dir, 'rhizo_wgs_p.txt'),
             os.path.join(soil_lwm_dir, 'rhizo_p1_n.csv'),
             os.path.join(soil_lwm_dir, 'rhizo_p2_n.csv')]
    dfs=[]
    for p in cands:
        if not os.path.exists(p): continue
        try:
            df = read_auto(p, index_col=0)
        except Exception:
            continue
        df.index = normalize_ko_index(df.index.to_series())
        df = df[df.index.str.match(r'^K\\d{5}$', na=False)]
        for c in df.columns: df[c] = pd.to_numeric(df[c], errors='coerce')
        dfs.append(df)
    if not dfs:
        raise SystemExit(f"No usable KO tables in {soil_lwm_dir}")
    shot = pd.concat(dfs, axis=1)
    shot = shot.loc[:, ~shot.columns.duplicated()]
    shot = to_cpm(shot)
    keep = [c for c in shot.columns if c.startswith(('Bulk','RAG','RTP'))]
    return shot.loc[:, keep]

def jaccard_series(a, b):
    A = set(a.index[a.values>0]); B = set(b.index[b.values>0])
    return len(A & B) / len(A | B) if (A or B) else np.nan

def main():
    ap = argparse.ArgumentParser(description="Benchmark PICRUSt2 vs shotgun (Mendes soil LWM).")
    ap.add_argument("--base", default=".", help="Project root")
    ap.add_argument("--pred", required=True, help="PICRUSt2 KO unstrat CPM or raw: TSV/TSV.GZ")
    ap.add_argument("--alias-tsv", required=True, help="ENA alias TSV with run_accession, sample_alias")
    ap.add_argument("--shotgun-lwm-dir", required=True, help="Path to Inference_picrust/soil_LWM")
    ap.add_argument("--outdir", default="results", help="Output directory")
    ap.add_argument("--scatter-samples", nargs="*", default=["RTP1","RAG1","BulkTP1"], help="Samples for scatter plots")
    args = ap.parse_args()

    base = os.path.abspath(args.base)
    outdir = os.path.join(base, args.outdir)
    os.makedirs(outdir, exist_ok=True)

    pred_raw = read_picrust2_ko(os.path.join(base, args.pred))
    pred_cpm = to_cpm(pred_raw)

    alias_map = load_alias_map(os.path.join(base, args.alias_tsv))
    pred_named = rename_pred_columns(pred_cpm, alias_map)
    pred_out = os.path.join(outdir, "pred_metagenome_unstrat_cpm_RENAMED.tsv")
    pred_named.to_csv(pred_out, sep="\\t")

    shot = build_shotgun_lwm(os.path.join(base, args.shotgun_lwm_dir))
    shot_out = os.path.join(outdir, "shotgun_KO_LWM.tsv")
    shot.to_csv(shot_out, sep="\\t")

    common_kos = pred_named.index.intersection(shot.index)
    common_samp = pred_named.columns.intersection(shot.columns)
    pred = pred_named.loc[common_kos, common_samp]
    shot = shot.loc[common_kos, common_samp]

    rhos=[]
    for s in common_samp:
        r,_ = spearmanr(pred[s], shot[s], nan_policy='omit')
        rhos.append((s, r))
    overall,_ = spearmanr(pred.values.ravel(), shot.values.ravel(), nan_policy='omit')
    df_rho = pd.DataFrame(rhos, columns=['sample','spearman_rho']).set_index('sample')
    df_rho.to_csv(os.path.join(outdir, "LWM_spearman_per_sample.csv"))

    jacs=[]
    for s in common_samp:
        j = jaccard_series(pred[s], shot[s])
        jacs.append((s, j))
    df_jac = pd.DataFrame(jacs, columns=['sample','jaccard']).set_index('sample')
    df_jac.to_csv(os.path.join(outdir, "LWM_jaccard_per_sample.csv"))

    plt.figure(figsize=(6,4))
    plt.hist(df_rho['spearman_rho'].dropna().values, bins=12)
    plt.xlabel("Spearman $\\rho$ (per sample)"); plt.ylabel("Count")
    plt.title("Mendes soil (LWM): KO Spearman per sample")
    plt.tight_layout(); plt.savefig(os.path.join(outdir, "LWM_spearman_hist.png"), dpi=200); plt.close()

    plt.figure(figsize=(6,4))
    plt.hist(df_jac['jaccard'].dropna().values, bins=12)
    plt.xlabel("Jaccard index (KO presence/absence)"); plt.ylabel("Count")
    plt.title("Mendes soil (LWM): KO Jaccard per sample")
    plt.tight_layout(); plt.savefig(os.path.join(outdir, "LWM_jaccard_hist.png"), dpi=200); plt.close()

    scat_dir = os.path.join(outdir, "scatter_samples"); os.makedirs(scat_dir, exist_ok=True)
    for s in args.scatter_samples:
        if s not in pred.columns or s not in shot.columns: continue
        x = pred[s]; y = shot[s]
        rho,_ = spearmanr(x, y, nan_policy='omit')
        plt.figure(figsize=(5,5))
        plt.scatter(np.log10(x+1), np.log10(y+1), s=8, alpha=0.4)
        plt.plot([0,6],[0,6],'k--',lw=1)
        plt.xlabel("log10 PICRUSt2 KO CPM + 1"); plt.ylabel("log10 Shotgun KO CPM + 1")
        plt.title(f"{s}: Spearman $\\rho$ = {rho:.2f}")
        plt.tight_layout(); plt.savefig(os.path.join(scat_dir, f"{s}_scatter.png"), dpi=300); plt.close()

    print(f"Shared KOs: {len(common_kos)} | Shared samples: {len(common_samp)}")
    print(f"Median Spearman: {float(np.nanmedian(df_rho['spearman_rho'])):.3f} | Overall Spearman: {float(overall):.3f}")
    print(f"Median Jaccard: {float(np.nanmedian(df_jac['jaccard'])):.3f}")
    print("Outputs written to:", outdir)

if __name__ == "__main__":
    main()
