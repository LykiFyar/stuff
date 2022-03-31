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
                    _exit(i+1);
                }
            }
            _exit(0);
        }
// sequencial - comment from here

        else {
            wait(&status);
            int exitstatus = WEXITSTATUS(status);
            if(exitstatus > 0 && exitstatus < MAXL) 
                printf("Found in line %d\n", exitstatus);
        }

// to here
    }
// consequent - comment from here
/*
        for(int i = 0; i < MAXL; i++){
            wait(&status);
            int exitstatus = WEXITSTATUS(status);
            if(exitstatus > 0 && exitstatus < MAXL) 
                printf("Found in line %d", exitstatus);
        }
*/
// to here
    return 0;
}