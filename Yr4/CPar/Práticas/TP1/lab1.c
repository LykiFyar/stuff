#include <stdio.h>
#define N 256


void multMatrix(int size, int A[size][size], int B[size][size], int C[size][size]) {

    for(int i=0; i<size; i++)
        for(int j=0; j<size; j++)
            for(int k=0; k<size; k++)
                C[i][j] += A[i][k] * B[k][j]; 
}

int main(int argc, char const *argv[])
{
    
    int A[N][N] = {{1,1,1},{1,1,1},{1,1,1}};
    int B[N][N] = {{1,1,1},{1,1,1},{1,1,1}};
    int C[N][N] = {0};

    multMatrix(N,A,B,C);

    for(int i=0; i<N; i++) {
        for(int j=0; j<N; j++)
            printf("%d ",C[i][j]);
        printf("\n");
    }

    return 0;
}
