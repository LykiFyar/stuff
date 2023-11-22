#!/bin/bash 
#SBATCH --time=1:00 
#SBATCH --ntasks=3 
#SBATCH --partition=cpar 
mpirun -np 3 ./primes