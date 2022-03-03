#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/types.h>
#include <unistd.h>
#include <fcntl.h>

#include <errno.h>

typedef struct person{
    char name[200];
    int age;
} Person;

#define FILENAME "lelz"