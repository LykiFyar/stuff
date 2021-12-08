int while_loop(int x, int y, int n) {
    while ((n > 0) && (y < 16*n)) {
        x += n;
        y *= n;
        n--;
    }
    return x;
}

int main() {
    int a=4, b=2, c=3, x;
    x = while_loop(4,2,3);
    printf("%d\n",x);
    return x;
}
