#include<omp.h>
#include<stdio.h>

double f( double a ) {
    return (4.0 / (1.0 + a*a));
}
//pi = 3.141592653589793238462643;
int main() {
    double mypi = 0;
    int n = 10000000; // number of points to compute
    float h = 1.0 / n;
    #pragma omp parallel for reduction(+:mypi)
    for(int i=0; i<n; i++) {
	double aux= f(i*h);
//	#pragma omp critical
        //#pragma omp atomic 
        mypi += aux;
    }
    mypi = mypi * h;
    printf(" pi = %.10f \n", mypi);
}

