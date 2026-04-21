#!/bin/bash

#SBATCH -A m2_jgu-funcpoll
#SBATCH -J run_repeat_modeler

#SBATCH -C skylake
#SBATCH -p parallel
#SBATCH -n 1
#SBATCH -c 1
#SBATCH -t 36:00:00

#SBATCH -v
#SBATCH -o run_repeat_modeler.%j.out
#SBATCH -e run_repeat_modeler.%j.err
module purge
module load bio/RepeatModeler/2.0.2a-foss-2020b

PROJECT_DIR=/lustre/project/m2_jgu-funcpoll

RepeatMasker -lib RM_78237.SatJun210028562025/consensi.fa.classified -gff input/sorted_by_length.fasta -pa 20
