#include <unistd.h>
#include <sys/wait.h>
#include <stdio.h>
#include <stdlib.h>

#define MAXL 20
#define MAXC 10000

int main(int argc, char const *argv[]) {
    int arg = atoi(argv[1]);
    int matrix[MAXL][MAXC];
    for(int i = 0; i < MAXL; i++) {
        for(int j = 0; j < MAXC; j++) {
            matrix[i][j] = rand()%100000;
        }
    }

    pid_t pid;
    int status;
    for(int i = 0; i < MAXL; i++) {
        if((pid = fork()) == 0) {
            for(int j = 0; j < MAXC; j++) {
                if(matrix[i][j] == arg) {
                    printf("Found %d in matrix line %d, column %d\n", arg, i,j);
                    return 0;
                }
            }
            _exit(0);
        }
// sequencial - comment from here

        else {
            wait(&status);
            printf("Ended line %d\n", WEXITSTATUS(status));
        }

// to here
    }
// consequent - comment from here
/*
        for(int i = 0; i < MAXL; i++){
            wait(&status);
            printf("Ended line %d\n", WEXITSTATUS(status));
        }
*/
// to here
    return 0;
}