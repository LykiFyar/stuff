//#include <mpi.h>
#include <iostream>
#include <stdlib.h>
#include <math.h>
#include <stdio.h>

#include"PrimeServer.cpp"

// place number on buf (exclude evens)
void generate(int min, int max, int* buf) {
  int j=0;
  for(int i=min; i<max; i+=2) {
    buf[j++]=i;
  }
}

int main(int argc, char **argv) {
    int nprocesses;
    int myrank;

    int MAXP = 1000000; // maximum prime to compute
    int SMAXP = 1000;   // square root of max prime
    int pack=MAXP/10;   // process "pack" of numbers (subset of #messages)

    // creates three filters
    PrimeServer *ps1 = new PrimeServer();
    PrimeServer *ps2 = new PrimeServer();
    PrimeServer *ps3 = new PrimeServer();

    // initialize filters
    ps1->initFilter(1,SMAXP/3,SMAXP);           // first 1/3
    ps2->initFilter(SMAXP/3+1,2*SMAXP/3,SMAXP); // second 1/3
    ps3->initFilter(2*SMAXP/3+1,SMAXP,SMAXP);   // last 1/3

    int *ar = new int[pack/2];  // alocate space (exclude evens)
    for(int i=0; i<10; i++) {   // sends a total of 10 messages
        generate(i*pack, (i+1)*pack, ar);  // place numbers on ar
        ps1->mprocess(ar,pack/2);  // remove non-primes (1st 1/3)
        ps2->mprocess(ar,pack/2);  // remove non-primes (2nd 1/3)
        ps3->mprocess(ar,pack/2);  // remove non-primes (3rd 1/3)
    }
    ps3->end(); // show statistics (on last filter)


    return(0);
}