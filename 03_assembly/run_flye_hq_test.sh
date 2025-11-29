#!/bin/bash

#SBATCH -A m2_jgu-funcpoll
#SBATCH -J run_flye

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

#source /home/tcolgan/meth_werk/bin/activate
#source meth_werk/bin/activate
#module load bio/bwa-meth/0.2.2-iccifort-2019.5.281
#module load lang/Python/3.10.8-GCCcore-12.2.0
#module load bio/BWA/0.7.17
#module load bio/SAMtools/1.14-GCC-11.2.0 

PROJECT_DIR=/lustre/project/m2_jgu-funcpoll

## Take inputs from the command line:
INPUT=$1

## Check arguments are provided:
if [ $# -eq 0 ]
  then
    echo "No arguments supplied. Usage: ./run_bwamem2_index.sh input.fasta"

fi

flye --nano-hq "$INPUT" -m 1500 --read-error 0.03 --iterations 2 -t 30 --out-dir hq_results


