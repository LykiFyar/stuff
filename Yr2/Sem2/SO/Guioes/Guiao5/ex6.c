#include <unistd.h>
#include <stdio.h>
#include <string.h>
#include <fcntl.h>
#include <wait.h>

/**
 * TODO - NOT DONE 
 */
int main(int argc, char const *argv[]) {

/*     int fildes[2];
    int i = 0;
    int npipes = 0;

    for(int j = 0; j < argc; j++) {
        if(strcmp("|", argv[j]) == 0) {
            npipes++;
        }
    }

    char* command1[argc], *command2[argc];
    
    while(i < npipes) {

        for(int k = 0; k < argc; k++) {
            command1[k] = NULL;
            command2[k] = NULL;
        }

        if(i != 0) {
            for(int c1 = 0; strcmp("|", argv[c1]) != 0; c1++) {
                //TODO
            }
        }
        

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
                break;
        } 
    } */
    return 0;
}