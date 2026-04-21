#!/bin/bash

#SBATCH -A m2_jgu-funcpoll
#SBATCH -J run_busco

#SBATCH -C skylake
#SBATCH -p parallel
#SBATCH -n 1
#SBATCH -c 1
#SBATCH -t 24:00:00

#SBATCH -v
#SBATCH -o run_busco.%j.out
#SBATCH -e run_busco.%j.err
module purge

module load bio/BUSCO/5.4.3-foss-2021b

PROJECT_DIR=/lustre/project/m2_jgu-funcpoll

INPUT=$1
DATABASE=$2
OUTPUT=$3

export NUMEXPR_MAX_THREADS=20

busco --offline -c 20 -i "$INPUT" -l "$DATABASE" -m genome -o "$OUTPUT" -f
