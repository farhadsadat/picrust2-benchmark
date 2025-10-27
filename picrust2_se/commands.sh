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



---------------new----------

(picrust2) farhads-MacBook-Pro:thesis-benchmark farhadsadat$ picrust2_pipeline.py \
>   -s "$ROOT/qiime/exported_rep_seqs/dna-sequences.fasta" \
>   -i "$ROOT/qiime/exported_table/feature-table.biom" \
>   -o "$ROOT/../picrust2/picrust2_out" \
>   -p 4 --verbose
60 of 60 sequence ids overlap between input table and FASTA.

60 ASVs in the input FASTA. None of the sequence ids are duplicated.

Placing sequences onto reference tree
place_seqs.py --study_fasta /Users/farhadsadat/thesis-benchmark/mendes16s/qiime/exported_rep_seqs/dna-sequences.fasta --ref_dir /opt/miniconda3/envs/picrust2/lib/python3.9/site-packages/picrust2/default_files/bacteria/bac_ref --out_tree /Users/farhadsadat/thesis-benchmark/mendes16s/../picrust2/picrust2_out/bac.tre --processes 4 --intermediate /Users/farhadsadat/thesis-benchmark/mendes16s/../picrust2/picrust2_out/intermediate/place_seqs_bac --min_align 0.8 --chunk_size 5000 --placement_tool epa-ng --verbose

INFO Selected: Output dir: /Users/farhadsadat/thesis-benchmark/mendes16s/../picrust2/picrust2_out/intermediate/place_seqs_bac/epa_out/
INFO Selected: Query file: /Users/farhadsadat/thesis-benchmark/mendes16s/../picrust2/picrust2_out/intermediate/place_seqs_bac/study_seqs_hmmalign.fasta
INFO Selected: Tree file: /opt/miniconda3/envs/picrust2/lib/python3.9/site-packages/picrust2/default_files/bacteria/bac_ref/bac_ref.tre
INFO Selected: Reference MSA: /Users/farhadsadat/thesis-benchmark/mendes16s/../picrust2/picrust2_out/intermediate/place_seqs_bac/ref_seqs_hmmalign.fasta
INFO Selected: Filtering by accumulated threshold: 0.99
INFO Selected: Maximum number of placements per query: 100
INFO Selected: Automatic switching of use of per rate scalers
INFO Selected: Preserving the root of the input tree
INFO Selected: Specified model file: /opt/miniconda3/envs/picrust2/lib/python3.9/site-packages/picrust2/default_files/bacteria/bac_ref/bac_ref.model
INFO Selected: Reading queries in chunks of: 5000
INFO Selected: Using threads: 4
INFO     ______ ____   ___           _   __ ______
        / ____// __ \ /   |         / | / // ____/
       / __/  / /_/ // /| | ______ /  |/ // / __  
      / /___ / ____// ___ |/_____// /|  // /_/ /  
     /_____//_/    /_/  |_|      /_/ |_/ \____/ (v0.3.8)
INFO Using model parameters:
INFO    Rate heterogeneity: GAMMA (4 cats, mean),  alpha: 0.408013 (user),  weights&rates: (0.25,0.0178872) (0.25,0.187716) (0.25,0.739808) (0.25,3.05459) 
        Base frequencies (user): 0.209289 0.232667 0.311531 0.246513 
        Substitution rates (user): 1.04872 2.92815 1.63887 0.831209 3.68952 1
INFO Output file: /Users/farhadsadat/thesis-benchmark/mendes16s/../picrust2/picrust2_out/intermediate/place_seqs_bac/epa_out/epa_result.jplace
INFO 60 Sequences done!
INFO Time spent placing: 28s
INFO Elapsed Time: 33s

                                              ....      ....  
                                             '' '||.   .||'   
                                                  ||  ||      
                                                  '|.|'       
     ...'   ....   ... ...  ... ...   ....        .|'|.       
    |  ||  '' .||   ||'  ||  ||'  || '' .||      .|'  ||      
     |''   .|' ||   ||    |  ||    | .|' ||     .|'|.  ||     
    '....  '|..'|'. ||...'   ||...'  '|..'|.    '||'    ||:.  
    '....'          ||       ||                               
                   ''''     ''''   v0.8.5 (c) 2017-2024
                                   by Lucas Czech and Pierre Barbera

Invocation:                        gappa examine graft --jplace-path /Users/farhadsadat/thesis-benchmark/mendes16s/../picrust2/picrust2_out/intermediate/place_seqs_bac/epa_out/epa_result_parsed.jplace --fully-resolve --out-dir /Users/farhadsadat/thesis-benchmark/mendes16s/../picrust2/picrust2_out/intermediate/place_seqs_bac/epa_out
Command:                           gappa examine graft

Input:
  --jplace-path                    /Users/farhadsadat/thesis-benchmark/mendes16s/../picrust2/picrust2_out/intermediate/place_seqs_bac/epa_out/epa_result_parsed.jplace

Settings:
  --fully-resolve                  true
  --name-prefix

Output:
  --out-dir                        /Users/farhadsadat/thesis-benchmark/mendes16s/../picrust2/picrust2_out/intermediate/place_seqs_bac/epa_out
  --file-prefix                    
  --file-suffix

Newick Tree Output:
  --newick-tree-quote-invalid-chars
                                   false

Global Options:
  --allow-file-overwriting         false
  --verbose                        false
  --threads                        4
  --log-file

Run the following command to get the references that need to be cited:
`gappa tools citation Czech2020-genesis-and-gappa`

Started 2025-10-27 23:20:43

Found 1 jplace file

Finished 2025-10-27 23:20:44


hmmalign --trim --dna --mapali /opt/miniconda3/envs/picrust2/lib/python3.9/site-packages/picrust2/default_files/bacteria/bac_ref/bac_ref.fna --informat FASTA -o /Users/farhadsadat/thesis-benchmark/mendes16s/../picrust2/picrust2_out/intermediate/place_seqs_bac/query_align.stockholm /opt/miniconda3/envs/picrust2/lib/python3.9/site-packages/picrust2/default_files/bacteria/bac_ref/bac_ref.hmm /Users/farhadsadat/thesis-benchmark/mendes16s/qiime/exported_rep_seqs/dna-sequences.fasta

Raw input sequences ranged in length from 298 to 299

epa-ng --tree /opt/miniconda3/envs/picrust2/lib/python3.9/site-packages/picrust2/default_files/bacteria/bac_ref/bac_ref.tre --ref-msa /Users/farhadsadat/thesis-benchmark/mendes16s/../picrust2/picrust2_out/intermediate/place_seqs_bac/ref_seqs_hmmalign.fasta --query /Users/farhadsadat/thesis-benchmark/mendes16s/../picrust2/picrust2_out/intermediate/place_seqs_bac/study_seqs_hmmalign.fasta --chunk-size 5000 -T 4 -m /opt/miniconda3/envs/picrust2/lib/python3.9/site-packages/picrust2/default_files/bacteria/bac_ref/bac_ref.model -w /Users/farhadsadat/thesis-benchmark/mendes16s/../picrust2/picrust2_out/intermediate/place_seqs_bac/epa_out --filter-acc-lwr 0.99 --filter-max 100

gappa examine graft --jplace-path /Users/farhadsadat/thesis-benchmark/mendes16s/../picrust2/picrust2_out/intermediate/place_seqs_bac/epa_out/epa_result_parsed.jplace --fully-resolve --out-dir /Users/farhadsadat/thesis-benchmark/mendes16s/../picrust2/picrust2_out/intermediate/place_seqs_bac/epa_out

mv /Users/farhadsadat/thesis-benchmark/mendes16s/../picrust2/picrust2_out/intermediate/place_seqs_bac/epa_out/epa_result_parsed.newick /Users/farhadsadat/thesis-benchmark/mendes16s/../picrust2/picrust2_out/bac.tre

Finished placing sequences on output tree for reference 1: /Users/farhadsadat/thesis-benchmark/mendes16s/../picrust2/picrust2_out/bac.tre
place_seqs.py --study_fasta /Users/farhadsadat/thesis-benchmark/mendes16s/qiime/exported_rep_seqs/dna-sequences.fasta --ref_dir /opt/miniconda3/envs/picrust2/lib/python3.9/site-packages/picrust2/default_files/archaea/arc_ref --out_tree /Users/farhadsadat/thesis-benchmark/mendes16s/../picrust2/picrust2_out/arc.tre --processes 4 --intermediate /Users/farhadsadat/thesis-benchmark/mendes16s/../picrust2/picrust2_out/intermediate/place_seqs_arc --min_align 0.8 --chunk_size 5000 --placement_tool epa-ng --verbose

INFO Selected: Output dir: /Users/farhadsadat/thesis-benchmark/mendes16s/../picrust2/picrust2_out/intermediate/place_seqs_arc/epa_out/
INFO Selected: Query file: /Users/farhadsadat/thesis-benchmark/mendes16s/../picrust2/picrust2_out/intermediate/place_seqs_arc/study_seqs_hmmalign.fasta
INFO Selected: Tree file: /opt/miniconda3/envs/picrust2/lib/python3.9/site-packages/picrust2/default_files/archaea/arc_ref/arc_ref.tre
INFO Selected: Reference MSA: /Users/farhadsadat/thesis-benchmark/mendes16s/../picrust2/picrust2_out/intermediate/place_seqs_arc/ref_seqs_hmmalign.fasta
INFO Selected: Filtering by accumulated threshold: 0.99
INFO Selected: Maximum number of placements per query: 100
INFO Selected: Automatic switching of use of per rate scalers
INFO Selected: Preserving the root of the input tree
INFO Selected: Specified model file: /opt/miniconda3/envs/picrust2/lib/python3.9/site-packages/picrust2/default_files/archaea/arc_ref/arc_ref.model
INFO Selected: Reading queries in chunks of: 5000
INFO Selected: Using threads: 4
INFO     ______ ____   ___           _   __ ______
        / ____// __ \ /   |         / | / // ____/
       / __/  / /_/ // /| | ______ /  |/ // / __  
      / /___ / ____// ___ |/_____// /|  // /_/ /  
     /_____//_/    /_/  |_|      /_/ |_/ \____/ (v0.3.8)
INFO Using model parameters:
INFO    Rate heterogeneity: GAMMA (4 cats, mean),  alpha: 0.509646 (user),  weights&rates: (0.25,0.0351892) (0.25,0.258166) (0.25,0.827162) (0.25,2.87948) 
        Base frequencies (user): 0.224411 0.252166 0.284495 0.238928 
        Substitution rates (user): 1.16611 4.36836 1.83214 1.0193 5.96274 1
INFO Output file: /Users/farhadsadat/thesis-benchmark/mendes16s/../picrust2/picrust2_out/intermediate/place_seqs_arc/epa_out/epa_result.jplace
INFO 60 Sequences done!
INFO Time spent placing: 0s
INFO Elapsed Time: 0s

                                              ....      ....  
                                             '' '||.   .||'   
                                                  ||  ||      
                                                  '|.|'       
     ...'   ....   ... ...  ... ...   ....        .|'|.       
    |  ||  '' .||   ||'  ||  ||'  || '' .||      .|'  ||      
     |''   .|' ||   ||    |  ||    | .|' ||     .|'|.  ||     
    '....  '|..'|'. ||...'   ||...'  '|..'|.    '||'    ||:.  
    '....'          ||       ||                               
                   ''''     ''''   v0.8.5 (c) 2017-2024
                                   by Lucas Czech and Pierre Barbera

Invocation:                        gappa examine graft --jplace-path /Users/farhadsadat/thesis-benchmark/mendes16s/../picrust2/picrust2_out/intermediate/place_seqs_arc/epa_out/epa_result_parsed.jplace --fully-resolve --out-dir /Users/farhadsadat/thesis-benchmark/mendes16s/../picrust2/picrust2_out/intermediate/place_seqs_arc/epa_out
Command:                           gappa examine graft

Input:
  --jplace-path                    /Users/farhadsadat/thesis-benchmark/mendes16s/../picrust2/picrust2_out/intermediate/place_seqs_arc/epa_out/epa_result_parsed.jplace

Settings:
  --fully-resolve                  true
  --name-prefix

Output:
  --out-dir                        /Users/farhadsadat/thesis-benchmark/mendes16s/../picrust2/picrust2_out/intermediate/place_seqs_arc/epa_out
  --file-prefix                    
  --file-suffix

Newick Tree Output:
  --newick-tree-quote-invalid-chars
                                   false

Global Options:
  --allow-file-overwriting         false
  --verbose                        false
  --threads                        4
  --log-file

Run the following command to get the references that need to be cited:
`gappa tools citation Czech2020-genesis-and-gappa`

Started 2025-10-27 23:20:50

Found 1 jplace file

Finished 2025-10-27 23:20:50


hmmalign --trim --dna --mapali /opt/miniconda3/envs/picrust2/lib/python3.9/site-packages/picrust2/default_files/archaea/arc_ref/arc_ref.fna --informat FASTA -o /Users/farhadsadat/thesis-benchmark/mendes16s/../picrust2/picrust2_out/intermediate/place_seqs_arc/query_align.stockholm /opt/miniconda3/envs/picrust2/lib/python3.9/site-packages/picrust2/default_files/archaea/arc_ref/arc_ref.hmm /Users/farhadsadat/thesis-benchmark/mendes16s/qiime/exported_rep_seqs/dna-sequences.fasta

Raw input sequences ranged in length from 298 to 299

epa-ng --tree /opt/miniconda3/envs/picrust2/lib/python3.9/site-packages/picrust2/default_files/archaea/arc_ref/arc_ref.tre --ref-msa /Users/farhadsadat/thesis-benchmark/mendes16s/../picrust2/picrust2_out/intermediate/place_seqs_arc/ref_seqs_hmmalign.fasta --query /Users/farhadsadat/thesis-benchmark/mendes16s/../picrust2/picrust2_out/intermediate/place_seqs_arc/study_seqs_hmmalign.fasta --chunk-size 5000 -T 4 -m /opt/miniconda3/envs/picrust2/lib/python3.9/site-packages/picrust2/default_files/archaea/arc_ref/arc_ref.model -w /Users/farhadsadat/thesis-benchmark/mendes16s/../picrust2/picrust2_out/intermediate/place_seqs_arc/epa_out --filter-acc-lwr 0.99 --filter-max 100

gappa examine graft --jplace-path /Users/farhadsadat/thesis-benchmark/mendes16s/../picrust2/picrust2_out/intermediate/place_seqs_arc/epa_out/epa_result_parsed.jplace --fully-resolve --out-dir /Users/farhadsadat/thesis-benchmark/mendes16s/../picrust2/picrust2_out/intermediate/place_seqs_arc/epa_out

mv /Users/farhadsadat/thesis-benchmark/mendes16s/../picrust2/picrust2_out/intermediate/place_seqs_arc/epa_out/epa_result_parsed.newick /Users/farhadsadat/thesis-benchmark/mendes16s/../picrust2/picrust2_out/arc.tre

Finished placing sequences on output tree for reference 2: /Users/farhadsadat/thesis-benchmark/mendes16s/../picrust2/picrust2_out/arc.tre
hsp.py --tree /Users/farhadsadat/thesis-benchmark/mendes16s/../picrust2/picrust2_out/bac.tre --output /Users/farhadsadat/thesis-benchmark/mendes16s/../picrust2/picrust2_out/bac_marker_predicted_and_nsti.tsv.gz --observed_trait_table /opt/miniconda3/envs/picrust2/lib/python3.9/site-packages/picrust2/default_files/bacteria/16S.txt.gz --hsp_method mp --edge_exponent 0.5 --seed 100 --calculate_NSTI --processes 1 --verbose



Rscript /opt/miniconda3/envs/picrust2/lib/python3.9/site-packages/picrust2/Rscripts/castor_nsti.R /Users/farhadsadat/thesis-benchmark/mendes16s/../picrust2/picrust2_out/bac.tre /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpwb20ypyl/known_tips.txt /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpwb20ypyl/nsti_out.txt

Rscript /opt/miniconda3/envs/picrust2/lib/python3.9/site-packages/picrust2/Rscripts/castor_hsp.R /Users/farhadsadat/thesis-benchmark/mendes16s/../picrust2/picrust2_out/bac.tre /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpa92xm7qq/subset_tab_0 mp 0.5 FALSE FALSE /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpl614drxq/predicted_counts.txt /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpl614drxq/predicted_ci.txt 100


hsp.py --tree /Users/farhadsadat/thesis-benchmark/mendes16s/../picrust2/picrust2_out/arc.tre --output /Users/farhadsadat/thesis-benchmark/mendes16s/../picrust2/picrust2_out/arc_marker_predicted_and_nsti.tsv.gz --observed_trait_table /opt/miniconda3/envs/picrust2/lib/python3.9/site-packages/picrust2/default_files/archaea/16S.txt.gz --hsp_method mp --edge_exponent 0.5 --seed 100 --calculate_NSTI --processes 1 --verbose



Rscript /opt/miniconda3/envs/picrust2/lib/python3.9/site-packages/picrust2/Rscripts/castor_nsti.R /Users/farhadsadat/thesis-benchmark/mendes16s/../picrust2/picrust2_out/arc.tre /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpy2h6aj6s/known_tips.txt /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpy2h6aj6s/nsti_out.txt

Rscript /opt/miniconda3/envs/picrust2/lib/python3.9/site-packages/picrust2/Rscripts/castor_hsp.R /Users/farhadsadat/thesis-benchmark/mendes16s/../picrust2/picrust2_out/arc.tre /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmp7scp917x/subset_tab_0 mp 0.5 FALSE FALSE /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpmcbzyjuc/predicted_counts.txt /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpmcbzyjuc/predicted_ci.txt 100


Finished getting marker and NSTI predictions for both domains: /Users/farhadsadat/thesis-benchmark/mendes16s/../picrust2/picrust2_out/bac_marker_predicted_and_nsti.tsv.gz, /Users/farhadsadat/thesis-benchmark/mendes16s/../picrust2/picrust2_out/arc_marker_predicted_and_nsti.tsv.gz
Now finding the best one for each sequence.
Picking the best domains for all sequences.
60 sequences were kept for bac
0 sequences were kept for arc
Don't have any arc in the study sequences. Continuing with only bac
Finished getting the best domain match for each sequence: /Users/farhadsadat/thesis-benchmark/mendes16s/../picrust2/picrust2_out/combined_marker_predicted_and_nsti.tsv.gz Now running hsp.py for the reduced reference sets.
hsp.py --tree /Users/farhadsadat/thesis-benchmark/mendes16s/../picrust2/picrust2_out/bac_reduced.tre --output /Users/farhadsadat/thesis-benchmark/mendes16s/../picrust2/picrust2_out/bac_EC_predicted.tsv.gz --observed_trait_table /opt/miniconda3/envs/picrust2/lib/python3.9/site-packages/picrust2/default_files/bacteria/ec.txt.gz --hsp_method mp --edge_exponent 0.5 --seed 100 --processes 4 --verbose









Rscript /opt/miniconda3/envs/picrust2/lib/python3.9/site-packages/picrust2/Rscripts/castor_hsp.R /Users/farhadsadat/thesis-benchmark/mendes16s/../picrust2/picrust2_out/bac_reduced.tre /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpa42btbao/subset_tab_1 mp 0.5 FALSE FALSE /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpj3lvndl9/predicted_counts.txt /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpj3lvndl9/predicted_ci.txt 100
Rscript /opt/miniconda3/envs/picrust2/lib/python3.9/site-packages/picrust2/Rscripts/castor_hsp.R /Users/farhadsadat/thesis-benchmark/mendes16s/../picrust2/picrust2_out/bac_reduced.tre /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpa42btbao/subset_tab_0 mp 0.5 FALSE FALSE /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpzrgkmup0/predicted_counts.txt /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpzrgkmup0/predicted_ci.txt 100
Rscript /opt/miniconda3/envs/picrust2/lib/python3.9/site-packages/picrust2/Rscripts/castor_hsp.R /Users/farhadsadat/thesis-benchmark/mendes16s/../picrust2/picrust2_out/bac_reduced.tre /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpa42btbao/subset_tab_2 mp 0.5 FALSE FALSE /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpm9lqq83b/predicted_counts.txt /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpm9lqq83b/predicted_ci.txt 100
Rscript /opt/miniconda3/envs/picrust2/lib/python3.9/site-packages/picrust2/Rscripts/castor_hsp.R /Users/farhadsadat/thesis-benchmark/mendes16s/../picrust2/picrust2_out/bac_reduced.tre /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpa42btbao/subset_tab_3 mp 0.5 FALSE FALSE /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpfv1fxdoo/predicted_counts.txt /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpfv1fxdoo/predicted_ci.txt 100

Rscript /opt/miniconda3/envs/picrust2/lib/python3.9/site-packages/picrust2/Rscripts/castor_hsp.R /Users/farhadsadat/thesis-benchmark/mendes16s/../picrust2/picrust2_out/bac_reduced.tre /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpa42btbao/subset_tab_4 mp 0.5 FALSE FALSE /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmprqito85d/predicted_counts.txt /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmprqito85d/predicted_ci.txt 100

Rscript /opt/miniconda3/envs/picrust2/lib/python3.9/site-packages/picrust2/Rscripts/castor_hsp.R /Users/farhadsadat/thesis-benchmark/mendes16s/../picrust2/picrust2_out/bac_reduced.tre /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpa42btbao/subset_tab_5 mp 0.5 FALSE FALSE /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpmq3vqu4m/predicted_counts.txt /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpmq3vqu4m/predicted_ci.txt 100

Rscript /opt/miniconda3/envs/picrust2/lib/python3.9/site-packages/picrust2/Rscripts/castor_hsp.R /Users/farhadsadat/thesis-benchmark/mendes16s/../picrust2/picrust2_out/bac_reduced.tre /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpa42btbao/subset_tab_6 mp 0.5 FALSE FALSE /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpv_uwu_ea/predicted_counts.txt /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpv_uwu_ea/predicted_ci.txt 100

Rscript /opt/miniconda3/envs/picrust2/lib/python3.9/site-packages/picrust2/Rscripts/castor_hsp.R /Users/farhadsadat/thesis-benchmark/mendes16s/../picrust2/picrust2_out/bac_reduced.tre /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpa42btbao/subset_tab_7 mp 0.5 FALSE FALSE /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpj7bgst6b/predicted_counts.txt /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpj7bgst6b/predicted_ci.txt 100





hsp.py --tree /Users/farhadsadat/thesis-benchmark/mendes16s/../picrust2/picrust2_out/bac_reduced.tre --output /Users/farhadsadat/thesis-benchmark/mendes16s/../picrust2/picrust2_out/bac_KO_predicted.tsv.gz --observed_trait_table /opt/miniconda3/envs/picrust2/lib/python3.9/site-packages/picrust2/default_files/bacteria/ko.txt.gz --hsp_method mp --edge_exponent 0.5 --seed 100 --processes 4 --verbose





























Rscript /opt/miniconda3/envs/picrust2/lib/python3.9/site-packages/picrust2/Rscripts/castor_hsp.R /Users/farhadsadat/thesis-benchmark/mendes16s/../picrust2/picrust2_out/bac_reduced.tre /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmp8kamd4d3/subset_tab_2 mp 0.5 FALSE FALSE /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmprhv3kskj/predicted_counts.txt /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmprhv3kskj/predicted_ci.txt 100
Rscript /opt/miniconda3/envs/picrust2/lib/python3.9/site-packages/picrust2/Rscripts/castor_hsp.R /Users/farhadsadat/thesis-benchmark/mendes16s/../picrust2/picrust2_out/bac_reduced.tre /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmp8kamd4d3/subset_tab_1 mp 0.5 FALSE FALSE /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpnjyy5nyb/predicted_counts.txt /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpnjyy5nyb/predicted_ci.txt 100
Rscript /opt/miniconda3/envs/picrust2/lib/python3.9/site-packages/picrust2/Rscripts/castor_hsp.R /Users/farhadsadat/thesis-benchmark/mendes16s/../picrust2/picrust2_out/bac_reduced.tre /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmp8kamd4d3/subset_tab_0 mp 0.5 FALSE FALSE /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmp_nzjh_hn/predicted_counts.txt /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmp_nzjh_hn/predicted_ci.txt 100
Rscript /opt/miniconda3/envs/picrust2/lib/python3.9/site-packages/picrust2/Rscripts/castor_hsp.R /Users/farhadsadat/thesis-benchmark/mendes16s/../picrust2/picrust2_out/bac_reduced.tre /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmp8kamd4d3/subset_tab_3 mp 0.5 FALSE FALSE /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpm86udymr/predicted_counts.txt /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpm86udymr/predicted_ci.txt 100

Rscript /opt/miniconda3/envs/picrust2/lib/python3.9/site-packages/picrust2/Rscripts/castor_hsp.R /Users/farhadsadat/thesis-benchmark/mendes16s/../picrust2/picrust2_out/bac_reduced.tre /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmp8kamd4d3/subset_tab_4 mp 0.5 FALSE FALSE /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmplpev450p/predicted_counts.txt /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmplpev450p/predicted_ci.txt 100

Rscript /opt/miniconda3/envs/picrust2/lib/python3.9/site-packages/picrust2/Rscripts/castor_hsp.R /Users/farhadsadat/thesis-benchmark/mendes16s/../picrust2/picrust2_out/bac_reduced.tre /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmp8kamd4d3/subset_tab_5 mp 0.5 FALSE FALSE /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpteyfdqxw/predicted_counts.txt /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpteyfdqxw/predicted_ci.txt 100


Rscript /opt/miniconda3/envs/picrust2/lib/python3.9/site-packages/picrust2/Rscripts/castor_hsp.R /Users/farhadsadat/thesis-benchmark/mendes16s/../picrust2/picrust2_out/bac_reduced.tre /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmp8kamd4d3/subset_tab_6 mp 0.5 FALSE FALSE /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpwmr94imv/predicted_counts.txt /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpwmr94imv/predicted_ci.txt 100
Rscript /opt/miniconda3/envs/picrust2/lib/python3.9/site-packages/picrust2/Rscripts/castor_hsp.R /Users/farhadsadat/thesis-benchmark/mendes16s/../picrust2/picrust2_out/bac_reduced.tre /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmp8kamd4d3/subset_tab_7 mp 0.5 FALSE FALSE /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpyevjv0ky/predicted_counts.txt /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpyevjv0ky/predicted_ci.txt 100

Rscript /opt/miniconda3/envs/picrust2/lib/python3.9/site-packages/picrust2/Rscripts/castor_hsp.R /Users/farhadsadat/thesis-benchmark/mendes16s/../picrust2/picrust2_out/bac_reduced.tre /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmp8kamd4d3/subset_tab_8 mp 0.5 FALSE FALSE /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpf4snmd61/predicted_counts.txt /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpf4snmd61/predicted_ci.txt 100

Rscript /opt/miniconda3/envs/picrust2/lib/python3.9/site-packages/picrust2/Rscripts/castor_hsp.R /Users/farhadsadat/thesis-benchmark/mendes16s/../picrust2/picrust2_out/bac_reduced.tre /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmp8kamd4d3/subset_tab_9 mp 0.5 FALSE FALSE /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpf60e_5bx/predicted_counts.txt /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpf60e_5bx/predicted_ci.txt 100

Rscript /opt/miniconda3/envs/picrust2/lib/python3.9/site-packages/picrust2/Rscripts/castor_hsp.R /Users/farhadsadat/thesis-benchmark/mendes16s/../picrust2/picrust2_out/bac_reduced.tre /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmp8kamd4d3/subset_tab_10 mp 0.5 FALSE FALSE /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpycqpqqtj/predicted_counts.txt /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpycqpqqtj/predicted_ci.txt 100

Rscript /opt/miniconda3/envs/picrust2/lib/python3.9/site-packages/picrust2/Rscripts/castor_hsp.R /Users/farhadsadat/thesis-benchmark/mendes16s/../picrust2/picrust2_out/bac_reduced.tre /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmp8kamd4d3/subset_tab_11 mp 0.5 FALSE FALSE /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpyvywgly_/predicted_counts.txt /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpyvywgly_/predicted_ci.txt 100

Rscript /opt/miniconda3/envs/picrust2/lib/python3.9/site-packages/picrust2/Rscripts/castor_hsp.R /Users/farhadsadat/thesis-benchmark/mendes16s/../picrust2/picrust2_out/bac_reduced.tre /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmp8kamd4d3/subset_tab_12 mp 0.5 FALSE FALSE /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmp5iay9qkk/predicted_counts.txt /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmp5iay9qkk/predicted_ci.txt 100

Rscript /opt/miniconda3/envs/picrust2/lib/python3.9/site-packages/picrust2/Rscripts/castor_hsp.R /Users/farhadsadat/thesis-benchmark/mendes16s/../picrust2/picrust2_out/bac_reduced.tre /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmp8kamd4d3/subset_tab_13 mp 0.5 FALSE FALSE /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpnvvk82ps/predicted_counts.txt /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpnvvk82ps/predicted_ci.txt 100

Rscript /opt/miniconda3/envs/picrust2/lib/python3.9/site-packages/picrust2/Rscripts/castor_hsp.R /Users/farhadsadat/thesis-benchmark/mendes16s/../picrust2/picrust2_out/bac_reduced.tre /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmp8kamd4d3/subset_tab_14 mp 0.5 FALSE FALSE /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpf00sflap/predicted_counts.txt /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpf00sflap/predicted_ci.txt 100

Rscript /opt/miniconda3/envs/picrust2/lib/python3.9/site-packages/picrust2/Rscripts/castor_hsp.R /Users/farhadsadat/thesis-benchmark/mendes16s/../picrust2/picrust2_out/bac_reduced.tre /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmp8kamd4d3/subset_tab_15 mp 0.5 FALSE FALSE /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpooau5ely/predicted_counts.txt /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpooau5ely/predicted_ci.txt 100

Rscript /opt/miniconda3/envs/picrust2/lib/python3.9/site-packages/picrust2/Rscripts/castor_hsp.R /Users/farhadsadat/thesis-benchmark/mendes16s/../picrust2/picrust2_out/bac_reduced.tre /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmp8kamd4d3/subset_tab_16 mp 0.5 FALSE FALSE /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmp932h37a5/predicted_counts.txt /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmp932h37a5/predicted_ci.txt 100

Rscript /opt/miniconda3/envs/picrust2/lib/python3.9/site-packages/picrust2/Rscripts/castor_hsp.R /Users/farhadsadat/thesis-benchmark/mendes16s/../picrust2/picrust2_out/bac_reduced.tre /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmp8kamd4d3/subset_tab_17 mp 0.5 FALSE FALSE /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmp33awkwq9/predicted_counts.txt /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmp33awkwq9/predicted_ci.txt 100

Rscript /opt/miniconda3/envs/picrust2/lib/python3.9/site-packages/picrust2/Rscripts/castor_hsp.R /Users/farhadsadat/thesis-benchmark/mendes16s/../picrust2/picrust2_out/bac_reduced.tre /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmp8kamd4d3/subset_tab_18 mp 0.5 FALSE FALSE /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpjbubtbz4/predicted_counts.txt /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpjbubtbz4/predicted_ci.txt 100

Rscript /opt/miniconda3/envs/picrust2/lib/python3.9/site-packages/picrust2/Rscripts/castor_hsp.R /Users/farhadsadat/thesis-benchmark/mendes16s/../picrust2/picrust2_out/bac_reduced.tre /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmp8kamd4d3/subset_tab_19 mp 0.5 FALSE FALSE /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpl40pg5dx/predicted_counts.txt /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpl40pg5dx/predicted_ci.txt 100

Rscript /opt/miniconda3/envs/picrust2/lib/python3.9/site-packages/picrust2/Rscripts/castor_hsp.R /Users/farhadsadat/thesis-benchmark/mendes16s/../picrust2/picrust2_out/bac_reduced.tre /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmp8kamd4d3/subset_tab_20 mp 0.5 FALSE FALSE /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmp85714wq_/predicted_counts.txt /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmp85714wq_/predicted_ci.txt 100

Rscript /opt/miniconda3/envs/picrust2/lib/python3.9/site-packages/picrust2/Rscripts/castor_hsp.R /Users/farhadsadat/thesis-benchmark/mendes16s/../picrust2/picrust2_out/bac_reduced.tre /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmp8kamd4d3/subset_tab_21 mp 0.5 FALSE FALSE /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpl6mpilgr/predicted_counts.txt /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpl6mpilgr/predicted_ci.txt 100

Rscript /opt/miniconda3/envs/picrust2/lib/python3.9/site-packages/picrust2/Rscripts/castor_hsp.R /Users/farhadsadat/thesis-benchmark/mendes16s/../picrust2/picrust2_out/bac_reduced.tre /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmp8kamd4d3/subset_tab_22 mp 0.5 FALSE FALSE /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpvnemltpd/predicted_counts.txt /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpvnemltpd/predicted_ci.txt 100

Rscript /opt/miniconda3/envs/picrust2/lib/python3.9/site-packages/picrust2/Rscripts/castor_hsp.R /Users/farhadsadat/thesis-benchmark/mendes16s/../picrust2/picrust2_out/bac_reduced.tre /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmp8kamd4d3/subset_tab_23 mp 0.5 FALSE FALSE /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpgsbj_pxt/predicted_counts.txt /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpgsbj_pxt/predicted_ci.txt 100

Rscript /opt/miniconda3/envs/picrust2/lib/python3.9/site-packages/picrust2/Rscripts/castor_hsp.R /Users/farhadsadat/thesis-benchmark/mendes16s/../picrust2/picrust2_out/bac_reduced.tre /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmp8kamd4d3/subset_tab_24 mp 0.5 FALSE FALSE /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmp5fwxszqx/predicted_counts.txt /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmp5fwxszqx/predicted_ci.txt 100

Rscript /opt/miniconda3/envs/picrust2/lib/python3.9/site-packages/picrust2/Rscripts/castor_hsp.R /Users/farhadsadat/thesis-benchmark/mendes16s/../picrust2/picrust2_out/bac_reduced.tre /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmp8kamd4d3/subset_tab_25 mp 0.5 FALSE FALSE /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmp512wo3ox/predicted_counts.txt /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmp512wo3ox/predicted_ci.txt 100

Rscript /opt/miniconda3/envs/picrust2/lib/python3.9/site-packages/picrust2/Rscripts/castor_hsp.R /Users/farhadsadat/thesis-benchmark/mendes16s/../picrust2/picrust2_out/bac_reduced.tre /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmp8kamd4d3/subset_tab_26 mp 0.5 FALSE FALSE /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpwv9dv9ey/predicted_counts.txt /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpwv9dv9ey/predicted_ci.txt 100

Rscript /opt/miniconda3/envs/picrust2/lib/python3.9/site-packages/picrust2/Rscripts/castor_hsp.R /Users/farhadsadat/thesis-benchmark/mendes16s/../picrust2/picrust2_out/bac_reduced.tre /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmp8kamd4d3/subset_tab_27 mp 0.5 FALSE FALSE /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpmyxp4sie/predicted_counts.txt /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpmyxp4sie/predicted_ci.txt 100





Finished getting functional predictions for all traits.
Warning: There was only one file for the function: EC
Maybe that's fine if you used custom traits or there were no sequences matching one of the domains.
Warning: There was only one file for the function: KO
Maybe that's fine if you used custom traits or there were no sequences matching one of the domains.
Finished joining together all trait tables with the same trait name for both domains.
Running metagenome pipeline for EC
metagenome_pipeline.py --input /Users/farhadsadat/thesis-benchmark/mendes16s/qiime/exported_table/feature-table.biom --function /Users/farhadsadat/thesis-benchmark/mendes16s/../picrust2/picrust2_out/bac_EC_predicted.tsv.gz --min_reads 1 --min_samples 1 --out_dir /Users/farhadsadat/thesis-benchmark/mendes16s/../picrust2/picrust2_out/EC_metagenome_out --max_nsti 2.0 --marker /Users/farhadsadat/thesis-benchmark/mendes16s/../picrust2/picrust2_out/combined_marker_predicted_and_nsti.tsv.gz

All ASVs were below the max NSTI cut-off of 2.0 and so all were retained for downstream analyses.

Running metagenome pipeline for KO
metagenome_pipeline.py --input /Users/farhadsadat/thesis-benchmark/mendes16s/qiime/exported_table/feature-table.biom --function /Users/farhadsadat/thesis-benchmark/mendes16s/../picrust2/picrust2_out/bac_KO_predicted.tsv.gz --min_reads 1 --min_samples 1 --out_dir /Users/farhadsadat/thesis-benchmark/mendes16s/../picrust2/picrust2_out/KO_metagenome_out --max_nsti 2.0 --marker /Users/farhadsadat/thesis-benchmark/mendes16s/../picrust2/picrust2_out/combined_marker_predicted_and_nsti.tsv.gz

All ASVs were below the max NSTI cut-off of 2.0 and so all were retained for downstream analyses.

Inferring pathways from predicted EC
pathway_pipeline.py --input /Users/farhadsadat/thesis-benchmark/mendes16s/../picrust2/picrust2_out/EC_metagenome_out/pred_metagenome_unstrat.tsv.gz --out_dir /Users/farhadsadat/thesis-benchmark/mendes16s/../picrust2/picrust2_out/pathways_out --map /opt/miniconda3/envs/picrust2/lib/python3.9/site-packages/picrust2/default_files/pathway_mapfiles/metacyc_pathways_structured_filtered_v24.txt --intermediate /Users/farhadsadat/thesis-benchmark/mendes16s/../picrust2/picrust2_out/intermediate/pathways --proc 4 --regroup_map /opt/miniconda3/envs/picrust2/lib/python3.9/site-packages/picrust2/default_files/pathway_mapfiles/ec_level4_to_metacyc_rxn_new.tsv --verbose

Wrote predicted pathway abundances and coverages to /Users/farhadsadat/thesis-benchmark/mendes16s/../picrust2/picrust2_out/pathways_out
Completed PICRUSt2 pipeline in 1632.75 seconds.
