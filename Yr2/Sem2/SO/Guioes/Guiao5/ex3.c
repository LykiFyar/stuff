#include <unistd.h>
#include <stdio.h>
#include <string.h>
#include <fcntl.h>
#include <wait.h>

int main(int argc, char const *argv[]) {

    int fildes[2];
    char buffer[20];
    
    int res = pipe(fildes);
    if(res == -1) perror("Pipe is ded");
    int resf = fork();

    switch (resf){
        case -1:
            perror("fork");
            break;
        case 0: // Filho
            close(fildes[1]); // fechar o fd de escrita do filho (só queremos ler do pipe)
            dup2(fildes[0],0); // stdin passa a ser o fd de escrita do pai
            close(fildes[0]); // fechamos o fd original
            execlp("wc", "wc", NULL); // e executamos o wc
            _exit(0);
            break;
        default: // Pai
            close(fildes[0]); // fechar o fd de leitura do pai (só queremos escrever no pipe)
            int read_res; // variável para guardar o nº de bytes lidos a cada chamada do read
            while ((read_res = read(0, &buffer, 1024)) > 0) // lê do stdin | Nota: CTRL + D envia EOF
                write(fildes[1], buffer, read_res); // e escreve em fildes[1] (pipe)
            close(fildes[1]); // e fechamos por fim o fd de escrita do pai (para evitar o bloqueio e assim terminar o processo)
            wait(NULL);
    }
    return 0;
}