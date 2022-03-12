#include "pessoas.h"

int new_person(char* name, int age) {

    int res;

    Person p;
    p.age = age;
    strcpy(p.name, name);

    //append permite escrever logo no fim
    int fd = open(FILENAME, O_CREAT | O_APPEND | O_WRONLY, 0600);

    res = write(fd, &p, sizeof(Person));
    if(res < 0) {
        perror("Error creating person.");
        return -1;
    }

    // Ex7

    int seek_res = lseek(fd, -sizeof(Person), SEEK_CUR);
    if(seek_res<0) {
        perror("Error lseek");
        return -1;
    }

    close(fd);
    return seek_res/sizeof(Person);
}

int person_change_age_v2(long pos, int age) {

    Person p;

    int fd = open(FILENAME, O_RDWR, 0600);
    int seek_res = lseek(fd, pos*sizeof(Person), SEEK_SET);
    if(seek_res<0) {
        perror("Error lseek");
        return -1;
    }

    int bytes_read = read (fd, &p, sizeof(Person));
    if(bytes_read<0) {
        perror("Error read");
        return -1;
    }

    printf("Read Person Name %s age- %d\n", p.name, p.age);

    p.age = age;

    int seek_res = lseek(fd, -sizeof(Person), SEEK_CUR);
    if(seek_res<0) {
        perror("Error lseek");
        return -1;
    }

    int res = write(fd, &p, sizeof(Person));
    if(res < 0) {
        perror("Error write");
        return -1;
    }

    printf("Wrote Person name %s age- %d\n", p.name, p.age);

    close(fd);
    
    return 0;
}

int person_change_age(char*name, int age) {
    Person p;
    int bytes_read;
    int res;

    // TODO
}


int main(int argc, char *argv[]) {
    
    char id[20] = "";

    if(strcmp(argv[1], "-i")) {
        new_person(argv[2], argv[3]);

    }
    return 0;
}