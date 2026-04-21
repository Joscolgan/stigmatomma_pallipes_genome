#!/bin/bash

#SBATCH -A m2_jgu-funcpoll
#SBATCH -J run_racon

#SBATCH -C skylake
#SBATCH -p parallel
#SBATCH -n 1
#SBATCH -c 1
#SBATCH -t 04:00:00

#SBATCH -v
#SBATCH -o run_racon.%j.out
#SBATCH -e run_racon.%j.err
module purge

module load bio/Racon/1.5.0-GCCcore-11.2.0 

PROJECT_DIR=/lustre/project/m2_jgu-funcpoll

FASTQ=$1
PAF=$2
INPUT=$3

racon -t 30 "$FASTQ" "$PAF" "$INPUT" > racon_polished_assembly_r1.fasta

