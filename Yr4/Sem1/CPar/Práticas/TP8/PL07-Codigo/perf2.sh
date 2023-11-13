#!/bin/bash


MY=/home/...


perf record  $MY/sort  10000000
perf report  -n > perfreport
