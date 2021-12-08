int mdc1 (int a, int b){
// TODO 
    return 0;
}
int mdc2 (int a, int b){
    while (a != b) {
        if (a<b) b=b-a;
        else a=a-b;
    }
    return a;
}
int mdc3 (int a, int b, int *count){
    while (a != b) {
        if (a<b) b=b-a;
        else a=a-b;
        (*count)++;
    }
    return a;
}
int mdc4 (int a, int b, int *count){
    while (a != b) {
        if (a<b) b=b%a;
        else a=a%b;
        (*count)++;
    }
    return a;
}