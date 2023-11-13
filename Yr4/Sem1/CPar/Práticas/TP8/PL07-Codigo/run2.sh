#!/bin/bash


SORT_SIZE=10000000

module load papi/5.4.1 
#./sortSeq  $SORT_SIZE
export OMP_NUM_THREADS=2
./sort  $SORT_SIZE
export OMP_NUM_THREADS=4
./sort  $SORT_SIZE
export OMP_NUM_THREADS=8
./sort  $SORT_SIZE
