#include <unistd.h>
#include <stdio.h>
#include <string.h>
#include <fcntl.h>
#include <wait.h>


int main(int argc, char const *argv[]) {
    int npipes = 3;
    int nprocesses = 4;
    int fildes[npipes][2];
    int res = -1;

    for(int i = 0; i < npipes; i++) {
        res = pipe(fildes[i]);
        if(res == -1) {
            perror("Pipe is ded");
            return 1;
        }
    }
    for(int i = 0; i < nprocesses; i++) {
        int resf = fork();
        switch(i) {
            case 0: {
                switch (resf){
                    case -1:
                        perror("fork");   
                        break;
                    case 0: // Filho
                        close(fildes[i][0]); 
                        dup2(fildes[i][1],1); 
                        close(fildes[i][1]); 
                        execlp("grep","grep", "-v", "^#", "/etc/passwd", NULL);
                        break;
                    default: // Pai
                        close(fildes[i][1]); 
                        break;
                }
                break;
            }
            case 1: {
                switch (resf){
                    case -1:
                        perror("fork");   
                        break;
                    case 0: // Filho
                        dup2(fildes[i-1][0], 0);
                        close(fildes[i-1][0]); 
                        dup2(fildes[i][1],1); 
                        close(fildes[i][1]); 
                        execlp("cut","cut", "-f7", "-d:", NULL);
                        break;
                    default: // Pai
                        close(fildes[i-1][0]);
                        close(fildes[i][1]);
                        break;
                }
                break;
            }
            case 2: {
                switch (resf){
                    case -1:
                        perror("fork");   
                        break;
                    case 0: // Filho
                        dup2(fildes[i-1][0], 0);
                        close(fildes[i-1][0]); 
                        dup2(fildes[i][1],1); 
                        close(fildes[i][1]); 
                        execlp("uniq","uniq", NULL);
                        break;
                    default: // Pai
                        close(fildes[i-1][0]);
                        close(fildes[i][1]);
                        break;
                }
                break;
            }
            case 3: {
                switch (resf){
                    case -1:
                        perror("fork");   
                        break;
                    case 0: // Filho
                        dup2(fildes[i-1][0],0); 
                        close(fildes[i-1][0]); 
                        execlp("wc","wc", "-l", NULL);
                        break;
                    default: // Pai
                        close(fildes[i-1][0]);
                        break;
                }
                break;
            }
        }
    }
    for(int i = 0; i < nprocesses; i++) wait(NULL);
    return 0;
}