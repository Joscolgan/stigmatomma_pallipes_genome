# _Stigmatomma_ RNA-seq
Scripts for genome assembly, assessment, and differentiatonal expression analysis  

## Steps in the analysis  
### 1. Quality assessment of raw sequences:  
- [NanoPlot](https://github.com/wdecoster/NanoPlot)  
For running NanoPlot, best option for running on MOGON-nhr is to install locally used:  
`pip install --user NanoPlot`  
Within a bash script, the path to the executable can be provided (e.g., ~/.local/bin/NanoPlot).  
Within the present repository, the script _run_NanoPlot.sh_ runs NanoPlot, taking the argument of input from the command line.  
Here, the command takes the input, which is a compressed or uncompressed FASTQ file of either the raw or filtered FASTQ data.  
The script can be submitted on MOGON using the following command:  
`sbatch run_nanoplot.sh <path_to_fastq_data>`  

### 2. Filtering of low quality reads:  
- [Chopper](https://github.com/wdecoster/chopper)  
Chopper allows for the removal of reads with an average minimum quality score of 10.
For running Chopper, easiest is to run within a singularity container, which allows for creating local environments with
packages that may not be globally installed.  
It can be calculated using the following commmand (at least on MOGON2):  
`module load tools/Singularity/3.9.1`  
`singularity pull library://ubuntu:22.04`  
`singularity shell ubuntu_22.04.sif`  
`./src/chopper-linux --input "$INPUT"  --quality 10 | gzip -c > "$OUTPUT"`

### 3. _de novo_ assembly:  
- [Flye](https://github.com/mikolmogorov/Flye)  
`/cluster/easybuild/broadwell/software/Flye/2.9.1-GCC-11.2.0/bin/flye --nano-hq input/Colgan_Stigmatomma_pallipes_2024_07_08_SUP_filt_q10.fastq.gz -m 1000 --iterations 2 -t 30 --out-dir hq_filt_1000`  

### 4. Assembly assessment:  
- [Quast](https://github.com/ablab/quast)  
`src/quast-5.3.0/quast.py -o quast_output -t 10 --min-contig 500 "$INPUT"`  

### 5. Polishing:  
Polishing of the genome assembly was performed using a combination of Racon and Medaka:  
Three founds of Racon, which involves a combination of mapping reads back using [minimap2](https://github.com/lh3/minimap2) against a polished genome assembly.  
- [Racon](https://github.com/isovic/racon)  
`sbatch run_racon.sh input/Colgan_Stigmatomma_pallipes_2024_07_08_SUP_filt_q10.fastq.gz results/minimap2_assembly_filt.paf data/hq_filt_1000/assembly.fasta`  

- [Medaka](https://github.com/nanoporetech/medaka)  
`~/.local/bin/medaka_consensus -i "$FASTQ" \
                  -d "$INPUT" \
                  -o results/medaka_output \
                  -t 20 \
                  -m r1041_e82_400bps_sup_v5.0.0`  

### 6. Genome completeness assessment:  
- [BUSCO](https://busco.ezlab.org/)  
`busco --offline -c 20 -i "$INPUT" -l "$DATABASE" -m genome -o "$OUTPUT" -f`
