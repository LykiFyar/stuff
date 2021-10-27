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
    } USER;

int* make_list(char* s) {
    int* v, i;
    if (*s == '[') {
        i = 0;
        while(*s != ']') {
            v = realloc(v,sizeof((i+1)*int));
            v[i] = atoi(strsep(&s, ";"));
            i++;
        }
    }
    else &v = NULL;
    return &v;
}

USER init_user(char* info){
    struct user u;
    u.id = atoi(strsep(&info, ";"));
    u.login = strdup(strsep(&info, ";"));
    char* typeofuser = strsep(&info, ";");
    if (strcmp(typeofuser,"Bot")) u.type = Bot;
    else if (strcmp(typeofuser,"User")) u.type = User;
        else if (strcmp(typeofuser,"Organization")) u.type = Organization;
            else u.type = -1;
    u.created_at = strdup(strsep(&info, ";"));
    u.followers = atoi(strsep(&info, ";"));
    u.follower_list = make_list(strdup(strsep(&info, ";")));
    u.following = atoi(strsep(&info, ";"));
    u.following_list = make_list(strdup(strsep(&info, ";")));
    u.public_gists = atoi(strsep(&info, ";"));
    u.public_repos = atoi(strsep(&info, ";"));
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
    while(fgets(buffer,200,data_file)) { // needs review
        }
    return 0;
}