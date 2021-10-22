#include <stdio.h>
#include <string.h>
#include <stdlib.h>

typedef enum {
    Bot = 0,
    User = 1,
    Organization = 2,
} TYPE;

typedef struct user {
    int id;
    char* login;
    TYPE type;
    char* created_at;
    int followers;
    int follower_list[10];
    int following;
    int following_list[10];
    int public_gists;
    int public_repos;
    int is_valid;
    } USER;


USER init_user(char* info){
    struct user u;
    u.id = atoi(strsep(&info, ";"));

    return u;
}

int main() {
    char buffer[200];
    USER *users = NULL;
    int i=0;
    FILE *data_file = fopen("users.csv", "r");
    if(data_file == NULL) {
        printf("Error loading file\n");
        return 1;
    }
    fgets(buffer,200,data_file); // skip header
    while(fgets(buffer,200,data_file)) {
        users = realloc(users, (i+1)*sizeof(USER));
        users[i] = init_user(data_file);
        if (!users[i].is_valid) {
            i--;
        }
        i++;
        }
    return 0;
}