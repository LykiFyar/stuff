#include <signal.h>
#include <sys/types.h>
#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <wait.h>

int nfiles = 4;
pid_t pids[4]; // é necessário partilhar o array de pids para o sigalrm_handler conseguir interagir

void sigalrm_handler(int signum) {
    for(int i = 0; i < nfiles; i++) {
        kill(pids[i], SIGKILL);
    }
}

int main(int argc, char const *argv[]) {
    
    char* palavra = "hello";

    char* filenames[nfiles];
    filenames[0] = "hello.txt";
    filenames[1] = "there.txt";
    filenames[2] = "general.txt";
    filenames[3] = "kenobi.txt";

    pid_t currpid;

    int status;

    alarm(10); // alarme para abortar todos os processos que demorem mais do que 10 segundos

    for(int i = 0; i < nfiles; i++) {
        if((currpid = fork()) == 0) {
            // sleep(i*2); // para verificar que funciona, já que corre rápido demais para que apenas apareça um "hello"
            execlp("grep", "grep", palavra, filenames[i], NULL);
        }
        else pids[i] = currpid;
    }
    for(int i = 0; i < nfiles; i++) {
        wait(&status);
        if(WEXITSTATUS(status) == 0) {
            for(int i = 0; i < nfiles; i++) {
                kill(pids[i], SIGKILL);
            }
        }
    }
    return 0;
}
