#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/types.h>
#include <unistd.h>
#include <fcntl.h>

#include <errno.h>

#define MAX_BUF 1024*1024

ssize_t readln (int fd, char *line, size_t size){
    
    int i = 0;

    while(i < size && readc(fd, &line[i]) > 0) {
        i++;
        if(((char*) line)[i-1] == '\n') return i;
    }
    return i;
}

int readc(int fd, char* c) {
    return read(fd, c, 1);
}

int main(int argc, char* argv[]) {
    int line_counter = 0;
    char buffer[MAX_BUF];
    int bytes_read = 0;
    int newline = 1;

    while( (bytes_read = readln(0, buffer, MAX_BUF)) > 0) {
        char line_number[10] = "";
        if(newline && buffer[0] != '\n') {
            snprintf(line_number, 10, "%d:", line_counter);
            //i hate this
            // not done
        }
    }
}