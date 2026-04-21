#!/bin/bash

#SBATCH -A m2_jgu-funcpoll
#SBATCH -J run_nanoplot

#SBATCH -C skylake
#SBATCH -p parallel
#SBATCH -n 1
#SBATCH -c 1
#SBATCH -t 02:00:00

#SBATCH -v
#SBATCH -o run_nanoplot.%j.out
#SBATCH -e run_nanoplot.%j.err
module purge 
module load lang/Python/3.12.3-GCCcore-13.3.0   

PROJECT_DIR=/lustre/project/m2_jgu-funcpoll

## Take inputs from the command line:
INPUT=$1

~/.local/bin/NanoPlot --fastq "$INPUT" -t 20 -o results/nanoplot_output
