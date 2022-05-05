#include <signal.h>
#include <sys/types.h>
#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>


int ctrlc_counter;
int exit_;
int time;

void sigquit_handler(int signum) {
    printf("O utilizador enviou %d CTRL+C.\n", ctrlc_counter);
    exit_ = 1;
}

void sigint_handler(int signum) {
    printf("Passaram %d segundo(s).\n", time);
    ctrlc_counter++;
}

void sigalrm_handler(int signum) {
    time++;
    //printf("Time: %d segundo(s).\n", time);
    alarm(1);
}

int main(int argc, char const *argv[]) {

    signal(SIGQUIT, sigquit_handler);
    signal(SIGINT, sigint_handler);
    signal(SIGALRM, sigalrm_handler);
    
    ctrlc_counter = 0;
    exit_ = 0;
    time = 0;

    alarm(1);
    while (exit_ == 0) {
        pause();
    }
    
    return 0;
}
