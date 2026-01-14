#!/bin/bash
#SBATCH --account=XXXXXX                                  # groups command on Quest to find out
#SBATCH --partition=long                                  # short, normal, long
#SBATCH --time=168:00:00                                  # max time for long partition
#SBATCH --nodes=1                                         # recommended is 1 node
#SBATCH --ntasks=x                                        # number of cores, this can be increased as needed but not too much
#SBATCH --mem=16G                                         # memory per node
#SBATCH --output=test.out                                 # output file
#SBATCH --error=test.err                                  # error file
#SBATCH --job-name=test                                   # job name
#SBATCH --mail-type=ALL                                   # send email at begin and end of job or failure
#SBATCH --mail-user=email                                 # your NU email address

module purge
module load python-anaconda3/2019.10
eval "$(conda shell.bash hook)"
conda activate /projects/XXXXXX/env

python3 -m pip install -r requirements.txt                # add ALL the packages you need in requirements.txt

python3 example_code.py                                   # your main python script (+ any arguments)