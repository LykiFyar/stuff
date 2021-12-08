#include <stdio.h>
#include <stdlib.h>
#include <string.h>


typedef char Nome[10];
typedef struct sHora {
int horas;
int minutos;
} Hora;

typedef struct sLlugar {
int lugar;
Hora h;
struct sLlugar *seg;
} *Llugar, NLlugar;

typedef struct sParque{
int nlugares;
Llugar ocupados;
Nome nparque;
} Parque;

typedef struct sLParque{
Parque p;
struct sLParque *seg;
} *LParque, NLParque;

void listar(LParque lp) {
    while (lp) {
        printf("Nome do Parque: %s \nNúmero de lugares: %d \n",lp->p.nparque,lp->p.nlugares);
        lp = lp->seg;
    }
}

int disponivel(LParque lp, Nome p, int lugar) {
    int r = 0;
    while(lp) {
        while(lp->p.nparque != p) {
            lp = lp->seg;
        }
        Llugar ocupaux = lp->p.ocupados;
        while(lugar != ocupaux->lugar) {
            ocupaux = lp->p.ocupados->seg;
        }
        if (lugar == ocupaux->lugar) r=1;
    }
    return r;
}

LParque estaciona(LParque lp, Nome p, int lugar, Hora h) {
    LParque aux = lp;
    while(lp) {
        while(lp->p.nparque != p) {
            lp = lp->seg;
        }
        if(disponivel(lp,p,lugar) == 1) {
            Llugar aux = malloc(sizeof(struct sLlugar));
            aux->lugar = lugar;
            aux->h = h;
            Llugar ocupaux = lp->p.ocupados;
            while(lp->p.ocupados && lp->p.ocupados->seg){
                if(lp->p.ocupados) lp->p.ocupados = aux;
                else lp->p.ocupados->seg = aux;
            }
            lp->p.ocupados = ocupaux;
        }
    }
    return aux;
}

LParque saiviatura(LParque lp, Nome p, int lugar) {
    LParque aux = lp;
    while(lp) {
        while(lp->p.nparque != p) {
            lp = lp->seg;
        }
        if(disponivel(lp,p,lugar) == 0) {
            Llugar ocupaux = lp->p.ocupados;
            while(lp->p.ocupados && lp->p.ocupados->seg){
                if (lugar != lp->p.ocupados->seg) lp->p.ocupados = lp->p.ocupados->seg;
            }
            if(lp->p.ocupados->seg) {
                if(lugar == lp->p.ocupados->seg->lugar) lp->p.ocupados->seg = NULL;
            }
            else {
                
            }
            lp->p.ocupados = ocupaux;
        }
    }
    return aux;
}


Hora consHora( int x, int y) {
    Hora z;
    z.horas = x;
    z.minutos = y;
    return z;
}

int main() {
Parque p1 = {600, NULL, "P1"},
p2 = {1500, NULL, "P2"};
LParque cp = NULL;
//...
cp = inserirParque(cp,p1);
cp = inserirParque(cp,p2);
//...
listar(cp);
//...
if(disponivel( cp, "P1", 23 ));
cp = estaciona( cp, "P1", 23, consHora( 15, 20) );
//...
cp = saiviatura( cp, "P2", 17 );
//...
listardisponibilidades(cp);
//...
return 0;
}