#include <stdio.h>
#include <assert.h>
#include <math.h>

int main()
{
    int a,b,c;
    assert(scanf("%d %d %d", &a , &b , &c) == 3);
    if (a>=b+c || b>=a+c || c>=b+a) printf("INVALIDO");
    else {if (a==b && b==c) printf("EQUILATERO ");
         else if (a==b || b==c || a==c) printf("ISOSCELES ");
              else if ((a*a + b*b)==(c*c) || (a*a + c*c)==(b*b) || (c*c + b*b)==(a*a)) printf("RETANGULO ");
                   else printf("ESCALENO ");
         float p=a+b+c;
         float s=p/2;
         printf("%.0f %.2f", p , sqrt(s*(s-a)*(s-b)*(s-c)));
    }
    printf ("\n");
    return 0;
     
}

