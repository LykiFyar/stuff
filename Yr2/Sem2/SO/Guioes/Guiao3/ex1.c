#include <unistd.h>
#include <stdio.h>

int main() {
    printf("Starting...\n");
    
    // With the arguments as seperated parameters for execl & execlp
    // Using execl
    //execl("/usr/bin/ls", "ls", "-l", NULL);

    // Using execlp
    //execlp("ls", "ls", "-l", NULL);

    
    // With an array with the arguments - execv & execvp
    char *argv[3];
    argv[0] = "ls";
    argv[1] = "-l";
    argv[2] = NULL;
    // Using execv
    //execv("/usr/bin/ls", argv);

    // Using execvp
    execvp("ls", argv);

    printf("\nSome gibberish.\n"); // se o exec for bem sucedido, o programa original é substituído pelo executado pelo exec, logo esta linha não aparece no terminal.
    return 0;
}
