#include <unistd.h>
#include <stdio.h>
#include <string.h>
#include <fcntl.h>
#include <wait.h>

void filein_redir(char *path) {
    int filein = open(path, O_RDONLY);
    dup2(filein, 0);
    close(filein);
}

void fileout_redir(char *path) {
    int filesaida = open(path, O_CREAT | O_TRUNC | O_WRONLY, 0666);
    dup2(filesaida, 1);
    close(filesaida);
}

int main(int argc, char *argv[]) {
    
    int commandindex = 1;
    int outoriginal = dup(1);

    for(int i = 1; i < argc; i++) {
        if((argv[i])[0] == '-' ) {
            if((argv[i])[1] == 'i')  {
                filein_redir(argv[i+1]);
                commandindex = i+2;
            }
            if((argv[i])[1] == 'o') {
                fileout_redir(argv[i+1]);
                commandindex = i+2;
            }
        }
    }
    
    int fileerror = open("erros.txt", O_CREAT | O_TRUNC | O_WRONLY, 0666);
    dup2(fileerror, 2);
    close(fileerror);

    pid_t pid;
    int status;
    if((pid = fork()) == 0) {
        execvp(argv[commandindex], &(argv[commandindex]));
        _exit(0);
    }
    else {
        wait(&status);
        dup2(outoriginal, 1);
        close(outoriginal);
        printf("Terminei.\n");
    }

    return 0;
}
