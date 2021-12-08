#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct celula {
    char *palavra;
    int ocorr;
    struct celula * prox;
} * Palavras, Celula;

void libertaLista (Palavras);
int quantasP (Palavras);
void listaPal (Palavras);
char * ultima (Palavras);
Palavras acrescentaInicio (Palavras, char *);
Palavras acrescentaFim (Palavras, char *);
Palavras acrescenta (Palavras, char *);
struct celula * maisFreq (Palavras);

void libertaLista (Palavras l){
    Palavras aux;
    while (l!=NULL) {
        aux = l;
        l = l->prox;
        free(aux);
    }
}

void libertaListaRec (Palavras l){
    if (l!=NULL) {
    libertaListaRec(l->prox);
    free(l);
    }
}

int quantasP (Palavras l){
    int r=0;
    while(l!=NULL) {
        r++;
        l=l->prox;
    }
    return r;
}

int quantasP_Rec (Palavras l){
    int r=0;
    if(l!=NULL) {
        r = 1 + quantasP_Rec(l->prox);
    }
    return r;
}

void listaPal (Palavras l){
    while(l) {
    printf("%s :: %d\n",l->palavra,l->ocorr);
    l=l->prox;
    }
}

char * ultima (Palavras l){
    while(l && l->prox) l = l->prox;
    return l ? l->palavra : NULL;
}
Palavras acrescentaInicio (Palavras l, char *p){
    Palavras aux = malloc(sizeof(Celula));
    aux->palavra = strdup(p);
    aux->ocorr = 1;
    aux->prox = l; 
    return aux;
}
Palavras acrescentaFim (Palavras l, char *p){
    Palavras aux2 = l, aux = malloc(sizeof(Celula));
    aux->palavra = strdup(p);
    aux->ocorr = 1;
    aux->prox = NULL;
    while(l && l->prox) l=l->prox;
    if(l) {
        l->prox = aux;
        return aux2;
    }
    return aux;
}
Palavras acrescenta (Palavras l, char *p){
    if (!l || strcmp(p,l->palavra) < 0) return acrescentaInicio(l,p);
    else if (strcmp(p,l->palavra) == 0) {
        l->ocorr++;
        return l;
    }
    else {
        l->prox = acrescenta(l->prox,p);
        return l;
    }
}

Palavras maisFreq (Palavras l){
    Palavras res = NULL;
    int max = 0;
    while(l) {
        if(l->ocorr > max) {
            res = l;
            max = l->ocorr;
        }
        l = l->prox;
    }  
    return res;
}

int main () {
    Palavras dic = NULL;

    char * canto1 [44] = {"as", "armas", "e", "os", "baroes", "assinalados",
                          "que", "da", "ocidental", "praia", "lusitana", 
                          "por", "mares", "nunca", "de", "antes", "navegados",
                          "passaram", "ainda", "alem", "da", "taprobana",
                          "em", "perigos", "e", "guerras", "esforcados",
                          "mais", "do", "que", "prometia", "a", "forca", "humana",
                          "e", "entre", "gente", "remota", "edificaram", 
                          "novo", "reino", "que", "tanto", "sublimaram"};

    printf ("\n_____________ Testes _____________\n\n");

    int i; struct celula *p;
    for (i=0;i<44;i++)
        dic = acrescentaInicio (dic, canto1[i]);

    printf ("Foram inseridas %d palavras\n", quantasP (dic));
    printf ("Palavras existentes:\n");
    listaPal (dic);
    printf ("Última palavra inserida: %s\n", ultima (dic));

    libertaLista (dic);

    dic = NULL;

    srand(42);
    
    for (i=0; i<1000; i++)
        dic = acrescenta (dic, canto1 [rand() % 44]);
    
    printf ("Foram inseridas %d palavras\n", quantasP (dic));
    printf ("palavras existentes:\n");
    listaPal (dic);
    printf ("última palavra inserida: %s\n", ultima (dic));
    
    p = maisFreq (dic);
    printf ("Palavra mais frequente: %s (%d)\n", p->palavra, p->ocorr);
    
    printf ("\n_________ Fim dos testes _________\n\n");

    return 0;
}

