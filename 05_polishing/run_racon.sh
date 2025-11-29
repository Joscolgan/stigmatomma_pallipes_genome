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
#module load bio/Flye/2.9.1-GCC-11.2.0

#source /home/tcolgan/meth_werk/bin/activate
#source meth_werk/bin/activate
#module load bio/bwa-meth/0.2.2-iccifort-2019.5.281
#module load lang/Python/3.10.8-GCCcore-12.2.0
#module load bio/BWA/0.7.17
#module load bio/SAMtools/1.14-GCC-11.2.0 
module load bio/Racon/1.5.0-GCCcore-11.2.0 

PROJECT_DIR=/lustre/project/m2_jgu-funcpoll

FASTQ=$1
PAF=$2
INPUT=$3

## Check arguments are provided:
if [ $# -eq 0 ]
  then
    echo "No arguments supplied. Usage: ./run_bwamem2_index.sh input.fasta"

fi

racon -t 30 "$FASTQ" "$PAF" "$INPUT" > racon_polished_assembly_r1.fasta

