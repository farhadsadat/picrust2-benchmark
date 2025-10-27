ROOT="$HOME/thesis-benchmark/mendes16s"
(qiime2-env) farhads-MacBook-Pro:thesis-benchmark farhadsadat$ mkdir -p "$ROOT/qiime"
(qiime2-env) farhads-MacBook-Pro:thesis-benchmark farhadsadat$ qiime tools import   --type 'SampleData[PairedEndSequencesWithQuality]'   --input-path "$HOME/thesis-benchmark/mendes16s/manifest.tsv"   --output-path "$HOME/thesis-benchmark/mendes16s/qiime/demux-pe.qza"   --input-format PairedEndFastqManifestPhred33V2
Imported /Users/farhadsadat/thesis-benchmark/mendes16s/manifest.tsv as PairedEndFastqManifestPhred33V2 to /Users/farhadsadat/thesis-benchmark/mendes16s/qiime/demux-pe.qza

ROOT="$HOME/thesis-benchmark/mendes16s"

qiime demux summarize \
  --i-data "$ROOT/qiime/demux-pe.qza" \
  --o-visualization "$ROOT/qiime/demux-pe.qzv"

  (qiime2-env) farhads-MacBook-Pro:thesis-benchmark farhadsadat$
  qiime dada2 denoise-paired 
  --i-demultiplexed-seqs
  "$ROOT/qiime/demux-pe.qza"
  --p-trim-left-f 0
  --p-trim-left-r 0
  --p-trunc-len-f 240
  --p-trunc-len-r 150
  --p-n-threads 0
  --o-table "$ROOT/qiime/table.qza"
  --o-representative-sequences
  "$ROOT/qiime/rep-seqs.qza"
  --o-denoising-stats
  "$ROOT/qiime/denoise-stats.qza"

Saved FeatureTable[Frequency] to: /Users/farhadsadat/thesis-benchmark/mendes16s/qiime/table.qza
Saved FeatureData[Sequence] to: /Users/farhadsadat/thesis-benchmark/mendes16s/qiime/rep-seqs.qza
Saved SampleData[DADA2Stats] to: /Users/farhadsadat/thesis-benchmark/mendes16s/qiime/denoise-stats.qza


(qiime2-env) farhads-MacBook-Pro:thesis-benchmark farhadsadat$ qiime feature-table summarize \
>   --i-table "$ROOT/qiime/table.qza" \
>   --o-visualization "$ROOT/qiime/table.qzv"
Saved Visualization to: /Users/farhadsadat/thesis-benchmark/mendes16s/qiime/table.qzv
(qiime2-env) farhads-MacBook-Pro:thesis-benchmark farhadsadat$ 
(qiime2-env) farhads-MacBook-Pro:thesis-benchmark farhadsadat$ qiime feature-table tabulate-seqs \
>   --i-data "$ROOT/qiime/rep-seqs.qza" \
>   --o-visualization "$ROOT/qiime/rep-seqs.qzv"
Saved Visualization to: /Users/farhadsadat/thesis-benchmark/mendes16s/qiime/rep-seqs.qzv
(qiime2-env) farhads-MacBook-Pro:thesis-benchmark farhadsadat$ 
(qiime2-env) farhads-MacBook-Pro:thesis-benchmark farhadsadat$ qiime metadata tabulate \
>   --m-input-file "$ROOT/qiime/denoise-stats.qza" \
>   --o-visualization "$ROOT/qiime/denoise-stats.qzv"
Saved Visualization to: /Users/farhadsadat/thesis-benchmark/mendes16s/qiime/denoise-stats.qzv
