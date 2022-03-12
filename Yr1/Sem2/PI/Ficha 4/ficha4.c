#include <string.h>
#include <stdlib.h>
#include <stdio.h>

int testaVogal (char c) {
    return c == 'a' || c == 'A' ||
           c == 'e' || c == 'E' ||
           c == 'i' || c == 'I' ||
           c == 'o' || c == 'O' ||
           c == 'u' || c == 'U' ;
}


int contaVogais (char *s) {
    int r=0;
    for(int i=0; s[i] != '\0'; i++) {
        if (testaVogal(s[i])) r++;
    }
    return r;
}
int contaVogais2 (char *s) {
    int r=0;
    while (*s) {
        if (testaVogal(*s)) r++;
        s++;
    }
    return r;
}


/* COM função auxiliar
int retiraVogaisRep (char *s){
    int i, p=0, contaVogRep=0;
    char aux [strlen(s)+1];
    i=0;
    while (s[i] != '\0') {
        if (testaVogal(s[i]) && s[i] == s[i+1]) {
            contaVogRep ++;
        }
        else  {
            aux[p] = s[i];
            p++;
        }
        i++;
    }
    aux [p] = '\0';
    strcpy(s,aux);
    return contaVogRep;
}
*/
// SEM função auxiliar
int retiraVogaisRep (char *s){
    int a = 1, b = 1, contador=0;
    while (s[b]) {
        if (!testaVogal(s[b]) || (s[b] != s[b-1])) {
            s[a] = s[b];
            a++;
        }
        b++;
    }
    s[a] = '\0';
    return b-a;
}

/* COM função auxiliar
int duplicaVogais (char *s){
    int i, p=0, contaVogAc=0;
    char aux [strlen(s)*2+1];
    i=0;
    while (s[i] != '\0') {
        if (testaVogal(s[i]) && s[i] == s[i+1]) {
            aux[p] = s[i];
            p++;
            aux[p] = s[i];
            p++;
            contaVofAc++;
        }
        else  {
            aux[p] = s[i];
            p++;
        }
        i++;
    }
    aux [p] = '\0';
    strcpy(s,aux);
    return contaVogAc;
}
*/

// SEM função auxiliar
int duplicaVogais (char *s){
    int contaVogAc=0, i=0, j, comp=0, vogais=0;
    while(s[i]){
        comp++;
        if(testaVogal(s[i])) vogais++;
        i++;
    }
    i=comp-1;
    j=comp+vogais+1;
    while(i>=0) {
        s[j] = s[i];
        j--;     
        if(testaVogal(s[i])) {
            s[j] = s[i];
            j--;
        }
        i--;
    }
    s[comp+vogais]= '\0';
    return vogais;
}


int main()
{   char s1 [100] = "Estaa e umaa string coom duuuplicadoos";
    int x;
    
    printf ("Testes\n");
    printf ("A string \"%s\" tem %d vogais\n", s1, contaVogais (s1));
    
    x = retiraVogaisRep (s1);
    printf ("Foram retiradas %d vogais, resultando em \"%s\"\n", x, s1);
    
    x = duplicaVogais (s1);
    printf ("Foram acrescentadas %d vogais, resultando em \"%s\"\n", x, s1);
    
    printf ("\nFim dos testes\n");

    return 0;
}
