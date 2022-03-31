#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/types.h>
#include <unistd.h>
#include <fcntl.h>

#include <errno.h>

#define MAX_BUF 1024*1024

int main(int argc, char* argv[]) {

    char buffer[MAX_BUF];
    int bytes_read;
    while( (bytes_read = read(0, buffer, MAX_BUF)) > 0) write(1, buffer, bytes_read);

    printf("Done.\n");

    return 0;
}