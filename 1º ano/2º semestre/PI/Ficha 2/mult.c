float multInt1 (int n, float m){
    float r = 0.0;
    while (n>0) {
        n--;
        r += m;
    }
    return r;

}

float multInt2 (int n, float m){
    float r = 0.0;
    while (n>0) {
        if (n%2!=0) r += m;
        n = n/2;
        m = m*2;
    }
    return r;
}

float multInt3 (int n, float m, int *count){
    *count = 0;
    float r = 0.0;
    while (n>0) {
        if (n%2!=0) {
            r += m;
            (*count)++;
        n = n/2;
        m = m*2;
    }
    return r;
}