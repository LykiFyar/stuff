#include <unistd.h>
#include <stdio.h>
#include <sys/wait.h>
#include <string.h>


// NOT COMPLETE

// version that uses execl (as system()) and string is the path of the executable only
int mysystem_1(char* string) {
    printf("Starting...\n");
    int status;
    pid_t pid;
    if((pid = fork()) == 0){
        
        execl(string, string, NULL);

        _exit(-1); // se o exec for bem sucedido, o programa original executado agora pelo filho é substituído pelo executado pelo exec, logo o processo acaba a retornar pelo exit o valor 0. 
                    // Caso não seja bem sucedido, esta linha é executada e sai com valor -1.
    }
    else {
        wait(&status);
        if(WEXITSTATUS(status) == 0) printf("Ended command - all went well\n");
        else printf("Something went wrong\n");
    }
    return 0;
}

// version that uses execv and string is the path of the executable AND its arguments

int mysystem_2(char* string) {
    printf("Starting...\n");
    int status;
    int res;
    char* exec_args[20];
    char* token;
    pid_t pid;

    for(int i = 0; (token = strsep(string, " ")) != NULL; i++) exec_args[i] = strdup(token);
    if((pid = fork()) == 0){
        
        execv(exec_args[0], exec_args);

        _exit(-1); // se o exec for bem sucedido, o programa original executado agora pelo filho é substituído pelo executado pelo exec, logo o processo acaba a retornar pelo exit o valor 0. 
                    // Caso não seja bem sucedido, esta linha é executada e sai com valor -1.
    }
    else {
        waitpid(pid, &status, 0);
        if( (res = WEXITSTATUS(status)) == 0) printf("Ended command - all went well\n");
        else printf("Something went wrong\n");
    }
    return res;
}

int main(int argc, char* argv[]) {
    if(argc == 2) mysystem_2(argv[1]);
    return 0;
}
