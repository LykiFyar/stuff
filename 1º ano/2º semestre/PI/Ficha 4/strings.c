#include <stdlib.h>
#include <stdio.h>
#include <string.h>

/* FICHA 4: STRINGS

char *palavra



*/

int main() {
    char *palavra, *pal2;
    char pal3[] = "lolololololololol";
    palavra = (char*) malloc(sizeof(char)*4);
    strcpy(palavra, "ola");

    pal2 = strdup("Isto é uma aula..");
    printf("1-%s; 2- %s\n", palavra, pal2);
    return 0;
}
