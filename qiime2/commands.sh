
# 1) Import (already demultiplexed — 1 fastq per sample)
qiime tools import \
  --type 'SampleData[PairedEndSequencesWithQuality]' \
  --input-path ../meta/manifest.tsv \
  --output-path demux.qza \
  --input-format PairedEndFastqManifestPhred33V2

