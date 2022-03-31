#include <unistd.h>
#include <stdio.h>
#include <string.h>
#include <fcntl.h>
#include <wait.h>

int main(int argc, char const *argv[])
{
    int filein = open("/etc/passwd", O_RDONLY);
    dup2(filein, 0);
    close(filein);

    int outoriginal = dup(1);

    int filesaida = open("saida.txt", O_CREAT | O_TRUNC | O_WRONLY, 0666);
    dup2(filesaida, 1);
    close(filesaida);

    int fileerror = open("erros.txt", O_CREAT | O_TRUNC | O_WRONLY, 0666);
    dup2(fileerror, 2);
    close(fileerror);

    pid_t pid;
    int status;
    if((pid = fork()) == 0) {
        char buffer;
        int read_res;
        char line[1024];
        int i = 0;
        while((read_res = read(0, &buffer,1)) != 0) {
            line[i] = buffer;
            i++;
            if(buffer == '\n') {
                write(1, line, i);
                write(2, line, i);
                fflush(stdout);
                i=0;
            }
        }
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
