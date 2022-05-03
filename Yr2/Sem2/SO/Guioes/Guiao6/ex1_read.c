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

    if((fd = open("fifo", O_RDONLY)) == -1) {
        perror("open");
        return -1;
    }
    else {
        printf("opened fifo for reading\n");
    }
    
    while((bytes_read = read(fd, buf, MAX)) != 0) 
        write(1, buf, bytes_read);
    
    close(fd);
    unlink("fifo");
    return 0;
}
