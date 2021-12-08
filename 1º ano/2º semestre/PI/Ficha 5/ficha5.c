#include <stdio.h>
#include <string.h>

typedef struct aluno {
    int numero;
    char nome[100];
    int miniT [6];
    float teste;
} Aluno;

//////////////////////////////////
int nota (Aluno a);

void ordenaPorNum (Aluno t [], int N);
void ordenaPorNome (Aluno t [], int N);
int procuraNum (int num, Aluno t[], int N);

void criaIndPorNum (Aluno t [], int N, int ind[]);
int procuraNumInd (int num, int ind[], Aluno t[], int N);

void criaIndPorNome (Aluno t [], int N, int ind[]);

void imprimeTurmaInd (int ind[], Aluno t[], int N);
/////////////////////////////////

void dumpV (int v[], int N){
    int i;
    for (i=0; i<N; i++) printf ("%d ", v[i]);
}
void imprimeAluno (Aluno *a){
    int i;
    printf ("%-5d %s (%d", a->numero, a->nome, a->miniT[0]);
    for(i=1; i<6; i++) printf (", %d", a->miniT[i]);
    printf (") %5.2f %d\n", a->teste, nota(*a));
}

int nota (Aluno a){
    int nota = 0;
    int minit = 0;
    int i = 0;
    while (i<6) minit += a.miniT[i++]; 
    nota = (minit*10/6)*0.3 + 0.7*a.teste;
    return (minit*10/6) > 8 && a.teste > 8 && nota > 9 ? nota : 0;
}

int procuraNum (int num, Aluno t[], int N){
    int i = 0;
    while(i<N-1 && t[i].numero < num) i++;
    return t[i].numero == num ? i : -1;
}

void ordenaPorNum (Aluno t [], int N){
    int p;
    int trocas = 1;
    Aluno aux;
    while(trocas){
       trocas = 0;
       p = 0;
       while(p < N-1){
           if(t[p].numero > t[p+1].numero) {
                aux = t[p];
                t[p] = t[p+1];
                t[p+1] = aux;
                trocas = 1;
            }
           p++;
       }
   }
}

void ordenaPorNome (Aluno t [], int N){
    int p;
    int trocas = 1;
    Aluno aux;
    while(trocas){
       trocas = 0;
       p = 0;
       while(p < N-1){
           if(strcmp(t[p].nome , t[p+1].nome)>0) {
                aux = t[p];
                t[p] = t[p+1];
                t[p+1] = aux;
                trocas = 1;
            }
           p++;
       }
   }
}



int procuraNumInd (int num, int ind[], Aluno t[], int N){
    Aluno tAux[N];
    for(int i = 0; i<N; i++) tAux[i] = t[i];
    ordenaPorNum(tAux,N);
    // ....
    return -1;
}

void criaIndPorNum (Aluno t [], int N, int ind[]){
    
}
void criaIndPorNome (Aluno t [], int N, int ind[]){
    
}

void imprimeTurmaInd (int ind[], Aluno t[], int N){
    
}

int main() {
    Aluno Turma1 [7] = {{4444, "André", {2,1,0,2,2,2}, 10.5}
                       ,{3333, "Paulo", {0,0,2,2,2,1},  8.7}
                       ,{8888, "Carla", {2,1,2,1,0,1}, 14.5}
                       ,{2222, "Joana", {2,0,2,1,0,2},  3.5}
                       ,{7777, "Maria", {2,2,2,2,2,1},  5.5}
                       ,{6666, "Bruna", {2,2,2,1,0,0}, 12.5}
                       ,{5555, "Diogo", {2,2,1,1,1,0},  8.5}
                       } ;
    int indNome [7], indNum [7];
    int i;
    
    printf ("\n-------------- Testes --------------\n");
    
    ordenaPorNum (Turma1, 7);

    printf ("procura 5555: %d \n", procuraNum (5555, Turma1, 7));
    printf ("procura 9999:%d \n", procuraNum (9999, Turma1, 7));

    for (i=0; i<7; imprimeAluno (Turma1 + i++)); // for (i=0; i<7; i++) imprimeAluno (Turma1 + i));
    
    // criaIndPorNum (Turma1, 7, indNum);
    
    // criaIndPorNome (Turma1, 7, indNome);

    // imprimeTurmaInd (indNum, Turma1, 7);
    // imprimeTurmaInd (indNome, Turma1, 7);

    // printf ("procura 5555:%d \n",  procuraNumInd (5555, indNum, Turma1, 7));
    // printf ("procura 9999:%d \n",  procuraNumInd (9999, indNum, Turma1, 7));

    printf ("\n---------- Fim dos Testes ----------\n");
    
    return 0;
}
