#include <unistd.h>
#include <stdio.h>
#include <sys/wait.h>

int main(int argc, char* argv[]) {
    printf("Starting...\n");
    int status;
    pid_t pid;
    for(int i = 1; i < argc; i++) {
        if((pid = fork()) == 0){
            // With the arguments as seperated parameters for execl & execlp
            // Using execl - this needs the full path of the executable to work .-.
            //execl(argv[i], argv[i], NULL);

            // Using execlp
            //execlp(argv[i], argv[i], NULL);

            // With an array with the arguments - execv & execvp
            char *array[2];
            array[0] = argv[i];
            array[1] = NULL;
            // Using execv - this needs the full path of the executable to work .-.
            //execv(argv[i], array);

            // Using execvp
            execvp(argv[i], array);

            _exit(-1); // se o exec for bem sucedido, o programa original executado agora pelo filho é substituído pelo executado pelo exec, logo o processo acaba a retornar pelo exit o valor 0. 
                       // Caso não seja bem sucedido, esta linha é executada e sai com valor -1.
        }
    }
    for(int i = 1; i < argc; i++) {
        wait(&status);
        if(WEXITSTATUS(status) == 0) printf("Ended command - all went well\n");
        else printf("Something went wrong\n");
    }
    return 0;
}
