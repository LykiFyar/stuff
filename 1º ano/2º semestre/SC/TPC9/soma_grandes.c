int soma_grandes(int n, int *a) {
    int i, r=0;

    for(i=0; i<n; i++) {
        if (a[i] > 1000) r += a[i];
    }
    return r;
}