#include <stdio.h>
#include <stdlib.h>
#include "Queue.h"

// Static queues 

void SinitQueue (SQueue q){
	q->front = 0;
    q->length = 0;
}

int  SisEmptyQ (SQueue q){
	return (q->length == 0);
}

int  Senqueue (SQueue q, int x){
    int r = 0, pos = (q->front + q->length) % Max;
	if (q->length >= Max) r = 1;
    else {
        q->values[pos] = x;
        q->length++;
    }
	return r;
}

int  Sdequeue (SQueue q, int *x) {
    int r = 0;
	if (SisEmptyQ(q)) r = 1;
    else {
        *x = q->values[q->front];
        q->length--;
        q->front = (q->front + 1) % Max;
    }
    return r;
}

int  Sfront (SQueue q, int *x) {
    int r = 0;
	if (SisEmptyQ(q)) r = 1;
    else *x = q->values[q->front];
    return r;
}

void ShowSQueue (SQueue q){
    int i, p;
    printf ("%d Items: ", q->length);
    for (i=0, p=q->front; i<q->length; i++) {
        printf ("%d ", q->values[p]);
        p = (p+1)%Max;
    }
    putchar ('\n');
}

// Queues with dynamic arrays

int dupQueue (DQueue q) {
	// ...
	return (-1);
}

void DinitQueue (DQueue q) {
	// ...
}

int  DisEmptyQ (DQueue s) {
	return (-1);
}

int  Denqueue (DQueue q, int x){
	// ...
	return (-1);
}

int  Ddequeue (DQueue q, int *x){
	// ...
	return (-1);
}

int  Dfront (DQueue q, int *x){
	// ...
	return (-1);
}

void ShowDQueue (DQueue q){
    int i, p;
    printf ("%d Items: ", q->length);
    for (i=0, p=q->front; i<q->length; i++) {
        printf ("%d ", q->values[p]);
        p = (p+1)%q->size;
    }
    putchar ('\n');
}
