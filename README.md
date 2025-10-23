# picrust2-benchmark
Benchmarking PICRUSt2 functional inference on Mendes et al. (2017) soil microbiome dataset (PRJEB14409) against shotgun metagenomes (soil_LWM) as described in Sun et al. 2020. Includes full reproducible workflow in QIIME2 + PICRUSt2, sample alias mapping, and Spearman/Jaccard benchmarking pipeline with visual and presentation outputs.

# Mendes16S–PICRUSt2 Benchmark

**Benchmarking PICRUSt2 functional inference on Mendes et al. (2017) soil microbiome dataset (PRJEB14409) against shotgun metagenomes (soil_LWM), following the benchmark by Sun et al. (2020).**

This repository reproduces the comparison between 16S-based functional inference (PICRUSt2) and shotgun KO abundances using the Mendes soil dataset.  
All steps are reproducible — from QIIME2 preprocessing, PICRUSt2 predictions, to KO-level benchmarking and visualization.

---

## 🔍 Overview

| Component | Tool / Source | Notes |
|------------|----------------|-------|
| 16S rRNA data | ENA: [PRJEB14409](https://www.ebi.ac.uk/ena/browser/view/PRJEB14409) | Mendes et al. 2017 – Soil microbiome |
| Shotgun KO table | [ssun6/Inference_picrust](https://github.com/ssun6/Inference_picrust) | Use **soil_LWM** only |
| Benchmark reference | [Sun et al., *Microbiome* (2020)](https://doi.org/10.1186/s40168-020-00815-y) | Evaluated PICRUSt, PICRUSt2, Tax4Fun |
| Metrics | Spearman ρ, Jaccard similarity | Between 16S-predicted and shotgun KO tables |

---

## 🧪 Pipeline Summary

# Mendes (2017) – Soil LWM | PICRUSt2 vs Shotgun benchmark

**Goal.** Reproduce Sun et al. (2020) soil (Mendes) benchmark: compare PICRUSt2 KO predictions from 16S to shotgun KO (soil_LWM). Metrics: per-sample & overall **Spearman**, and **Jaccard** over KO presence/absence.

## Data
- 16S: ENA PRJEB14409 (demultiplexed).  
- Shotgun KO: `Inference_picrust/soil_LWM/` from `ssun6/Inference_picrust` (do **not** mix with soil_AAN).
- ENA alias map: `meta/PRJEB14409_runs_with_alias.tsv` (run_accession → sample_alias).

## 1) QIIME2 (single-end)
See `qiime2/commands.sh`. Key points:
- Import with **PairedEndFastqManifestPhred33V2** (already demultiplexed)
- Forward primer trim (V4) → **dada2 denoise-single**
- Export `dna-sequences.fasta` and `feature-table.biom`

## 2) PICRUSt2
See `picrust2_se/commands.sh`:
- `picrust2_pipeline.py` → combined KO & marker predictions
- `metagenome_pipeline.py` → per-sample KO; CPM normalization

## 3) Benchmark vs shotgun (soil_LWM)
Run:
```bash
python analysis/benchmark_mendes_soil.py \
  --base . \
  --pred picrust2_se/KO_metagenome_out/pred_metagenome_unstrat_cpm.tsv \
  --alias-tsv meta/PRJEB14409_runs_with_alias.tsv \
  --shotgun-lwm-dir Inference_picrust/soil_LWM \
  --outdir results \
  --scatter-samples RTP1 BulkTP1 RAG1

