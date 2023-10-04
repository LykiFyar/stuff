# Lab Guide 3

## Exercise 1 - Loop-Unrolling Review

### a. Estimation of the impact of loop unrolling



### b. Measure and discuss the results

| N | Version | Time | CPI | #I (inst_retired.any) | L1_DMiss | Miss/#I |
| --- | --- | --- | --- | --- | --- | --- |
| 512 | base() |  |  |  |  |  |
| 512 | unroll() |  |  |  |  |  |

## Exercise 2 - Vetorisation

### a. Identification of limitations

- 

### b. Enabling vectorisation

- 

### c. Measure and discuss the results

| N | Version | Time | CPI | #I (inst_retired.any) |
| --- | --- | --- | --- | --- |
| 512 | base_v() | 0,484932000 | 1.1 | 1113817555 |
| 512 | vect() | 0,074735000 | 0,3 | 578570999 |

### d. Vectorisation fine-tuning

- 

## Exercise 3 - Roofline Model

### a. Peak Performance

20 GFlop/s
2 x 1024³ / 20 * 10⁹ ≃ 0.1 s

### b. 

- 

### c. Arithmetic Intensity

- 

### d. Memory Bandwidth Limitation

- 

### e. Roofline model applied to the matrix multiplication

- 

### f.

- 
