#!/bin/bash

#SBATCH -A m2_jgu-funcpoll
#SBATCH -J run_flye_hq

#SBATCH -C skylake
#SBATCH -p parallel
#SBATCH -n 1
#SBATCH -c 1
#SBATCH -t 08:00:00

#SBATCH -v
#SBATCH -o run_flye_hq.%j.out
#SBATCH -e run_flye_hq.%j.err
module purge
module load bio/Flye/2.9.1-GCC-11.2.0

PROJECT_DIR=/lustre/project/m2_jgu-funcpoll

## Take inputs from the command line:
INPUT=$1

## Run command:
flye --nano-hq "$INPUT" -m 1500 --read-error 0.03 --iterations 2 -t 30 --out-dir hq_results


