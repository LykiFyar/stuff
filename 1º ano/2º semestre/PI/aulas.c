#include <stdio.h>

/*
int main() {
   int x,y;
    x=1; y=2;
    x=x+1; y=x+y+5;
    printf("%d %d\n",x,y);
 return 0;
}

//
int main() {
   int n, i;
   n=5;
   i=0;
   while (i<n) {
     putchar ('#');
     i++; }
//
int main() {
   int n, i;
   n=5;
   for (i=0;i<n;i++) 
   putchar ('#');
*/
 void replicate (int n, char c) {
   for (;n>0;n--) 
     putchar (c);
 }
int main() {
  int a = 5;
  
  replicate (a,'@');
  
   return 0;
}





