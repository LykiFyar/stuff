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
    int* follower_list;
    int following;
    int* following_list;
    int public_gists;
    int public_repos;
    } USER;

int* make_list(char* s) {
    int* v, i;
    if (*s == '[') {
        i = 0;
        while(*s != ']' || *s) {
            v = realloc(v,sizeof(int)*(i+1));
            v[i] = atoi(strsep(&s, ";"));
            i++;
        }
    }
    return v;
}

void print_list(int v[], int N) {
    int i = 0;
    while (i<N) {
        printf("%d;",v[i]);
        i++;
    }
}

void show_user(USER *users) {
    while(users) {
        printf("-------------\nUser id: %d\nUser login: %s\nType of user: %s\nAccount created at: %s\nFollowers: %d\nIDs of followers: ",(*users).id,(*users).login,(*users).type,(*users).created_at,(*users).followers);
        print_list((*users).follower_list,(*users).followers);
        printf("\nFollowing: %d\nIDs of following: ",(*users).following);
        print_list((*users).following_list,(*users).following);
        printf("s\nNumber of public gists: %d\nNumber of public repositories: %d\n",(*users).public_gists,(*users).public_repos);
    }
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
    USER *users = malloc(sizeof(USER));
    int i=0;
    FILE *data_file = fopen("users.csv", "r");
    if(data_file == NULL) {
        printf("Error loading file\n");
        return 1;
    }
    fgets(buffer,200,data_file); // skip header
    while(fgets(buffer,200,data_file)) {
        users = realloc(users, (i+1)*sizeof(USER));
        users[i] = init_user(buffer);
        i++;
    }
    fclose(data_file);
    for(int j=0; j<100; j++) { 
        show_user(users);
    }
    return 0;
}