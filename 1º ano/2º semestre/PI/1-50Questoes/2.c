#include <stdio.h>


// TODO 
// SÓ COPIEI O CODIGO DO 1

int main(){
    int maior, n;
    
    printf("> ");
    scanf("%d", &n);
    maior = n;

    while (n != 0)
    {
       printf("> ");
       scanf("%d", &n);
       if (n > maior) {
           maior = n;
       }
    }
    printf("O maior lido foi o %d.\n",maior);
    return 0;
}

