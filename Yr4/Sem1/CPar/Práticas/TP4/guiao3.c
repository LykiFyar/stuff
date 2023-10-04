#include<stdio.h>
#include<stdlib.h>

#ifndef size
#define size 512
#endif

double *A, *B, *C;

void alloc() {
    A = (double *) malloc(size*size*sizeof(double));
    B = (double *) malloc(size*size*sizeof(double));
    C = (double *) malloc(size*size*sizeof(double));
}

void init() {
    for(int i=0; i<size; i++) {
        for(int j=0; j<size; j++) {
            A[i*size+j] = rand();
            B[i*size+j] = rand();
        }
    }
}

void base_v() {
    for(int i=0; i<size; i++) {
        for(int j=0; j<size; j++) {
            // C[i*size+j] = 0;
            for(int k=0; k<size; k++) {
                C[i*size+j] += A[i*size+k] * B[k*size+j];
            }
        }
    }
}

void vect() {
    for(int i=0; i<size; i++) {
        for(int k=0; k<size; k++) {
            // C[i*size+j] = 0;
            for(int j=0; j<size; j++ /*j+=2*/) {
                C[i*size+j] += A[i*size+k] * B[k*size+j];
                // C[i*size+j+1] += A[i*size+k] * B[k*size+j+1];
            }
        }
    }
}

int main() {
    alloc();
    init();
    //base_v();
    vect();
    printf("%f\n", C[size/2+5]);
}
