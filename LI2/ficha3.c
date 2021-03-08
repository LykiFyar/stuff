#include <stdio.h>
#include <assert.h>

void pattern(int n) {
    int l,c;
    for (l=1;l<=n;l++) {
        for (c=1;c<=(2*n);c++) {
            if (c>l && c<=2*n-l) putchar ('.');
            else putchar ('*');
        }
    putchar ('\n');
    }
    for (l=n-1;l>0;l--) {
        for (c=1;c<=(2*n);c++) {
            if (c>l && c<=2*n-l) putchar ('.');
            else putchar ('*');
        }
        
    putchar ('\n');
    }
}


int main(){
    int n;
    assert(scanf("%d", &n)==1);
    pattern(n);
    return 0;
}









