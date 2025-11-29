#!/bin/bash

#SBATCH -A m2_jgu-funcpoll
#SBATCH -J run_quast

#SBATCH -C skylake
#SBATCH -p parallel
#SBATCH -n 1
#SBATCH -c 1
#SBATCH -t 01:00:00

#SBATCH -v
#SBATCH -o run_quast.%j.out
#SBATCH -e run_quast.%j.err
module purge
#module load bio/Flye/2.9.1-GCC-11.2.0

#source /home/tcolgan/meth_werk/bin/activate
#source meth_werk/bin/activate
#module load bio/bwa-meth/0.2.2-iccifort-2019.5.281
#module load lang/Python/3.10.8-GCCcore-12.2.0
#module load bio/BWA/0.7.17
#module load bio/SAMtools/1.14-GCC-11.2.0 

PROJECT_DIR=/lustre/project/m2_jgu-funcpoll

## Check arguments are provided:
#if [ $# -eq 0 ]
#  then
#    echo "No arguments supplied. Usage: ./run_bwamem2_index.sh input.fasta"
#
#fi

src/quast-5.3.0/quast.py --large -o quast_m_hq_output -t 10 --min-contig 5000 \
--labels 10kb,8kb,6kb,hq_1.5kb \
hq_results/assembly.fasta \
results/10kb/filtered_assembly.fasta \
results/8kb/filtered_assembly.fasta \
results/6kb/filtered_assembly.fasta


