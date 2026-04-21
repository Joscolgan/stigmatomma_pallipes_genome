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

PROJECT_DIR=/lustre/project/m2_jgu-funcpoll

src/quast-5.3.0/quast.py -o quast_output -t 10 --min-contig 500 "$INPUT"
