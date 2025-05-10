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
- Chopper

### 3. _de novo_ assembly:  
- Flye

### 4. Assembly assessment:  
- Quast

### 5. Polishing:  
- Racon
- Medaka

### 6. Genome completeness assessment:  
- BUSCO  
