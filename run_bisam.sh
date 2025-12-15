#!/bin/bash

# === SLURM array job submission ===
#SBATCH --qos=short
#SBATCH --account=flceres
#SBATCH --job-name=bisam_test
#SBATCH --output=logs/test-%A_%a.out
#SBATCH --error=logs/test-%A_%a.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=patrick.kloesel@pik-potsdam.de

# === resources ===
#SBATCH --time=02:00:00
#SBATCH --mem=30G
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --array=1-1200   # Adjust to nrow(config)

# go to correct directory
cd /home/patrickk/bisam
echo "Working directory: $(pwd)"

# create folders if not exist
mkdir -p logs Results

# load modules (if needed)
# module load R/4.3.2

# run your R script with the SLURM array ID
Rscript Functions/01_estimation_gets_bisam_comparison.R $SLURM_ARRAY_TASK_ID