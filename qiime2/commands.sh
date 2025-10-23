#!/usr/bin/env bash
set -euo pipefail

# QIIME2 — Mendes (PRJEB14409) per Piero’s instructions
# Assumes: meta/manifest.tsv is PairedEndFastqManifestPhred33V2 with absolute paths.

# 1) Import (already demultiplexed — 1 fastq per sample)
qiime tools import \
  --type 'SampleData[PairedEndSequencesWithQuality]' \
  --input-path ../meta/manifest.tsv \
  --output-path demux.qza \
  --input-format PairedEndFastqManifestPhred33V2

qiime demux summarize \
  --i-data demux.qza \
  --o-visualization demux.qzv

# 2) Primer trimming (forward V4 primer) – single-end workflow
qiime cutadapt trim-single \
  --i-demultiplexed-sequences demux.qza \
  --p-front GTGYCAGCMGCCGCGGTAA \
  --p-match-read-wildcards \
  --o-trimmed-sequences demux-trimmed.qza

qiime demux summarize \
  --i-data demux-trimmed.qza \
  --o-visualization demux-trimmed.qzv

# 3) DADA2 single-end (insufficient overlap for 2x150 V4)
qiime dada2 denoise-single \
  --i-demultiplexed-seqs demux-trimmed.qza \
  --p-trunc-len 0 \
  --p-max-ee 10 \
  --p-n-threads 0 \
  --o-table table_se.qza \
  --o-representative-sequences rep-seqs_se.qza \
  --o-denoising-stats denoising-stats_se.qza

# 4) Export for PICRUSt2
mkdir -p export_table_se export_rep_se
qiime tools export --input-path rep-seqs_se.qza --output-path export_rep_se
qiime tools export --input-path table_se.qza    --output-path export_table_se
# outputs: export_rep_se/dna-sequences.fasta, export_table_se/feature-table.biom
