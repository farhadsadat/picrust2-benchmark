#!/usr/bin/env bash
set -euo pipefail

# PICRUSt2 on exported ASVs/table
picrust2_pipeline.py \
  -s ../qiime2/export_rep_se/dna-sequences.fasta \
  -i ../qiime2/export_table_se/feature-table.biom \
  -o out_picrust2_se

# Build per-sample KO metagenome table
# (use uncompressed TSV if your picrust2 version balks at .gz)
metagenome_pipeline.py \
  -i out_picrust2_se/combined_KO_predicted.tsv \
  -f ../qiime2/export_table_se/feature-table.biom \
  -m out_picrust2_se/combined_marker_predicted_and_nsti.tsv \
  -o KO_metagenome_out

# Normalize to CPM (numeric safe)
python - <<'PY'
import os, numpy as np, pandas as pd
fp = 'KO_metagenome_out/pred_metagenome_unstrat.tsv'
df = pd.read_csv(fp, sep='\t', index_col=0)
df_cpm = df.div(df.sum(axis=0).replace(0, np.nan), axis=1) * 1e6
df_cpm.to_csv('KO_metagenome_out/pred_metagenome_unstrat_cpm.tsv', sep='\t')
print("Saved KO CPM:", 'KO_metagenome_out/pred_metagenome_unstrat_cpm.tsv', df_cpm.shape)
PY
