/*
Exercicio 4
*/
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <unistd.h>
#include <fcntl.h>

#include <errno.h>

int main(int argc, char *argv[]) {

    pid_t pid;
    int status;

    for(int i = 0; i < 10; i++) {

        if((pid = fork()) == 0) {
            printf("[SON] Own PID: %d\n[SON] Father PID: %d\n", getpid(), getppid());
            _exit(i+1);
        }
    }
    for(int i = 0; i < 10; i++) {
        wait(&status);
        printf("[FATHER] SON exit value: %d\n-----------------------------\n", WEXITSTATUS(status));
    }

    return 0;
}