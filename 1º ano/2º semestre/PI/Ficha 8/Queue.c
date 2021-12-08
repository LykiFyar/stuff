#include <stdio.h>
#include <stdlib.h>
#include "Queue.h"

void initQueue (Queue *q){
    (*q).inicio = NULL;
    (*q).fim = NULL;
}
int QisEmpty (Queue q){
    // return q.inicio == NULL;
    return !q.inicio;
}
int enqueue (Queue *q, int x){
    LInt aux;
    int r = 0;
    aux = newLInt(x,NULL);
    if (aux) {
        if (QisEmpty(*q)) {
            (*q).inicio = aux;
            (*q).fim = aux;
        }
        else {
            (*q).fim->prox = aux;
            (*q).fim = aux;
        }
    }
    else r = 1;
    return r;
}
int dequeue (Queue *q, int *x){
    int r = 0;
    LInt aux;
    if (QisEmpty(*q)) r = 1;
    else {
        *x = (*q).inicio->valor;
        aux = (*q).inicio;
        (*q).inicio = (*q).inicio->prox;
        free(aux);
    }
    return r;
}
int frontQ (Queue q, int *x){
    int r = 0;
    if (QisEmpty(q)) r = 1;
    else {
        *x = q.inicio->valor;
    }
    return r;
}

typedef LInt QueueC;

void initQueueC (QueueC *q);
int QisEmptyC (QueueC q){
    return -1;
}
int enqueueC (QueueC *q, int x){
    return -1;
}
int dequeueC (QueueC *q, int *x){
    return -1;
}
int frontC (QueueC q, int *x){
    return -1;
}
