#include <stdio.h>

void swapM (int *x, int *y){
    int r;
    r = *x;
    *x = *y;
    *y = r;
}

// *x = o valor apontado por x
// int *x = apontador x de inteiros
// &x = endereço de x

void swap (int v[], int i, int j){
    swapM(v+i,v+j);
}
/* Uma solução:
void swap (int v[], int i, int j){
    int r;
    r = v[i];
    v[i] = v[j];
    v[j] = r;
}

Outra solução:
void swap (int v[], int i, int j){
    swapM(v+i,v+j);
}

Outra solução:
void swap (int v[], int i, int j){
    swapM(&v[i],&v[j]);
}
*/ 
void inverteArray (int v[], int N){
    for(int i=0;i<N/2;i++) {
        swap(v,i,N-1-i);
        // swapM(&v[i], &v[N-1-k]);
        // swapM(v+i,v+N-1-i);
    }
}

void dumpV (int v[], int N) {
    int i;
    for (i=0; i<N; i++) printf ("%d ", v[i]);
    putchar ('\n');
}

int soma(int v[], int N) {
    int sum;
    for(int i=0;i<N;i++) {
        sum += v[i];
    }
    return sum;
}

int maximum (int v[], int N, int *m){
    if (N>=0) {
        *m = v[0];
        for (int i = 1; i<N; i++) {
            if (*m>v[i]) *m = v[i];
        }
        return 0;
    }
    else return 1;
}

void quadrados (int q[], int N){
    q[0] = 0;
    for(int i=1;i<N;i++) {
        q[i] = q[i-1] * q[i-1] + 2*q[i-1]+1; 
    }
}

void pascal (int v[], int N){
    int i, j;
    for (i = 0; i < N; i++){
        j = i;
        while (j >= 0){
            if (j == i) v[j] = 1;
            else if (j > 0) v[j] += v[j-1];
            j--;
        }
    }
}

void desenhaTriangulpP (int N){
    int k, v[N];
    for(k=1;k<=N;k++) {
/*        int i=(N-k);
        while(i!=0) {
            putchar(' ');
            i--;
        } */
        pascal(v,k);
        dumpV(v,k);
    }
}

int main()
{  
    printf ("Testes\n");
    // teste das funções de swap
    /*
    int a, b, v[10] = {10, 6, 2, 3, 5, 1, 5, 9, 8, 7};
    int x = 3, y = 5;
    printf ("x = %d y = %d\n", x, y);
    swapM (&x, &y);
    printf ("x = %d y = %d\n", x, y);
    
    printf ("%d %d\n", v[0], v[9]);
    swap (v,0,9);
    printf ("%d %d\n", v[0], v[9]);
    */
    /*
    printf ("ao invertemos o array "); dumpV (v,10);
    inverteArray (v,10);
    printf ("obtemos               "); dumpV (v,10);

    */
    
    // teste das funções maximum, soma e quadrados
    /*
    x = maximum (v,10, &y);
    printf ("O maior elemento de "); dumpV (v,10);
    printf ("é %d\n", y);
    */
    /*
    printf ("Os 10 primeiros quadrados: "); 
    quadrados (v,10); 
    dumpV (v,10);
    */
    /*
    x = soma (v,10);
    printf ("A soma dos elementos de "); dumpV (v,10);
    printf ("é %d\n", x);
    */
    
    // teste da função de cálculo do triangulo de Pascal
    /*
    printf ("A linha 5 do triângulo de Pascal é ");
    pascal (v,5); dumpV (v,5);
    */
    
    printf ("As linhas 1 a 10 do triângulo de Pascal\n\n");
    desenhaTriangulpP (10);
    
    printf ("\nFim dos testes\n");

    return 0;
}
