/* Desenhar um círculo com "#":
2r+1
r=4
    #
  #####
 #######
 #######
#########
 #######
 #######
  #####
    #

centro do círculo -> (r+1,r+1)
um ponto (x,y)
(x-r+1)^2 + (y-r+1)^2 <= r^2

matriz: (2r+1)^2

*/

#include <stdio.h>
#include <math.h>


int circulo(int r) {
    int contador = 0;
  for (int l=1;l<=2*r+1;l++){
      for (int c=1;c<=2*r+1;c++){
      if (pow(l-r-1,2) + pow(c-r-1,2) <= r*r) {
          putchar('#');
          contador ++;
      }
      else putchar (' ');
      }
      putchar ('\n');
  }
  return contador;
}




int main() {
    int r;
    for (int n=3; n<=7; n++)
    printf("\n\nEste circulo tem %d pontos.\n", circulo(r));
    return 0;
}