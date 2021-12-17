#include <stdio.h>
#include <string.h>
#include <stdlib.h>

typedef struct user {
    int public_repos;
    char* id;
} USER;

USER init_user(char* info){
    struct user u;
    u.public_repos = atoi(strsep(&info, ";"));
    u.id = strdup(strsep(&info, ";"));
    return u;
}

void show_user(struct user u) {
    printf("public_repos: %d, id: %s\n", u.public_repos, u.id);
}

int main(){
    char buffer[200];
    // ANTES
    // char lines[200][200];
    struct user *users = NULL;
    int i = 0;

    FILE *data_file = fopen("users100.csv", "r");
    if(data_file == NULL) {
        printf("Error loading file\n");
        return 1;
    }
    fgets(buffer,200,data_file); // skip header
    while(fgets(buffer,200,data_file)) {
        users = realloc(users, (i+1)*sizeof(struct user));
        users[i] = init_user(buffer);
        i++;
    }
    fclose(data_file);
    for(int i=0; i<100; i++) { 
        show_user(users[i]);
    }
    return 0;
}




