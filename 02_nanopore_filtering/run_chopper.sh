#!/bin/bash

#SBATCH -A m2_jgu-funcpoll
#SBATCH -J run_chopper

#SBATCH -C skylake
#SBATCH -p parallel
#SBATCH -n 1
#SBATCH -c 1
#SBATCH -t 02:00:00

#SBATCH -v
#SBATCH -o run_chopper.%j.out
#SBATCH -e run_chopper.%j.err
module purge 
module load tools/Singularity/3.9.1

PROJECT_DIR=/lustre/project/m2_jgu-funcpoll

## Take inputs from the command line:
INPUT=$1
OUTPUT=$2

singularity pull library://ubuntu:22.04

singularity shell ubuntu_22.04.sif

./src/chopper-linux --input "$INPUT"  --quality 10 | gzip -c > "$OUTPUT"
