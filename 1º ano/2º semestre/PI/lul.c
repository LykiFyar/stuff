#include <stdio.h>

/*

miniteste 1


1
int func(int x) {
  int r = 0;
  while (x > 0) {
    r += 1;
    x = x - r;
  }
  printf("r = %d",r);
  return r;
}

int main() {
    int x;
    scanf("%d", & x);
    func(x);
    return 0;
}

*/
/*
2
int main() {
int x,y;
for (y=0;y<8;y++) {    
  for (x=0;x<8;x++) {
    if (x+y != 7) putchar('#');
    else putchar('.');
  }
  putchar('\n');
}
return 0;
}

*/


/* miniteste 3
hash alterada ___
int hash (char s[]) {
  int r = 0, i=0;
  while (s[i]!='\0') {r += (s[i]*(i+1)); i++;}
  return r;
}

int hash (char s[]) {
  int r = 0;
  while (*s) {r += *s; s++;}
  return r;
}


int next(char s[], int n) {
 while (n > 0) {
   n--;
   if (s[n] < 'z') {
     s[n]++;
     return 1;
   } else {
     s[n] = 'a';
   }
 }
 return 0;
}

int main () {
 char s[10];
 int n,i;
 for (n=0;n<10;n++) {
   for (i=0;i<n;i++) s[i] = 'a';
   s[n] = '\0';
   int lul = hash(s);
   do {
     printf("%s %d\n",s,lul);
   } while(next(s,n) && lul==294);
 }
 return 0;
}

miniteste 4 ---
*/

void bubble_sort(int list[], int n)
{
  int c, d, t, r;

  for (c = 0 ; c < n - 1; c++) {
    for (d = 0 ; d < n - c - 1; d++) {
      if (list[d] > list[d+1]) {
        t         = list[d];
        list[d]   = list[d+1];
        list[d+1] = t;
        r++;
      }
    }
  }
  for(int i = 0; i<n;i++) printf("%d ", list[i]);
  printf("\n%d\n", list[39]);
  printf("\n%d\n", r);
}

int sumhtpo (int n, int *s){
  int r = 0,i = 0;
  while (n != 1) {
    r += n;
    s[i] = n;
    if (n%2 == 0) n = n/2;
    else n = 1+(3*n);
    i++;
  }
  bubble_sort(s,sizeof(s));
  return r;
}



int main() {
    int s[1000];
  sumhtpo(5,s);
  return 0;
}






