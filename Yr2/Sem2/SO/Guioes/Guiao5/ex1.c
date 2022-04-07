#include <stdio.h>
#include <unistd.h>
#include <sys/wait.h>
#include <string.h>

void fstpart()
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
            int read_res = read(fildes[0], &buffer, 20);
            printf("[FILHO] Li %s com %d caracteres\n", buffer, 20);
            close(fildes[0]);
            _exit(0);
            break;
        default:
            close(fildes[0]);
    // 2a parte do exercício //
            sleep(5);
    // ----------------------//
            write(fildes[1], "Ola Mundo!\n", 10);
            printf("[PAI] Escrevi uma linha!\n");
            close(fildes[1]);
            wait(NULL);
    }
}


void sndpart()
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
            close(fildes[0]);
            write(fildes[1], "Ola Mundo!\n", 10);
            printf("[FILHO] Escrevi uma linha!\n");
            close(fildes[1]);
            _exit(0);
            break;
        default:
            close(fildes[1]);
            int read_res = read(fildes[0], &buffer, 20);
            printf("[PAI] Li %s com %d caracteres\n", buffer, 20);
            close(fildes[0]);
            wait(NULL);
    }
}

int main(int argc, char const *argv[])
{
    if (argc == 2) {
        if(strcmp("fstpart", argv[1]) == 0) fstpart();
        if(strcmp("sndpart", argv[1]) == 0) sndpart();
    }
    return 0;
}
