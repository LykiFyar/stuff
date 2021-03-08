#include <stdio.h>


int main(){
    int maior, n, segundo;
    
    printf("> ");
    scanf("%d", &n);
    maior = n;

    printf("> ");
    scanf("%d", &n);
    if (n>maior) {
        segundo = maior;
        maior = n;
    }
    else segundo = n;
    
    while (n != 0)
    {
       printf("> ");
       scanf("%d", &n);
       if (n > maior) {
        segundo = maior;
        maior = n;
    }
    else if (n>segundo) 
        segundo = n;
    }

    printf("O segundo maior lido foi o %d.\n",segundo);
    return 0;
}

