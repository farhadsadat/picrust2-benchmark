#!/usr/bin/env python3
import argparse, gzip, io
from pathlib import Path
import numpy as np
import pandas as pd
import matplotlib
matplotlib.use("Agg")  # safe on macOS/headless
import matplotlib.pyplot as plt
from scipy.stats import spearmanr

# ---------- IO HELPERS ----------
def read_table_safely(path, sep="\t", index_col=0):
    """Robust reader: auto-detect gz/plain; fallback gracefully."""
    p = Path(path).expanduser()
    if not p.exists():
        raise FileNotFoundError(f"File not found: {p}")
    try:
        return pd.read_csv(p, sep=sep, index_col=index_col, compression="infer")
    except Exception:
        try:
            with gzip.open(p, "rb") as fh:
                return pd.read_csv(io.TextIOWrapper(fh, encoding="utf-8"),
                                   sep=sep, index_col=index_col)
        except OSError:
            return pd.read_csv(p, sep=sep, index_col=index_col)

def normalize_ko_id(s: pd.Series) -> pd.Series:
    return (
        s.astype(str)
         .str.strip()
         .str.replace(r"^(ko:|KO:)", "", regex=True)
    )

def coerce_numeric(df: pd.DataFrame) -> pd.DataFrame:
    for c in df.columns:
        df[c] = pd.to_numeric(df[c], errors="coerce")
    return df.fillna(0.0)

def pick_ko_column(df: pd.DataFrame) -> str:
    # common first column names for PICRUSt/shotgun tables
    candidates = ["function", "KO", "ko", "kegg_orthology", "KEGG_Orthology"]
    lower = [c.lower() for c in df.columns]
    for cand in candidates:
        if cand.lower() in lower:
            return df.columns[lower.index(cand.lower())]
    return df.columns[0]

def dedupe_rows_and_cols(df: pd.DataFrame, label: str) -> pd.DataFrame:
    """Collapse duplicate KO rows and remove duplicate columns (sum)."""
    before_rows = df.shape[0]
    dup_rows = int(df.index.duplicated().sum())
    if dup_rows:
        df = df.groupby(level=0).sum()
    dup_cols = int(df.columns.duplicated().sum())
    if dup_cols:
        df = df.loc[:, ~df.columns.duplicated()]
    # Optional: print simple diagnostics
    if dup_rows or dup_cols:
        print(f"[{label}] collapsed duplicates -> rows:{before_rows}→{df.shape[0]}, "
              f"row_dups:{dup_rows}, col_dups:{dup_cols}")
    return df

def read_picrust(path):
    df = read_table_safely(path, sep="\t", index_col=None)
    ko_col = pick_ko_column(df)
    df = df.rename(columns={ko_col: "KO"})
    df["KO"] = normalize_ko_id(df["KO"])
    df = df.set_index("KO")
    df = coerce_numeric(df)
    df = dedupe_rows_and_cols(df, "PICRUSt")
    return df

def read_wgs(path):
    df = read_table_safely(path, sep="\t", index_col=None)
    ko_col = pick_ko_column(df)
    df = df.rename(columns={ko_col: "KO"})
    df["KO"] = normalize_ko_id(df["KO"])
    df = df.set_index("KO")
    df = coerce_numeric(df)
    df = dedupe_rows_and_cols(df, "Shotgun")
    return df

def read_map(path):
    m = pd.read_csv(Path(path).expanduser())
    low = {c.lower(): c for c in m.columns}
    if "err" in low: m = m.rename(columns={low["err"]: "ERR"})
    if "shotgun_id" in low: m = m.rename(columns={low["shotgun_id"]: "shotgun_id"})
    if "ERR" not in m.columns or "shotgun_id" not in m.columns:
        raise ValueError("sample_map.csv must have columns: ERR,shotgun_id")
    m["ERR"] = m["ERR"].astype(str)
    m["shotgun_id"] = m["shotgun_id"].astype(str)
    def grp(s):
        s = s.lower()
        if s.startswith("bulk"): return "Bulk"
        if s.startswith("rag"):  return "RAG"
        if s.startswith("rtp"):  return "RTP"
        return "Other"
    m["group"] = m["shotgun_id"].map(grp)
    return m

# ---------- METRICS & PLOTS ----------
def rel_abund(df):
    return df.divide(df.sum(axis=0).replace(0, np.nan), axis=1).fillna(0.0)

def jaccard(x, y, thresh=0.0):
    xb, yb = x > thresh, y > thresh
    u = np.logical_or(xb, yb).sum()
    return np.nan if u == 0 else np.logical_and(xb, yb).sum() / u

def safe_spearman(x, y):
    # Handles constant arrays -> NaN
    rho = spearmanr(x, y).correlation
    return float(rho) if np.isfinite(rho) else np.nan

def scatter(x, y, label, out_png):
    eps = 1e-9
    X = np.log10(np.asarray(x) + eps)
    Y = np.log10(np.asarray(y) + eps)
    rho = safe_spearman(np.asarray(x), np.asarray(y))
    jac = jaccard(np.asarray(x), np.asarray(y), 0.0)
    plt.figure(figsize=(5, 5))
    plt.scatter(X, Y, s=6, alpha=0.6)
    plt.xlabel("Shotgun KO relative abundance (log10)")
    plt.ylabel("PICRUSt2 KO relative abundance (log10)")
    plt.title(f"{label}\nSpearman={rho:.3f}  Jaccard={jac:.3f}")
    plt.tight_layout()
    Path(out_png).parent.mkdir(parents=True, exist_ok=True)
    plt.savefig(out_png, dpi=200)
    plt.close()
    return rho, jac

def agg_stats(df):
    return pd.Series({
        "n_samples": len(df),
        "spearman_min": np.nanmin(df["spearman"]),
        "spearman_median": np.nanmedian(df["spearman"]),
        "spearman_mean": np.nanmean(df["spearman"]),
        "spearman_max": np.nanmax(df["spearman"]),
        "jaccard_min": np.nanmin(df["jaccard"]),
        "jaccard_median": np.nanmedian(df["jaccard"]),
        "jaccard_mean": np.nanmean(df["jaccard"]),
        "jaccard_max": np.nanmax(df["jaccard"]),
    })

# ---------- MAIN ----------
def main():
    ap = argparse.ArgumentParser(
        description="Make column-wise scatterplots & tables (PICRUSt2 vs Shotgun)."
    )
    ap.add_argument("--picrust", required=True,
                    help="PICRUSt2 KO table (e.g., KO_metagenome_out/pred_metagenome_unstrat.tsv.gz)")
    ap.add_argument("--shotgun", required=True,
                    help="Shotgun KO table (e.g., rhizo_wgs_p.txt)")
    ap.add_argument("--sample-map", required=True,
                    help="CSV with columns: ERR,shotgun_id")
    ap.add_argument("--outdir", required=True, help="Output directory")
    ap.add_argument("--normalize", action="store_true",
                    help="Normalize columns to relative abundance before comparison")
    args = ap.parse_args()

    OUT = Path(args.outdir)
    FIG_DIR = OUT / "figures_scatter"
    OUT.mkdir(parents=True, exist_ok=True)
    FIG_DIR.mkdir(parents=True, exist_ok=True)

    pic = read_picrust(args.picrust)
    wgs = read_wgs(args.shotgun)
    m   = read_map(args.sample_map)

    # guard: ensure unique KO index now
    assert not pic.index.duplicated().any(), "PICRUSt still has duplicate KO IDs after collapse"
    assert not wgs.index.duplicated().any(), "Shotgun still has duplicate KO IDs after collapse"

    # Drop the sample flagged by your prof (no reads after denoising)
    m = m[m["ERR"] != "ERR1456820"].copy()

    # Keep only mapped samples present in both matrices
    pairs = []
    for _, r in m.iterrows():
        if r["ERR"] in pic.columns and r["shotgun_id"] in wgs.columns:
            pairs.append((r["ERR"], r["shotgun_id"], r["group"]))

    if not pairs:
        raise RuntimeError("No matched samples found between PICRUSt and WGS using the provided sample_map.")

    # Normalize if requested
    pic_use = rel_abund(pic) if args.normalize else pic.copy()
    wgs_use = rel_abund(wgs) if args.normalize else wgs.copy()

    # Work on the *union* of KOs (prevents dropping informative zeros)
    kos_union = sorted(set(pic_use.index) | set(wgs_use.index))
    kos_intersection = len(set(pic_use.index) & set(wgs_use.index))

    rows = []
    for err, sg, grp in pairs:
        # Reindex on union so zeros are explicit and aligned
        x = wgs_use.reindex(kos_union).fillna(0.0)[sg].values
        y = pic_use.reindex(kos_union).fillna(0.0)[err].values
        out_png = FIG_DIR / f"scatter_{err}__{sg}.png"
        rho, jac = scatter(x, y, f"{err} vs {sg} ({grp})", out_png)
        rows.append({
            "ERR": err,
            "shotgun_id": sg,
            "group": grp,
            "spearman": rho,
            "jaccard": jac,
            "nonzero_picrust": int((y > 0).sum()),
            "nonzero_shotgun": int((x > 0).sum()),
            "common_kos": kos_intersection,
            "scatter_path": str(out_png)
        })

    res = pd.DataFrame(rows).sort_values(["group", "ERR"]).reset_index(drop=True)
    res_path = OUT / "colwise_metrics_generated.csv"
    res.to_csv(res_path, index=False)

    grp = res.groupby("group", dropna=False).apply(agg_stats).reset_index()
    all_ = agg_stats(res)
    all_ = pd.DataFrame([all_]); all_.insert(0, "group", "ALL")
    grp_all = pd.concat([grp, all_], ignore_index=True)
    grp_path = OUT / "group_stats.csv"
    grp_all.to_csv(grp_path, index=False)

    # LaTeX tables (Chapter 5 ready)
    tex_path = OUT / "chapter5_tables.tex"
    with open(tex_path, "w") as f:
        t = res.copy()
        t["spearman"] = t["spearman"].round(3)
        t["jaccard"]  = t["jaccard"].round(3)
        f.write("\\begin{table}[ht]\n\\centering\n")
        f.write("\\caption{Per-sample similarity between PICRUSt2-inferred and shotgun KO profiles (column-wise).}\n")
        f.write("\\label{tab:per-sample-metrics}\n")
        f.write(t[["ERR","shotgun_id","group","spearman","jaccard",
                   "nonzero_picrust","nonzero_shotgun","common_kos"]].to_latex(index=False))
        f.write("\\end{table}\n\n")

        g = grp_all.copy()
        for c in g.columns:
            if c not in ["group","n_samples"]:
                g[c] = g[c].astype(float).round(3)
        f.write("\\begin{table}[ht]\n\\centering\n")
        f.write("\\caption{Summary statistics of similarity metrics by sample family (Bulk, RAG, RTP).}\n")
        f.write("\\label{tab:group-stats}\n")
        f.write(g.to_latex(index=False))
        f.write("\\end{table}\n")

    print("Done.")
    print(f"Per-sample metrics: {res_path}")
    print(f"Group stats:        {grp_path}")
    print(f"LaTeX tables:       {tex_path}")
    print(f"Scatter plots dir:  {FIG_DIR}")

if __name__ == "__main__":
    main()
