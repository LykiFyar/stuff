#!/bin/bash



perf record  ./a.out 
perf report -n --stdio > perfreport
