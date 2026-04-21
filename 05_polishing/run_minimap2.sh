#!/bin/bash

#SBATCH -A m2_jgu-funcpoll
#SBATCH -J run_minimap2

#SBATCH -C skylake
#SBATCH -p parallel
#SBATCH -n 1
#SBATCH -c 1
#SBATCH -t 04:00:00

#SBATCH -v
#SBATCH -o run_minimap2.%j.out
#SBATCH -e run_minimap2.%j.err
module purge
module load bio/SAMtools/1.14-GCC-11.2.0 

PROJECT_DIR=/lustre/project/m2_jgu-funcpoll

INPUT=$1
FASTQ=$2

src/minimap2-2.28_x64-linux/minimap2 -t 20 -x map-ont -t 20 "$INPUT" "$FASTQ" > results/minimap2_assembly_filt
