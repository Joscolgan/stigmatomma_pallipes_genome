#!/bin/bash

#SBATCH -A m2_jgu-funcpoll
#SBATCH -J run_quast_multi

#SBATCH -C skylake
#SBATCH -p parallel
#SBATCH -n 1
#SBATCH -c 1
#SBATCH -t 01:00:00

#SBATCH -v
#SBATCH -o run_quast_multi.%j.out
#SBATCH -e run_quast_multi.%j.err
module purge

PROJECT_DIR=/lustre/project/m2_jgu-funcpoll

src/quast-5.3.0/quast.py --large -o quast_m_hq_output -t 10 --min-contig 5000 \
--labels 10kb,8kb,6kb,hq_1.5kb \
hq_results/assembly.fasta \
results/10kb/filtered_assembly.fasta \
results/8kb/filtered_assembly.fasta \
results/6kb/filtered_assembly.fasta
