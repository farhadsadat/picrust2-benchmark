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

### 1️⃣ 16S Data Processing (QIIME2)

Performed as **single-end** (forward reads only) due to limited overlap in 2×150 V4 reads.  
No demultiplexing required — samples are already split.

**Commands:** [`qiime2/commands.sh`](qiime2/commands.sh)

Steps:
1. Import with `PairedEndFastqManifestPhred33V2`
2. Trim forward primer (GTGYCAGCMGCCGCGGTAA)
3. DADA2 denoise-single
4. Export representative sequences and feature table

Outputs:
