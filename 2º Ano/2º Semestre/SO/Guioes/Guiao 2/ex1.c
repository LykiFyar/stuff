/*
Exercicio 1 / 2
*/
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/types.h>
#include <unistd.h>
#include <fcntl.h>

#include <errno.h>

int main(int argc, char *argv[]) {

    pid_t pid = fork();

    if (pid == 0) {
        // Código do filho
        printf("[FILHO] O meu PID é %d\n",getpid());
        printf("[FILHO] O PID do meu pai é %d\n",getppid());
        sleep(2);
        
    }
    else {
        // Código do pai
        printf("[PAI] O meu PID é %d\n",getpid());
        printf("[PAI] O PID do meu pai é %d\n",getppid());
        printf("[PAI] O PID do meu filho é %d\n",pid);
    }

    return 0;
}