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