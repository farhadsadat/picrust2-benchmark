(qiime2-env) farhads-MacBook-Pro:mendes16s farhadsadat$ qiime tools import \
>   --type 'SampleData[PairedEndSequencesWithQuality]' \
>   --input-path manifest.tsv \
>   --output-path demux.qza \
>   --input-format PairedEndFastqManifestPhred33V2
Imported manifest.tsv as PairedEndFastqManifestPhred33V2 to demux.qza
(qiime2-env) farhads-MacBook-Pro:mendes16s farhadsadat$ qiime demux summarize \
>   --i-data demux.qza \
>   --o-visualization demux.qzv
Saved Visualization to: demux.qzv
(qiime2-env) farhads-MacBook-Pro:mendes16s farhadsadat$ qiime cutadapt trim-paired \
>   --i-demultiplexed-sequences demux.qza \
>   --p-cores 10 \
>   --p-front-f CCTACGGGNGGCWGCAG \
>   --p-front-r GACTACHVGGGTATCTAATCC \
>   --o-trimmed-sequences demux-trimmed.qza
Saved SampleData[PairedEndSequencesWithQuality] to: demux-trimmed.qza
(qiime2-env) farhads-MacBook-Pro:mendes16s farhadsadat$ qiime demux summarize \
>   --i-data demux-trimmed.qza \
>   --o-visualization demux-trimmed.qzv
Saved Visualization to: demux-trimmed.qzv


(qiime2-env) farhads-MacBook-Pro:mendes16s farhadsadat$ 
(qiime2-env) farhads-MacBook-Pro:mendes16s farhadsadat$ qiime dada2 denoise-paired \
>   --i-demultiplexed-seqs demux-trimmed.qza \
>   --p-trunc-len-f 250 \
>   --p-trunc-len-r 190 \
>   --p-max-ee-f 4 \
>   --p-max-ee-r 4 \
>   --p-min-overlap 12 \
>   --p-n-threads 0 \
>   --o-table table.qza \
>   --o-representative-sequences rep-seqs.qza \
>   --o-denoising-stats denoising-stats.qza \
>   --verbose
Running external command line application(s). This may print messages to stdout and/or stderr.
The command(s) being run are below. These commands cannot be manually re-run as they will depend on temporary files that no longer exist.

Command: run_dada.R --input_directory /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmp3vnodavm/forward --input_directory_reverse /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmp3vnodavm/reverse --output_path /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmp3vnodavm/output.tsv.biom --output_track /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmp3vnodavm/track.tsv --filtered_directory /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmp3vnodavm/filt_f --filtered_directory_reverse /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmp3vnodavm/filt_r --truncation_length 250 --truncation_length_reverse 190 --trim_left 0 --trim_left_reverse 0 --max_expected_errors 4 --max_expected_errors_reverse 4 --truncation_quality_score 2 --min_overlap 12 --pooling_method independent --chimera_method consensus --min_parental_fold 1.0 --allow_one_off False --num_threads 0 --learn_min_reads 1000000

Messaggio di avvertimento:
il pacchetto ‘optparse’ è stato creato con R versione 4.2.3 
R version 4.2.2 (2022-10-31) 
Caricamento del pacchetto richiesto: Rcpp
DADA2: 1.26.0 / Rcpp: 1.0.12 / RcppParallel: 5.1.6 
2) Filtering ........................................
3) Learning Error Rates
275478250 total bases in 1101913 reads from 11 samples will be used for learning the error rates.
209363470 total bases in 1101913 reads from 11 samples will be used for learning the error rates.
3) Denoise samples ........................................
........................................
5) Remove chimeras (method = consensus)
6) Report read numbers through the pipeline
7) Write output
Saved FeatureTable[Frequency] to: table.qza
Saved FeatureData[Sequence] to: rep-seqs.qza
Saved SampleData[DADA2Stats] to: denoising-stats.qza

(qiime2-env) farhads-MacBook-Pro:mendes16s farhadsadat$ qiime feature-table summarize \
>   --i-table table.qza \
>   --o-visualization table.qzv
Saved Visualization to: table.qzv
(qiime2-env) farhads-MacBook-Pro:mendes16s farhadsadat$ qiime feature-table tabulate-seqs \
>   --i-data rep-seqs.qza \
>   --o-visualization rep-seqs.qzv
Saved Visualization to: rep-seqs.qzv
(qiime2-env) farhads-MacBook-Pro:mendes16s farhadsadat$ qiime metadata tabulate \
>   --m-input-file denoising-stats.qza \
>   --o-visualization denoising-stats.qzv
Saved Visualization to: denoising-stats.qzv

(qiime2-env) farhads-MacBook-Pro:mendes16s farhadsadat$ printf "sampleid\nERR1456820\n" > bad-samples.tsv


(qiime2-env) farhads-MacBook-Pro:mendes16s farhadsadat$ qiime feature-table filter-samples \
>   --i-table table.qza \
>   --m-metadata-file bad-samples.tsv \
>   --p-exclude-ids \
>   --o-filtered-table table.filtered.qza
Saved FeatureTable[Frequency] to: table.filtered.qza

(qiime2-env) farhads-MacBook-Pro:mendes16s farhadsadat$ qiime feature-table filter-seqs \
>   --i-data rep-seqs.qza \
>   --i-table table.filtered.qza \
>   --o-filtered-data rep-seqs.filtered.qza
Saved FeatureData[Sequence] to: rep-seqs.filtered.qza



(qiime2-env) farhads-MacBook-Pro:mendes16s farhadsadat$ qiime feature-table summarize --i-table table.filtered.qza --o-visualization table.filtered.qzv
Saved Visualization to: table.filtered.qzv
(qiime2-env) farhads-MacBook-Pro:mendes16s farhadsadat$ rm -rf export-table export-seqs
(qiime2-env) farhads-MacBook-Pro:mendes16s farhadsadat$ qiime tools export \
>   --input-path table.filtered.qza \
>   --output-path export-table

Exported table.filtered.qza as BIOMV210DirFmt to directory export-table
(qiime2-env) farhads-MacBook-Pro:mendes16s farhadsadat$ 
(qiime2-env) farhads-MacBook-Pro:mendes16s farhadsadat$ qiime tools export \
>   --input-path rep-seqs.filtered.qza \
>   --output-path export-seqs
Exported rep-seqs.filtered.qza as DNASequencesDirectoryFormat to directory export-seqs