#include <sys/types.h>
#include <sys/stat.h>
#include <stdio.h>
#include <unistd.h>
#include <sys/wait.h>
#include <string.h>
#include <fcntl.h>

#define MAX 1048

int main(int argc, char const *argv[]) {
    char buf[MAX];
    int fd;
    int bytes_read = 0;

    if((fd = open("pipe", O_WRONLY)) == -1) {
        perror("open");
        return -1;
    }
    else {
        printf("Opened pipe for writing\n");
        //fflush(stdout);
    }
    
    while((bytes_read = read(0, buf, MAX)) != 0) 
        write(fd, buf, bytes_read);
    
    close(fd);
    return 0;
}

