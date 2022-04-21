#include <unistd.h>
#include <stdio.h>
#include <string.h>
#include <fcntl.h>
#include <wait.h>

int main(int argc, char const *argv[]) {

    int fildes[2];
    
    int res = pipe(fildes);
    if(res == -1) {
        perror("Pipe is ded");
        return 1;
    }
    int resf = fork();

    switch (resf){
        case -1:
            perror("fork");
            break;
        case 0: // Filho
            close(fildes[0]); 
            dup2(fildes[1],1); 
            close(fildes[1]); 
            execlp("ls","ls", "/etc", NULL);
            _exit(0);
            break;
        default: // Pai
            wait(NULL);
            close(fildes[1]);
            dup2(fildes[0], 0);
            close(fildes[0]);
            execlp("wc", "wc","-l", NULL);
            break;
    }
    return 0;
}