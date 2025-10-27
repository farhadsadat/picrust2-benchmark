(base) farhads-MacBook-Pro:thesis-benchmark farhadsadat$ conda activate qiime2-env
(qiime2-env) farhads-MacBook-Pro:thesis-benchmark farhadsadat$ ROOT="$HOME/thesis-benchmark" 
(qiime2-env) farhads-MacBook-Pro:thesis-benchmark farhadsadat$ mkdir -p "$ROOT/qiime"

(qiime2-env) farhads-MacBook-Pro:thesis-benchmark farhadsadat$ qiime tools import \
>   --type 'SampleData[PairedEndSequencesWithQuality]' \
>   --input-path "$ROOT/manifest.tsv" \
>   --output-path "$ROOT/qiime/demux-pe.qza" \
>   --input-format PairedEndFastqManifestPhred33V2
Imported /Users/farhadsadat/thesis-benchmark/manifest.tsv as PairedEndFastqManifestPhred33V2 to /Users/farhadsadat/thesis-benchmark/qiime/demux-pe.qza

(qiime2-env) farhads-MacBook-Pro:thesis-benchmark farhadsadat$ qiime demux summarize \
>   --i-data "$HOME/thesis-benchmark/qiime/demux-pe.qza" \
>   --o-visualization "$HOME/thesis-benchmark/qiime/demux-pe.qzv"
Saved Visualization to: /Users/farhadsadat/thesis-benchmark/qiime/demux-pe.qzv

