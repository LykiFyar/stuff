# Lab Guide 2

## Exercise 1 - Spatial Locality

### a. Data locality analysis

C<sub>ij</sub> and A<sub>ik</sub> exibit spatial locality.

### b. Estimation of data locality impact

A - About N³/8
B - About N³

### c. Improvement of spatial locality

2 * N³ / 8

### d. Measure and discuss the results

| N | Version | Time | CPI | #I (inst_retired.any) | L1_DMiss (estimated) | L1_DMiss | Miss/#I |
| --- | --- | --- | --- | --- | --- | --- | --- |
| 512 | base() | 0,493982695 | 1,1 | 1113515136 | 134217728 | 142048267 | 0,127567433 |
| 512 | transp() | 0,176210763 | 0.4 | 977782355 | 33554432 | 17177800 | 0,017568122 |

### e.

- 


### f.

-

## Exercise 2 - Temporal Locality

### a.

- 

### b.

- 
