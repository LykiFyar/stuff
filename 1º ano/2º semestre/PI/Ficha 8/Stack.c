#include <stdio.h>
#include <stdlib.h>
#include "Stack.h"

void initStack (Stack *s){
    *s = NULL;
}

Stack initStack2 (Stack s){
    return NULL;
}

int SisEmpty (Stack s){
    // return s ? 0 : 1;
    // return s==NULL ? 1 : 0;
    return !s;
}
int push (Stack *s, int x){
    Stack aux;
    int r = 0;
    aux = newLInt(x,*s);
    if (aux) *s = aux;
    else r = 1;
    return r;
}
int pop (Stack *s, int *x){
    int r = 0;
    Stack aux;
    if (SisEmpty(*s)) r = 1;
    else {
        *x = (*s)->valor;
        aux = *s;
        *s = (*s)->prox;
        free(aux);
    }
    return r;
}
int top (Stack s, int *x){
    int r = 0;
    if (SisEmpty(s)) r = 1;
    else *x = s->valor;
    return r;
}

