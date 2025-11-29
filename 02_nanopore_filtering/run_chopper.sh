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
#module load bio/Flye/2.9.1-GCC-11.2.0

#source /home/tcolgan/meth_werk/bin/activate
#source meth_werk/bin/activate
#module load bio/bwa-meth/0.2.2-iccifort-2019.5.281
#module load lang/Python/3.10.8-GCCcore-12.2.0
#module load bio/BWA/0.7.17
#module load bio/SAMtools/1.14-GCC-11.2.0 
#module load lang/Python/3.12.3-GCCcore-13.3.0   
module load tools/Singularity/3.9.1

PROJECT_DIR=/lustre/project/m2_jgu-funcpoll

## Take inputs from the command line:
INPUT=$1
OUTPUT=$2

singularity pull library://ubuntu:22.04

singularity shell ubuntu_22.04.sif

./src/chopper-linux --input "$INPUT"  --quality 10 | gzip -c > "$OUTPUT"
