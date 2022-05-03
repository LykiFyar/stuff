#include <sys/types.h>
#include <sys/stat.h>
#include <stdio.h>
#include <unistd.h>
#include <sys/wait.h>
#include <string.h>
#include <fcntl.h>

#define MAX 1048

int main(int argc, char const *argv[]) {
    char buf[MAX];
    int fd, fdw;
    int log = 0;
    int bytes_read = 0;


    if((fd = open("log", O_WRONLY | O_CREAT)) == -1) {
        perror("Error: open log");
        return -1;
    }
    else {
        printf("Writing on log\n");
    }

    // Ao abrir o pipe em modo de escrita (após o ficheiro que queremos eventualmente escrever) permite que, ao não existir mais clientes, o servidor fique à espera deste fd e não feche
    if((fdw = open("pipe", O_WRONLY)) == -1) {
        perror("Error: open pipe");
        return -1;
    }

    //while(1) { // evita que, ao não existirem mais clientes disponíveis a escrever, o servidor feche - outro método
    if((fd = open("pipe", O_RDONLY)) == -1) {
    perror("Error: open pipe");
    return -1;
    }
    else {
        printf("Opened pipe for reading\n");
    }
    
    while((bytes_read = read(fd, buf, MAX)) != 0) 
        write(log, buf, bytes_read);
    
    //}
    close(fd);
    unlink("pipe");
    close(log);
    close(fdw);
    return 0;
}