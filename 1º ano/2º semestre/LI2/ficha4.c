#include <stdio.h>
#include <assert.h>

void diag(int *s) {
   int p[10][10];
   int l,c;
   for(l=0;l<10;l++) {
       for(c=0;c<10; c++) {
           p[l][c] = 0;
       }
   }

   for(int i=0; s[i]!=-1; i++) {
       int dez = (s[i])/10 ;
       int unid = s[i] - ((s[i])/10)*10;
       p[dez][unid] = p[dez][unid]+1;
 }
   for(l=0; l<10; l++) {
       printf("%d|",l);
       for(c=0;c<10; c++) {
           if (p[l][c] != 0) {
               int f = p[l][c];
               while (f!=0) {
                   printf("%d",c);
                   f--;
               }
           }
       }
       putchar('\n');
   }
}

int main() {
    int s[50];
    assert(scanf("%d", &s[0])==1);
    for(int i=1 ; s[i-1]!= -1 ; i++) {
        assert(scanf("%d", &s[i])==1);
        if (s[i]<-1 || s[i]>99) {
            printf("ERROR: VALUE ABOVE 99 OR BELOW 0");
            return 0;
        }
    }
    diag(s);
    return 0;
}