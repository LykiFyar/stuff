#include <stdio.h>
#include <unistd.h>
#include <sys/wait.h>
#include <string.h>

int main(int argc, char const *argv[])
{
    int fildes[2];
    int res = pipe(fildes);
    char buffer[20];

    printf("Resultado do pipe = %d\n", res);

    int resf = fork();

    switch (resf){
        case -1:
            perror("fork");
            break;
        case 0:
            close(fildes[1]);
            while(read(fildes[0], &buffer, 20) > 0)
                printf("[FILHO] Li %s\n", buffer);
            close(fildes[0]);
            _exit(0);
            break;
        default:
            close(fildes[0]);
            for(int i = 0; i < 10; i++) {
                write(fildes[1], "Ola Mundo!\n", 11); 
                printf("[PAI] Escrevi uma linha!\n");
            }
            close(fildes[1]);
            wait(NULL);
    }
    return 0;
}

// O pai escreve 10 linhas mas, como o buffer de leitura é maior do que o de escrita, o processo filho lê consoante o tamanho do buffer de leitura, daí aparecerem menos de 10 linhas lidas.

