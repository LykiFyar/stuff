#include <stdio.h>
 #include <stdlib.h>
 int contaN(char *s, int c);
 int main()
 {
char cadeia[50];
int c;
 printf("Introduza a cadeia de carateres -->\n");
 scanf("%s",cadeia );
 printf("Indique a posicao inicial na cadeia de carateres -->\n");
 scanf("%d",&c );
printf("O somatorio dos digitos na cadeia e' -->%d\n",
contaN(cadeia,c));
 exit(0);
 }