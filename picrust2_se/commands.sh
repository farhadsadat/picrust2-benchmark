(qiime2-env) farhads-MacBook-Pro:mendes16s farhadsadat$ conda activate picrust2
(picrust2) farhads-MacBook-Pro:mendes16s farhadsadat$ OUT="$HOME/thesis-benchmark/picrust2/picrust2_out"
(picrust2) farhads-MacBook-Pro:mendes16s farhadsadat$ mkdir -p "$OUT"
(picrust2) farhads-MacBook-Pro:mendes16s farhadsadat$ picrust2_pipeline.py \
>   -s "$PWD/export-seqs/dna-sequences.fasta" \
>   -i "$PWD/export-table/feature-table.biom" \
>   -o "$OUT" -p 4 --verbose
2714 of 2714 sequence ids overlap between input table and FASTA.

2714 ASVs in the input FASTA. None of the sequence ids are duplicated.

Stopping since output directory /Users/farhadsadat/thesis-benchmark/picrust2/picrust2_out already exists.
(picrust2) farhads-MacBook-Pro:mendes16s farhadsadat$ picrust2_pipeline.py   -s "$PWD/export-seqs/dna-sequences.fasta"   -i "$PWD/export-table/feature-table.biom"   -o "$OUT" -p 4 --verbose
2714 of 2714 sequence ids overlap between input table and FASTA.

2714 ASVs in the input FASTA. None of the sequence ids are duplicated.

Placing sequences onto reference tree
place_seqs.py --study_fasta /Users/farhadsadat/thesis-benchmark/mendes16s/export-seqs/dna-sequences.fasta --ref_dir /opt/miniconda3/envs/picrust2/lib/python3.9/site-packages/picrust2/default_files/bacteria/bac_ref --out_tree /Users/farhadsadat/thesis-benchmark/picrust2/picrust2_out/bac.tre --processes 4 --intermediate /Users/farhadsadat/thesis-benchmark/picrust2/picrust2_out/intermediate/place_seqs_bac --min_align 0.8 --chunk_size 5000 --placement_tool epa-ng --verbose

INFO Selected: Output dir: /Users/farhadsadat/thesis-benchmark/picrust2/picrust2_out/intermediate/place_seqs_bac/epa_out/
INFO Selected: Query file: /Users/farhadsadat/thesis-benchmark/picrust2/picrust2_out/intermediate/place_seqs_bac/study_seqs_hmmalign.fasta
INFO Selected: Tree file: /opt/miniconda3/envs/picrust2/lib/python3.9/site-packages/picrust2/default_files/bacteria/bac_ref/bac_ref.tre
INFO Selected: Reference MSA: /Users/farhadsadat/thesis-benchmark/picrust2/picrust2_out/intermediate/place_seqs_bac/ref_seqs_hmmalign.fasta
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
INFO Output file: /Users/farhadsadat/thesis-benchmark/picrust2/picrust2_out/intermediate/place_seqs_bac/epa_out/epa_result.jplace
INFO 2714 Sequences done!
INFO Time spent placing: 200s
INFO Elapsed Time: 216s

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

Invocation:                        gappa examine graft --jplace-path /Users/farhadsadat/thesis-benchmark/picrust2/picrust2_out/intermediate/place_seqs_bac/epa_out/epa_result_parsed.jplace --fully-resolve --out-dir /Users/farhadsadat/thesis-benchmark/picrust2/picrust2_out/intermediate/place_seqs_bac/epa_out
Command:                           gappa examine graft

Input:
  --jplace-path                    /Users/farhadsadat/thesis-benchmark/picrust2/picrust2_out/intermediate/place_seqs_bac/epa_out/epa_result_parsed.jplace

Settings:
  --fully-resolve                  true
  --name-prefix

Output:
  --out-dir                        /Users/farhadsadat/thesis-benchmark/picrust2/picrust2_out/intermediate/place_seqs_bac/epa_out
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

Started 2025-10-30 18:24:25

Found 1 jplace file

Finished 2025-10-30 18:24:26


hmmalign --trim --dna --mapali /opt/miniconda3/envs/picrust2/lib/python3.9/site-packages/picrust2/default_files/bacteria/bac_ref/bac_ref.fna --informat FASTA -o /Users/farhadsadat/thesis-benchmark/picrust2/picrust2_out/intermediate/place_seqs_bac/query_align.stockholm /opt/miniconda3/envs/picrust2/lib/python3.9/site-packages/picrust2/default_files/bacteria/bac_ref/bac_ref.hmm /Users/farhadsadat/thesis-benchmark/mendes16s/export-seqs/dna-sequences.fasta

Raw input sequences ranged in length from 255 to 428

epa-ng --tree /opt/miniconda3/envs/picrust2/lib/python3.9/site-packages/picrust2/default_files/bacteria/bac_ref/bac_ref.tre --ref-msa /Users/farhadsadat/thesis-benchmark/picrust2/picrust2_out/intermediate/place_seqs_bac/ref_seqs_hmmalign.fasta --query /Users/farhadsadat/thesis-benchmark/picrust2/picrust2_out/intermediate/place_seqs_bac/study_seqs_hmmalign.fasta --chunk-size 5000 -T 4 -m /opt/miniconda3/envs/picrust2/lib/python3.9/site-packages/picrust2/default_files/bacteria/bac_ref/bac_ref.model -w /Users/farhadsadat/thesis-benchmark/picrust2/picrust2_out/intermediate/place_seqs_bac/epa_out --filter-acc-lwr 0.99 --filter-max 100

gappa examine graft --jplace-path /Users/farhadsadat/thesis-benchmark/picrust2/picrust2_out/intermediate/place_seqs_bac/epa_out/epa_result_parsed.jplace --fully-resolve --out-dir /Users/farhadsadat/thesis-benchmark/picrust2/picrust2_out/intermediate/place_seqs_bac/epa_out

mv /Users/farhadsadat/thesis-benchmark/picrust2/picrust2_out/intermediate/place_seqs_bac/epa_out/epa_result_parsed.newick /Users/farhadsadat/thesis-benchmark/picrust2/picrust2_out/bac.tre

Finished placing sequences on output tree for reference 1: /Users/farhadsadat/thesis-benchmark/picrust2/picrust2_out/bac.tre
place_seqs.py --study_fasta /Users/farhadsadat/thesis-benchmark/mendes16s/export-seqs/dna-sequences.fasta --ref_dir /opt/miniconda3/envs/picrust2/lib/python3.9/site-packages/picrust2/default_files/archaea/arc_ref --out_tree /Users/farhadsadat/thesis-benchmark/picrust2/picrust2_out/arc.tre --processes 4 --intermediate /Users/farhadsadat/thesis-benchmark/picrust2/picrust2_out/intermediate/place_seqs_arc --min_align 0.8 --chunk_size 5000 --placement_tool epa-ng --verbose

INFO Selected: Output dir: /Users/farhadsadat/thesis-benchmark/picrust2/picrust2_out/intermediate/place_seqs_arc/epa_out/
INFO Selected: Query file: /Users/farhadsadat/thesis-benchmark/picrust2/picrust2_out/intermediate/place_seqs_arc/study_seqs_hmmalign.fasta
INFO Selected: Tree file: /opt/miniconda3/envs/picrust2/lib/python3.9/site-packages/picrust2/default_files/archaea/arc_ref/arc_ref.tre
INFO Selected: Reference MSA: /Users/farhadsadat/thesis-benchmark/picrust2/picrust2_out/intermediate/place_seqs_arc/ref_seqs_hmmalign.fasta
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
INFO Output file: /Users/farhadsadat/thesis-benchmark/picrust2/picrust2_out/intermediate/place_seqs_arc/epa_out/epa_result.jplace
INFO 2701 Sequences done!
INFO Time spent placing: 2s
INFO Elapsed Time: 2s

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

Invocation:                        gappa examine graft --jplace-path /Users/farhadsadat/thesis-benchmark/picrust2/picrust2_out/intermediate/place_seqs_arc/epa_out/epa_result_parsed.jplace --fully-resolve --out-dir /Users/farhadsadat/thesis-benchmark/picrust2/picrust2_out/intermediate/place_seqs_arc/epa_out
Command:                           gappa examine graft

Input:
  --jplace-path                    /Users/farhadsadat/thesis-benchmark/picrust2/picrust2_out/intermediate/place_seqs_arc/epa_out/epa_result_parsed.jplace

Settings:
  --fully-resolve                  true
  --name-prefix

Output:
  --out-dir                        /Users/farhadsadat/thesis-benchmark/picrust2/picrust2_out/intermediate/place_seqs_arc/epa_out
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

Started 2025-10-30 18:28:44

Found 1 jplace file

Finished 2025-10-30 18:28:44


hmmalign --trim --dna --mapali /opt/miniconda3/envs/picrust2/lib/python3.9/site-packages/picrust2/default_files/archaea/arc_ref/arc_ref.fna --informat FASTA -o /Users/farhadsadat/thesis-benchmark/picrust2/picrust2_out/intermediate/place_seqs_arc/query_align.stockholm /opt/miniconda3/envs/picrust2/lib/python3.9/site-packages/picrust2/default_files/archaea/arc_ref/arc_ref.hmm /Users/farhadsadat/thesis-benchmark/mendes16s/export-seqs/dna-sequences.fasta

Warning - 13 input sequences aligned poorly to reference sequences (--min_align option specified a minimum proportion of 0.8 aligning to reference sequences). These input sequences will not be placed and will be excluded from downstream steps.

This is the set of poorly aligned input sequences to be excluded: f253b257115a9f46744cf9e0f18db8db, d4deb8a9cb9d3a444ea3dadb4e2b7446, 7ebbeceeb1b202570fcf4de3e16b2694, 48d085f325fab347d10430995c7d3f5d, 45d3de8efb11a79ccffcc7e15ae53e7a, 01a407b3bea39883e506b60e2843d8c5, 9575fc0e0b9137ef4209d3f9b98cd4c1, 39573a9f4543c4220b4ff481a339e9be, 7fc98f5df53b9b5b67b05ca61824b92d, a7ddc1aba26d571d425dea90f640707e, 768949cbc070b7eabd6418ea192759c2, c93078dd2b96651ba23c90f507c7b6d5, 82b5221f652f36c6d63083589becfeaa

Raw input sequences ranged in length from 255 to 428

epa-ng --tree /opt/miniconda3/envs/picrust2/lib/python3.9/site-packages/picrust2/default_files/archaea/arc_ref/arc_ref.tre --ref-msa /Users/farhadsadat/thesis-benchmark/picrust2/picrust2_out/intermediate/place_seqs_arc/ref_seqs_hmmalign.fasta --query /Users/farhadsadat/thesis-benchmark/picrust2/picrust2_out/intermediate/place_seqs_arc/study_seqs_hmmalign.fasta --chunk-size 5000 -T 4 -m /opt/miniconda3/envs/picrust2/lib/python3.9/site-packages/picrust2/default_files/archaea/arc_ref/arc_ref.model -w /Users/farhadsadat/thesis-benchmark/picrust2/picrust2_out/intermediate/place_seqs_arc/epa_out --filter-acc-lwr 0.99 --filter-max 100

gappa examine graft --jplace-path /Users/farhadsadat/thesis-benchmark/picrust2/picrust2_out/intermediate/place_seqs_arc/epa_out/epa_result_parsed.jplace --fully-resolve --out-dir /Users/farhadsadat/thesis-benchmark/picrust2/picrust2_out/intermediate/place_seqs_arc/epa_out

mv /Users/farhadsadat/thesis-benchmark/picrust2/picrust2_out/intermediate/place_seqs_arc/epa_out/epa_result_parsed.newick /Users/farhadsadat/thesis-benchmark/picrust2/picrust2_out/arc.tre

Finished placing sequences on output tree for reference 2: /Users/farhadsadat/thesis-benchmark/picrust2/picrust2_out/arc.tre
hsp.py --tree /Users/farhadsadat/thesis-benchmark/picrust2/picrust2_out/bac.tre --output /Users/farhadsadat/thesis-benchmark/picrust2/picrust2_out/bac_marker_predicted_and_nsti.tsv.gz --observed_trait_table /opt/miniconda3/envs/picrust2/lib/python3.9/site-packages/picrust2/default_files/bacteria/16S.txt.gz --hsp_method mp --edge_exponent 0.5 --seed 100 --calculate_NSTI --processes 1 --verbose



Rscript /opt/miniconda3/envs/picrust2/lib/python3.9/site-packages/picrust2/Rscripts/castor_nsti.R /Users/farhadsadat/thesis-benchmark/picrust2/picrust2_out/bac.tre /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmprhxlogzd/known_tips.txt /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmprhxlogzd/nsti_out.txt

Rscript /opt/miniconda3/envs/picrust2/lib/python3.9/site-packages/picrust2/Rscripts/castor_hsp.R /Users/farhadsadat/thesis-benchmark/picrust2/picrust2_out/bac.tre /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpu5741c59/subset_tab_0 mp 0.5 FALSE FALSE /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpnedebgsc/predicted_counts.txt /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpnedebgsc/predicted_ci.txt 100


hsp.py --tree /Users/farhadsadat/thesis-benchmark/picrust2/picrust2_out/arc.tre --output /Users/farhadsadat/thesis-benchmark/picrust2/picrust2_out/arc_marker_predicted_and_nsti.tsv.gz --observed_trait_table /opt/miniconda3/envs/picrust2/lib/python3.9/site-packages/picrust2/default_files/archaea/16S.txt.gz --hsp_method mp --edge_exponent 0.5 --seed 100 --calculate_NSTI --processes 1 --verbose



Rscript /opt/miniconda3/envs/picrust2/lib/python3.9/site-packages/picrust2/Rscripts/castor_nsti.R /Users/farhadsadat/thesis-benchmark/picrust2/picrust2_out/arc.tre /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpx9wd05s7/known_tips.txt /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpx9wd05s7/nsti_out.txt

Rscript /opt/miniconda3/envs/picrust2/lib/python3.9/site-packages/picrust2/Rscripts/castor_hsp.R /Users/farhadsadat/thesis-benchmark/picrust2/picrust2_out/arc.tre /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpgy45kn2c/subset_tab_0 mp 0.5 FALSE FALSE /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpgk08wd69/predicted_counts.txt /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpgk08wd69/predicted_ci.txt 100


Finished getting marker and NSTI predictions for both domains: /Users/farhadsadat/thesis-benchmark/picrust2/picrust2_out/bac_marker_predicted_and_nsti.tsv.gz, /Users/farhadsadat/thesis-benchmark/picrust2/picrust2_out/arc_marker_predicted_and_nsti.tsv.gz
Now finding the best one for each sequence.
Picking the best domains for all sequences.
2704 sequences were kept for bac
10 sequences were kept for arc
Finished getting the best domain match for each sequence: /Users/farhadsadat/thesis-benchmark/picrust2/picrust2_out/combined_marker_predicted_and_nsti.tsv.gz Now running hsp.py for the reduced reference sets.
hsp.py --tree /Users/farhadsadat/thesis-benchmark/picrust2/picrust2_out/bac_reduced.tre --output /Users/farhadsadat/thesis-benchmark/picrust2/picrust2_out/bac_EC_predicted.tsv.gz --observed_trait_table /opt/miniconda3/envs/picrust2/lib/python3.9/site-packages/picrust2/default_files/bacteria/ec.txt.gz --hsp_method mp --edge_exponent 0.5 --seed 100 --processes 4 --verbose









Rscript /opt/miniconda3/envs/picrust2/lib/python3.9/site-packages/picrust2/Rscripts/castor_hsp.R /Users/farhadsadat/thesis-benchmark/picrust2/picrust2_out/bac_reduced.tre /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpjk28d29h/subset_tab_0 mp 0.5 FALSE FALSE /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmp4oapbzpk/predicted_counts.txt /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmp4oapbzpk/predicted_ci.txt 100
Rscript /opt/miniconda3/envs/picrust2/lib/python3.9/site-packages/picrust2/Rscripts/castor_hsp.R /Users/farhadsadat/thesis-benchmark/picrust2/picrust2_out/bac_reduced.tre /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpjk28d29h/subset_tab_2 mp 0.5 FALSE FALSE /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmp_2er_5je/predicted_counts.txt /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmp_2er_5je/predicted_ci.txt 100
Rscript /opt/miniconda3/envs/picrust2/lib/python3.9/site-packages/picrust2/Rscripts/castor_hsp.R /Users/farhadsadat/thesis-benchmark/picrust2/picrust2_out/bac_reduced.tre /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpjk28d29h/subset_tab_3 mp 0.5 FALSE FALSE /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmprmd6cuh1/predicted_counts.txt /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmprmd6cuh1/predicted_ci.txt 100
Rscript /opt/miniconda3/envs/picrust2/lib/python3.9/site-packages/picrust2/Rscripts/castor_hsp.R /Users/farhadsadat/thesis-benchmark/picrust2/picrust2_out/bac_reduced.tre /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpjk28d29h/subset_tab_1 mp 0.5 FALSE FALSE /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmp7nimhb1j/predicted_counts.txt /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmp7nimhb1j/predicted_ci.txt 100

Rscript /opt/miniconda3/envs/picrust2/lib/python3.9/site-packages/picrust2/Rscripts/castor_hsp.R /Users/farhadsadat/thesis-benchmark/picrust2/picrust2_out/bac_reduced.tre /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpjk28d29h/subset_tab_4 mp 0.5 FALSE FALSE /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmp5gr1zscy/predicted_counts.txt /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmp5gr1zscy/predicted_ci.txt 100

Rscript /opt/miniconda3/envs/picrust2/lib/python3.9/site-packages/picrust2/Rscripts/castor_hsp.R /Users/farhadsadat/thesis-benchmark/picrust2/picrust2_out/bac_reduced.tre /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpjk28d29h/subset_tab_5 mp 0.5 FALSE FALSE /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmphqdew6d6/predicted_counts.txt /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmphqdew6d6/predicted_ci.txt 100

Rscript /opt/miniconda3/envs/picrust2/lib/python3.9/site-packages/picrust2/Rscripts/castor_hsp.R /Users/farhadsadat/thesis-benchmark/picrust2/picrust2_out/bac_reduced.tre /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpjk28d29h/subset_tab_6 mp 0.5 FALSE FALSE /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpxyh1kv7v/predicted_counts.txt /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpxyh1kv7v/predicted_ci.txt 100

Rscript /opt/miniconda3/envs/picrust2/lib/python3.9/site-packages/picrust2/Rscripts/castor_hsp.R /Users/farhadsadat/thesis-benchmark/picrust2/picrust2_out/bac_reduced.tre /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpjk28d29h/subset_tab_7 mp 0.5 FALSE FALSE /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmppv7uirm5/predicted_counts.txt /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmppv7uirm5/predicted_ci.txt 100





hsp.py --tree /Users/farhadsadat/thesis-benchmark/picrust2/picrust2_out/bac_reduced.tre --output /Users/farhadsadat/thesis-benchmark/picrust2/picrust2_out/bac_KO_predicted.tsv.gz --observed_trait_table /opt/miniconda3/envs/picrust2/lib/python3.9/site-packages/picrust2/default_files/bacteria/ko.txt.gz --hsp_method mp --edge_exponent 0.5 --seed 100 --processes 4 --verbose





























Rscript /opt/miniconda3/envs/picrust2/lib/python3.9/site-packages/picrust2/Rscripts/castor_hsp.R /Users/farhadsadat/thesis-benchmark/picrust2/picrust2_out/bac_reduced.tre /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpoungsxri/subset_tab_3 mp 0.5 FALSE FALSE /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmp_zj3je9r/predicted_counts.txt /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmp_zj3je9r/predicted_ci.txt 100
Rscript /opt/miniconda3/envs/picrust2/lib/python3.9/site-packages/picrust2/Rscripts/castor_hsp.R /Users/farhadsadat/thesis-benchmark/picrust2/picrust2_out/bac_reduced.tre /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpoungsxri/subset_tab_1 mp 0.5 FALSE FALSE /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpktymb14o/predicted_counts.txt /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpktymb14o/predicted_ci.txt 100
Rscript /opt/miniconda3/envs/picrust2/lib/python3.9/site-packages/picrust2/Rscripts/castor_hsp.R /Users/farhadsadat/thesis-benchmark/picrust2/picrust2_out/bac_reduced.tre /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpoungsxri/subset_tab_2 mp 0.5 FALSE FALSE /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmp5b4m2nlx/predicted_counts.txt /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmp5b4m2nlx/predicted_ci.txt 100
Rscript /opt/miniconda3/envs/picrust2/lib/python3.9/site-packages/picrust2/Rscripts/castor_hsp.R /Users/farhadsadat/thesis-benchmark/picrust2/picrust2_out/bac_reduced.tre /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpoungsxri/subset_tab_0 mp 0.5 FALSE FALSE /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpng32hjg5/predicted_counts.txt /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpng32hjg5/predicted_ci.txt 100

Rscript /opt/miniconda3/envs/picrust2/lib/python3.9/site-packages/picrust2/Rscripts/castor_hsp.R /Users/farhadsadat/thesis-benchmark/picrust2/picrust2_out/bac_reduced.tre /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpoungsxri/subset_tab_4 mp 0.5 FALSE FALSE /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpl0i0qf9_/predicted_counts.txt /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpl0i0qf9_/predicted_ci.txt 100

Rscript /opt/miniconda3/envs/picrust2/lib/python3.9/site-packages/picrust2/Rscripts/castor_hsp.R /Users/farhadsadat/thesis-benchmark/picrust2/picrust2_out/bac_reduced.tre /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpoungsxri/subset_tab_5 mp 0.5 FALSE FALSE /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmppmgcbn3m/predicted_counts.txt /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmppmgcbn3m/predicted_ci.txt 100


Rscript /opt/miniconda3/envs/picrust2/lib/python3.9/site-packages/picrust2/Rscripts/castor_hsp.R /Users/farhadsadat/thesis-benchmark/picrust2/picrust2_out/bac_reduced.tre /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpoungsxri/subset_tab_6 mp 0.5 FALSE FALSE /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpxhkzlktv/predicted_counts.txt /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpxhkzlktv/predicted_ci.txt 100
Rscript /opt/miniconda3/envs/picrust2/lib/python3.9/site-packages/picrust2/Rscripts/castor_hsp.R /Users/farhadsadat/thesis-benchmark/picrust2/picrust2_out/bac_reduced.tre /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpoungsxri/subset_tab_7 mp 0.5 FALSE FALSE /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmp_tu1m7ke/predicted_counts.txt /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmp_tu1m7ke/predicted_ci.txt 100

Rscript /opt/miniconda3/envs/picrust2/lib/python3.9/site-packages/picrust2/Rscripts/castor_hsp.R /Users/farhadsadat/thesis-benchmark/picrust2/picrust2_out/bac_reduced.tre /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpoungsxri/subset_tab_8 mp 0.5 FALSE FALSE /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpa9wm03f8/predicted_counts.txt /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpa9wm03f8/predicted_ci.txt 100

Rscript /opt/miniconda3/envs/picrust2/lib/python3.9/site-packages/picrust2/Rscripts/castor_hsp.R /Users/farhadsadat/thesis-benchmark/picrust2/picrust2_out/bac_reduced.tre /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpoungsxri/subset_tab_9 mp 0.5 FALSE FALSE /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpe60yzpye/predicted_counts.txt /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpe60yzpye/predicted_ci.txt 100

Rscript /opt/miniconda3/envs/picrust2/lib/python3.9/site-packages/picrust2/Rscripts/castor_hsp.R /Users/farhadsadat/thesis-benchmark/picrust2/picrust2_out/bac_reduced.tre /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpoungsxri/subset_tab_10 mp 0.5 FALSE FALSE /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpyala8m5e/predicted_counts.txt /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpyala8m5e/predicted_ci.txt 100

Rscript /opt/miniconda3/envs/picrust2/lib/python3.9/site-packages/picrust2/Rscripts/castor_hsp.R /Users/farhadsadat/thesis-benchmark/picrust2/picrust2_out/bac_reduced.tre /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpoungsxri/subset_tab_11 mp 0.5 FALSE FALSE /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpndac3jfv/predicted_counts.txt /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpndac3jfv/predicted_ci.txt 100

Rscript /opt/miniconda3/envs/picrust2/lib/python3.9/site-packages/picrust2/Rscripts/castor_hsp.R /Users/farhadsadat/thesis-benchmark/picrust2/picrust2_out/bac_reduced.tre /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpoungsxri/subset_tab_12 mp 0.5 FALSE FALSE /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpnxdw8ggy/predicted_counts.txt /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpnxdw8ggy/predicted_ci.txt 100

Rscript /opt/miniconda3/envs/picrust2/lib/python3.9/site-packages/picrust2/Rscripts/castor_hsp.R /Users/farhadsadat/thesis-benchmark/picrust2/picrust2_out/bac_reduced.tre /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpoungsxri/subset_tab_13 mp 0.5 FALSE FALSE /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpjnxsiez0/predicted_counts.txt /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpjnxsiez0/predicted_ci.txt 100

Rscript /opt/miniconda3/envs/picrust2/lib/python3.9/site-packages/picrust2/Rscripts/castor_hsp.R /Users/farhadsadat/thesis-benchmark/picrust2/picrust2_out/bac_reduced.tre /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpoungsxri/subset_tab_14 mp 0.5 FALSE FALSE /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpq66v1tcm/predicted_counts.txt /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpq66v1tcm/predicted_ci.txt 100

Rscript /opt/miniconda3/envs/picrust2/lib/python3.9/site-packages/picrust2/Rscripts/castor_hsp.R /Users/farhadsadat/thesis-benchmark/picrust2/picrust2_out/bac_reduced.tre /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpoungsxri/subset_tab_15 mp 0.5 FALSE FALSE /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmp4h8c_2ek/predicted_counts.txt /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmp4h8c_2ek/predicted_ci.txt 100

Rscript /opt/miniconda3/envs/picrust2/lib/python3.9/site-packages/picrust2/Rscripts/castor_hsp.R /Users/farhadsadat/thesis-benchmark/picrust2/picrust2_out/bac_reduced.tre /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpoungsxri/subset_tab_16 mp 0.5 FALSE FALSE /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmprcgtgb9p/predicted_counts.txt /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmprcgtgb9p/predicted_ci.txt 100

Rscript /opt/miniconda3/envs/picrust2/lib/python3.9/site-packages/picrust2/Rscripts/castor_hsp.R /Users/farhadsadat/thesis-benchmark/picrust2/picrust2_out/bac_reduced.tre /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpoungsxri/subset_tab_17 mp 0.5 FALSE FALSE /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpfglww0yd/predicted_counts.txt /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpfglww0yd/predicted_ci.txt 100

Rscript /opt/miniconda3/envs/picrust2/lib/python3.9/site-packages/picrust2/Rscripts/castor_hsp.R /Users/farhadsadat/thesis-benchmark/picrust2/picrust2_out/bac_reduced.tre /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpoungsxri/subset_tab_18 mp 0.5 FALSE FALSE /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpfme0e3oj/predicted_counts.txt /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpfme0e3oj/predicted_ci.txt 100

Rscript /opt/miniconda3/envs/picrust2/lib/python3.9/site-packages/picrust2/Rscripts/castor_hsp.R /Users/farhadsadat/thesis-benchmark/picrust2/picrust2_out/bac_reduced.tre /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpoungsxri/subset_tab_19 mp 0.5 FALSE FALSE /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpc4zyaiqa/predicted_counts.txt /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpc4zyaiqa/predicted_ci.txt 100

Rscript /opt/miniconda3/envs/picrust2/lib/python3.9/site-packages/picrust2/Rscripts/castor_hsp.R /Users/farhadsadat/thesis-benchmark/picrust2/picrust2_out/bac_reduced.tre /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpoungsxri/subset_tab_20 mp 0.5 FALSE FALSE /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpqti_oisg/predicted_counts.txt /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpqti_oisg/predicted_ci.txt 100

Rscript /opt/miniconda3/envs/picrust2/lib/python3.9/site-packages/picrust2/Rscripts/castor_hsp.R /Users/farhadsadat/thesis-benchmark/picrust2/picrust2_out/bac_reduced.tre /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpoungsxri/subset_tab_21 mp 0.5 FALSE FALSE /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpwdreqlwk/predicted_counts.txt /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpwdreqlwk/predicted_ci.txt 100

Rscript /opt/miniconda3/envs/picrust2/lib/python3.9/site-packages/picrust2/Rscripts/castor_hsp.R /Users/farhadsadat/thesis-benchmark/picrust2/picrust2_out/bac_reduced.tre /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpoungsxri/subset_tab_22 mp 0.5 FALSE FALSE /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpr2v24ab1/predicted_counts.txt /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpr2v24ab1/predicted_ci.txt 100

Rscript /opt/miniconda3/envs/picrust2/lib/python3.9/site-packages/picrust2/Rscripts/castor_hsp.R /Users/farhadsadat/thesis-benchmark/picrust2/picrust2_out/bac_reduced.tre /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpoungsxri/subset_tab_23 mp 0.5 FALSE FALSE /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpi_uhspvu/predicted_counts.txt /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpi_uhspvu/predicted_ci.txt 100

Rscript /opt/miniconda3/envs/picrust2/lib/python3.9/site-packages/picrust2/Rscripts/castor_hsp.R /Users/farhadsadat/thesis-benchmark/picrust2/picrust2_out/bac_reduced.tre /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpoungsxri/subset_tab_24 mp 0.5 FALSE FALSE /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmp3r0ku_5z/predicted_counts.txt /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmp3r0ku_5z/predicted_ci.txt 100

Rscript /opt/miniconda3/envs/picrust2/lib/python3.9/site-packages/picrust2/Rscripts/castor_hsp.R /Users/farhadsadat/thesis-benchmark/picrust2/picrust2_out/bac_reduced.tre /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpoungsxri/subset_tab_25 mp 0.5 FALSE FALSE /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmp4lr2ui_a/predicted_counts.txt /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmp4lr2ui_a/predicted_ci.txt 100

Rscript /opt/miniconda3/envs/picrust2/lib/python3.9/site-packages/picrust2/Rscripts/castor_hsp.R /Users/farhadsadat/thesis-benchmark/picrust2/picrust2_out/bac_reduced.tre /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpoungsxri/subset_tab_26 mp 0.5 FALSE FALSE /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmppvj9p68a/predicted_counts.txt /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmppvj9p68a/predicted_ci.txt 100

Rscript /opt/miniconda3/envs/picrust2/lib/python3.9/site-packages/picrust2/Rscripts/castor_hsp.R /Users/farhadsadat/thesis-benchmark/picrust2/picrust2_out/bac_reduced.tre /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpoungsxri/subset_tab_27 mp 0.5 FALSE FALSE /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmplrkocsh6/predicted_counts.txt /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmplrkocsh6/predicted_ci.txt 100





hsp.py --tree /Users/farhadsadat/thesis-benchmark/picrust2/picrust2_out/arc_reduced.tre --output /Users/farhadsadat/thesis-benchmark/picrust2/picrust2_out/arc_EC_predicted.tsv.gz --observed_trait_table /opt/miniconda3/envs/picrust2/lib/python3.9/site-packages/picrust2/default_files/archaea/ec.txt.gz --hsp_method mp --edge_exponent 0.5 --seed 100 --processes 4 --verbose






Rscript /opt/miniconda3/envs/picrust2/lib/python3.9/site-packages/picrust2/Rscripts/castor_hsp.R /Users/farhadsadat/thesis-benchmark/picrust2/picrust2_out/arc_reduced.tre /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmp0zbvinl_/subset_tab_0 mp 0.5 FALSE FALSE /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpp___cud1/predicted_counts.txt /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpp___cud1/predicted_ci.txt 100
Rscript /opt/miniconda3/envs/picrust2/lib/python3.9/site-packages/picrust2/Rscripts/castor_hsp.R /Users/farhadsadat/thesis-benchmark/picrust2/picrust2_out/arc_reduced.tre /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmp0zbvinl_/subset_tab_2 mp 0.5 FALSE FALSE /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpt3swqh1f/predicted_counts.txt /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpt3swqh1f/predicted_ci.txt 100
Rscript /opt/miniconda3/envs/picrust2/lib/python3.9/site-packages/picrust2/Rscripts/castor_hsp.R /Users/farhadsadat/thesis-benchmark/picrust2/picrust2_out/arc_reduced.tre /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmp0zbvinl_/subset_tab_1 mp 0.5 FALSE FALSE /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpid47jy2g/predicted_counts.txt /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpid47jy2g/predicted_ci.txt 100
Rscript /opt/miniconda3/envs/picrust2/lib/python3.9/site-packages/picrust2/Rscripts/castor_hsp.R /Users/farhadsadat/thesis-benchmark/picrust2/picrust2_out/arc_reduced.tre /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmp0zbvinl_/subset_tab_3 mp 0.5 FALSE FALSE /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpymu8qltd/predicted_counts.txt /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpymu8qltd/predicted_ci.txt 100



Rscript /opt/miniconda3/envs/picrust2/lib/python3.9/site-packages/picrust2/Rscripts/castor_hsp.R /Users/farhadsadat/thesis-benchmark/picrust2/picrust2_out/arc_reduced.tre /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmp0zbvinl_/subset_tab_4 mp 0.5 FALSE FALSE /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpiebx4hrf/predicted_counts.txt /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpiebx4hrf/predicted_ci.txt 100



hsp.py --tree /Users/farhadsadat/thesis-benchmark/picrust2/picrust2_out/arc_reduced.tre --output /Users/farhadsadat/thesis-benchmark/picrust2/picrust2_out/arc_KO_predicted.tsv.gz --observed_trait_table /opt/miniconda3/envs/picrust2/lib/python3.9/site-packages/picrust2/default_files/archaea/ko.txt.gz --hsp_method mp --edge_exponent 0.5 --seed 100 --processes 4 --verbose














Rscript /opt/miniconda3/envs/picrust2/lib/python3.9/site-packages/picrust2/Rscripts/castor_hsp.R /Users/farhadsadat/thesis-benchmark/picrust2/picrust2_out/arc_reduced.tre /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpc_dbkh5q/subset_tab_0 mp 0.5 FALSE FALSE /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmp7qk1pv_0/predicted_counts.txt /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmp7qk1pv_0/predicted_ci.txt 100
Rscript /opt/miniconda3/envs/picrust2/lib/python3.9/site-packages/picrust2/Rscripts/castor_hsp.R /Users/farhadsadat/thesis-benchmark/picrust2/picrust2_out/arc_reduced.tre /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpc_dbkh5q/subset_tab_2 mp 0.5 FALSE FALSE /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpqzmtzprp/predicted_counts.txt /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpqzmtzprp/predicted_ci.txt 100
Rscript /opt/miniconda3/envs/picrust2/lib/python3.9/site-packages/picrust2/Rscripts/castor_hsp.R /Users/farhadsadat/thesis-benchmark/picrust2/picrust2_out/arc_reduced.tre /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpc_dbkh5q/subset_tab_1 mp 0.5 FALSE FALSE /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmp7zls7q0q/predicted_counts.txt /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmp7zls7q0q/predicted_ci.txt 100
Rscript /opt/miniconda3/envs/picrust2/lib/python3.9/site-packages/picrust2/Rscripts/castor_hsp.R /Users/farhadsadat/thesis-benchmark/picrust2/picrust2_out/arc_reduced.tre /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpc_dbkh5q/subset_tab_3 mp 0.5 FALSE FALSE /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmp8d0a_01m/predicted_counts.txt /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmp8d0a_01m/predicted_ci.txt 100




Rscript /opt/miniconda3/envs/picrust2/lib/python3.9/site-packages/picrust2/Rscripts/castor_hsp.R /Users/farhadsadat/thesis-benchmark/picrust2/picrust2_out/arc_reduced.tre /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpc_dbkh5q/subset_tab_4 mp 0.5 FALSE FALSE /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpcnagshj4/predicted_counts.txt /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpcnagshj4/predicted_ci.txt 100
Rscript /opt/miniconda3/envs/picrust2/lib/python3.9/site-packages/picrust2/Rscripts/castor_hsp.R /Users/farhadsadat/thesis-benchmark/picrust2/picrust2_out/arc_reduced.tre /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpc_dbkh5q/subset_tab_5 mp 0.5 FALSE FALSE /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmp7_4do7e3/predicted_counts.txt /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmp7_4do7e3/predicted_ci.txt 100
Rscript /opt/miniconda3/envs/picrust2/lib/python3.9/site-packages/picrust2/Rscripts/castor_hsp.R /Users/farhadsadat/thesis-benchmark/picrust2/picrust2_out/arc_reduced.tre /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpc_dbkh5q/subset_tab_6 mp 0.5 FALSE FALSE /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpru8_dju0/predicted_counts.txt /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpru8_dju0/predicted_ci.txt 100
Rscript /opt/miniconda3/envs/picrust2/lib/python3.9/site-packages/picrust2/Rscripts/castor_hsp.R /Users/farhadsadat/thesis-benchmark/picrust2/picrust2_out/arc_reduced.tre /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpc_dbkh5q/subset_tab_7 mp 0.5 FALSE FALSE /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpt959kkw5/predicted_counts.txt /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpt959kkw5/predicted_ci.txt 100

Rscript /opt/miniconda3/envs/picrust2/lib/python3.9/site-packages/picrust2/Rscripts/castor_hsp.R /Users/farhadsadat/thesis-benchmark/picrust2/picrust2_out/arc_reduced.tre /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpc_dbkh5q/subset_tab_8 mp 0.5 FALSE FALSE /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpw2posnqi/predicted_counts.txt /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpw2posnqi/predicted_ci.txt 100



Rscript /opt/miniconda3/envs/picrust2/lib/python3.9/site-packages/picrust2/Rscripts/castor_hsp.R /Users/farhadsadat/thesis-benchmark/picrust2/picrust2_out/arc_reduced.tre /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpc_dbkh5q/subset_tab_9 mp 0.5 FALSE FALSE /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpggjgwz12/predicted_counts.txt /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpggjgwz12/predicted_ci.txt 100
Rscript /opt/miniconda3/envs/picrust2/lib/python3.9/site-packages/picrust2/Rscripts/castor_hsp.R /Users/farhadsadat/thesis-benchmark/picrust2/picrust2_out/arc_reduced.tre /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpc_dbkh5q/subset_tab_10 mp 0.5 FALSE FALSE /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmp9a1ipo09/predicted_counts.txt /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmp9a1ipo09/predicted_ci.txt 100
Rscript /opt/miniconda3/envs/picrust2/lib/python3.9/site-packages/picrust2/Rscripts/castor_hsp.R /Users/farhadsadat/thesis-benchmark/picrust2/picrust2_out/arc_reduced.tre /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpc_dbkh5q/subset_tab_11 mp 0.5 FALSE FALSE /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmp7vh46ott/predicted_counts.txt /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmp7vh46ott/predicted_ci.txt 100

Rscript /opt/miniconda3/envs/picrust2/lib/python3.9/site-packages/picrust2/Rscripts/castor_hsp.R /Users/farhadsadat/thesis-benchmark/picrust2/picrust2_out/arc_reduced.tre /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpc_dbkh5q/subset_tab_12 mp 0.5 FALSE FALSE /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpvvn9qpfm/predicted_counts.txt /var/folders/y2/t89j2gw91k5769tpk0j10n4c0000gn/T/tmpvvn9qpfm/predicted_ci.txt 100





Finished getting functional predictions for all traits.
['bac_KO', 'arc_KO'] {'bac_marker': '/Users/farhadsadat/thesis-benchmark/picrust2/picrust2_out/bac_reduced_marker_predicted_and_nsti.tsv.gz', 'arc_marker': '/Users/farhadsadat/thesis-benchmark/picrust2/picrust2_out/arc_reduced_marker_predicted_and_nsti.tsv.gz', 'bac_EC': '/Users/farhadsadat/thesis-benchmark/picrust2/picrust2_out/bac_EC_predicted.tsv.gz', 'bac_KO': '/Users/farhadsadat/thesis-benchmark/picrust2/picrust2_out/bac_KO_predicted.tsv.gz', 'arc_EC': '/Users/farhadsadat/thesis-benchmark/picrust2/picrust2_out/arc_EC_predicted.tsv.gz', 'arc_KO': '/Users/farhadsadat/thesis-benchmark/picrust2/picrust2_out/arc_KO_predicted.tsv.gz'}
['bac_EC', 'arc_EC'] {'bac_marker': '/Users/farhadsadat/thesis-benchmark/picrust2/picrust2_out/bac_reduced_marker_predicted_and_nsti.tsv.gz', 'arc_marker': '/Users/farhadsadat/thesis-benchmark/picrust2/picrust2_out/arc_reduced_marker_predicted_and_nsti.tsv.gz', 'bac_EC': '/Users/farhadsadat/thesis-benchmark/picrust2/picrust2_out/bac_EC_predicted.tsv.gz', 'bac_KO': '/Users/farhadsadat/thesis-benchmark/picrust2/picrust2_out/bac_KO_predicted.tsv.gz', 'arc_EC': '/Users/farhadsadat/thesis-benchmark/picrust2/picrust2_out/arc_EC_predicted.tsv.gz', 'arc_KO': '/Users/farhadsadat/thesis-benchmark/picrust2/picrust2_out/arc_KO_predicted.tsv.gz'}
Finished joining together all trait tables with the same trait name for both domains.
Running metagenome pipeline for KO
metagenome_pipeline.py --input /Users/farhadsadat/thesis-benchmark/mendes16s/export-table/feature-table.biom --function /Users/farhadsadat/thesis-benchmark/picrust2/picrust2_out/combined_KO_predicted.tsv.gz --min_reads 1 --min_samples 1 --out_dir /Users/farhadsadat/thesis-benchmark/picrust2/picrust2_out/KO_metagenome_out --max_nsti 2.0 --marker /Users/farhadsadat/thesis-benchmark/picrust2/picrust2_out/combined_marker_predicted_and_nsti.tsv.gz

2 of 2714 ASVs were above the max NSTI cut-off of 2.0 and were removed from the downstream analyses.

Running metagenome pipeline for EC
metagenome_pipeline.py --input /Users/farhadsadat/thesis-benchmark/mendes16s/export-table/feature-table.biom --function /Users/farhadsadat/thesis-benchmark/picrust2/picrust2_out/combined_EC_predicted.tsv.gz --min_reads 1 --min_samples 1 --out_dir /Users/farhadsadat/thesis-benchmark/picrust2/picrust2_out/EC_metagenome_out --max_nsti 2.0 --marker /Users/farhadsadat/thesis-benchmark/picrust2/picrust2_out/combined_marker_predicted_and_nsti.tsv.gz

2 of 2714 ASVs were above the max NSTI cut-off of 2.0 and were removed from the downstream analyses.

Inferring pathways from predicted EC
pathway_pipeline.py --input /Users/farhadsadat/thesis-benchmark/picrust2/picrust2_out/EC_metagenome_out/pred_metagenome_unstrat.tsv.gz --out_dir /Users/farhadsadat/thesis-benchmark/picrust2/picrust2_out/pathways_out --map /opt/miniconda3/envs/picrust2/lib/python3.9/site-packages/picrust2/default_files/pathway_mapfiles/metacyc_pathways_structured_filtered_v24.txt --intermediate /Users/farhadsadat/thesis-benchmark/picrust2/picrust2_out/intermediate/pathways --proc 4 --regroup_map /opt/miniconda3/envs/picrust2/lib/python3.9/site-packages/picrust2/default_files/pathway_mapfiles/ec_level4_to_metacyc_rxn_new.tsv --verbose

Wrote predicted pathway abundances and coverages to /Users/farhadsadat/thesis-benchmark/picrust2/picrust2_out/pathways_out
Completed PICRUSt2 pipeline in 3398.88 seconds.


(picrust2) farhads-MacBook-Pro:thesis-benchmark farhadsadat$ MAP="analysis/sample_map.csv"
(picrust2) farhads-MacBook-Pro:thesis-benchmark farhadsadat$ OUT="analysis/results_colwise"
(picrust2) farhads-MacBook-Pro:thesis-benchmark farhadsadat$ mkdir -p "$OUT"
(picrust2) farhads-MacBook-Pro:thesis-benchmark farhadsadat$ python analysis/compare_picrust_vs_shotgun_colwise.py \
>   --picrust "$PIC" \
>   --shotgun "$WGS" \
>   --sample-map "$MAP" \
>   --outdir "$OUT" \
>   --normalize
Samples compared: 27
Common KOs: 2388
Median Spearman: 0.787
Median Jaccard: 0.787
Saved: analysis/results_colwise/colwise_metrics.csv
