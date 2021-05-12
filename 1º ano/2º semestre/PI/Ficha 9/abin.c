#include "abin.h"



ABin newABin (int r, ABin e, ABin d) {
   ABin a = malloc (sizeof(struct nodo));
   if (a!=NULL) {
      a->valor = r; a->esq = e; a->dir = d;
   }
   return a;
}

ABin RandArvFromArray (int v[], int N) {
   ABin a = NULL;
    int m;
    if (N > 0){
    	m = rand() % N;
    	a = newABin (v[m], RandArvFromArray (v,m), RandArvFromArray (v+m+1,N-m-1));
    }
    return a;	
}

void dumpABin (ABin a, int N){  // TRY TODO - already made on codeboard
    if(a) {
        dumpABin(a->esq,N);
        printf("%d ", a->valor);
        dumpABin(a->dir,N);
    }
}

void freeABin (ABin a){
    if(a) {
        freeABin(a->esq);
        freeABin(a->dir);
        free(a);
    }
}

int max(int a, int b) {
    return a>b ? a : b;
}

int altura (ABin a){
    int r = 0;
    if(a) r += 1 + max(altura(a->esq),altura(a->dir));
    return r;
}

int nFolhas (ABin a){
    int r = 0;
    if(a) {
        if(!a->esq && !a->dir) r = 1;
        else r = nFolhas(a->esq) + nFolhas(a->dir);
    }
    return r;
}

ABin maisEsquerda (ABin a){
    while(a && a->esq) a = a->esq;
    return a;
}

void imprimeNivel (ABin a, int l){
    if(a) {
        if(l == 0) printf("%d ",a->valor);
        else {
            imprimeNivel(a->esq,l-1);
            imprimeNivel(a->dir,l-1);
        }
    }
}
/*

                    23 
            15              34
        6       18      29      45
              16           31    
inorder: 6 15 16 18 23 29 31 34 45
posorder: 6 16 18 15 31 29 45 34 23 
preorder: 23 15 6 18 16 34 29 31 45
*/

void inorder(ABin a) {
    if(a) {
        inorder(a->esq);
        printf("%d ", a->valor);
        inorder(a->dir);
    }
}

void posorder(ABin a) {
    if(a) {
        posorder(a->esq);
        posorder(a->dir);
        printf("%d ", a->valor);
    }
}

void preorder(ABin a) {
    if(a) {
        printf("%d ", a->valor);
        preorder(a->esq);
        preorder(a->dir);
    }
}

int procuraE (ABin a, int x){
    int r = 0;
    if(a) r = (a->valor == x) || procuraE(a->esq,x) || procuraE(a->dir,x);
    return r;
}

ABin procura (ABin a, int x){
    ABin r = NULL;
    if (a) {
        if(a->valor == x) r = a;
        else if(a->valor > x) r = procura(a->esq,x);
        else r = procura(a->dir,x);
    }
    return r;
}

int nivel (ABin a, int x){
    int r = -1;
    if (a) {
        if(a->valor == x) r = 0;
        else if(a->valor > x) r = 1 + nivel(a->esq,x);
        else r = 1 + nivel(a->dir,x);
    }
    return r;
}

void imprimeAte (ABin a, int x){ // TODO
    if(a) {
        if(a->valor == x) inorder(a->esq);
    }
}
