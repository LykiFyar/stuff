#include <stdio.h>
#include <string.h>
#include <stdlib.h>

char *getline() {
    char buf[8];
    char *result;
    gets(buf);
    result = (char *) malloc(strlen(buf));
    strcpy(result, buf);
    return (result);
}

int main (int argc, char* argv[]) {
    getline();
    return 1;
}