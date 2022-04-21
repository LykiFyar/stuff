#include <unistd.h>
#include <stdio.h>
#include <string.h>
#include <fcntl.h>
#include <wait.h>

/**
 * TODO - NOT DONE 
 */
int main(int argc, char const *argv[]) {
/* 
    int npipes = 3;
    int fildes[npipes][2];
    int *res = {-1,-1,-1};

    for(int i = 0; i < npipes; i++) {
        int res[i] = pipe(fildes[i]);
    }

        
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
                break;
        } */
    return 0;
}