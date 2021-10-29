#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <time.h>

typedef struct user {
    int id;
    char* login;
    char* type;
    char* created_at; // strptime !!
    int followers;
    int* follower_list;
    int following;
    int* following_list;
    int public_gists;
    int public_repos;
    } USER;


int* make_list(char s[], int* v) {
    int i = 0;
    if (*s == '[') {
        s += 1;
        while(*s) {
            v = realloc(v,(sizeof(int))*(i+1));
            v[i] = atoi(strsep(&s, ","));
            i++;
        }
    }
    else v = NULL;
    return v;
}

void print_list(int v[], int N) {
    int i = 0;
    while (i<N && v[i]) {
        printf("%d;",v[i]);
        i++;
    }
}

void show_user(USER *user) {
    printf("-------------\nUser id: %d\nUser login: %s\nType of user: %s\nAccount created at: %s\nFollowers: %d\nIDs of followers: ",(*user).id,(*user).login,(*user).type,(*user).created_at,(*user).followers);
    print_list((*user).follower_list,(*user).followers);
    printf("\nFollowing: %d\nIDs of following: ",(*user).following);
    print_list((*user).following_list,(*user).following);
    printf("\nNumber of public gists: %d\nNumber of public repositories: %d\n",(*user).public_gists,(*user).public_repos);
}

USER init_user(char* info){
    struct user u;
    u.follower_list = NULL, u.following_list = NULL;
    u.id = atoi(strsep(&info, ";"));
    u.login = strdup(strsep(&info, ";"));
    char* typeofuser = strsep(&info, ";");
    if (strcmp(typeofuser,"Bot") || strcmp(typeofuser,"User") || strcmp(typeofuser,"Organization")) u.type = strdup(typeofuser);
    else u.type = "UNKNOWN";

    u.created_at = strdup(strsep(&info, ";"));
    u.followers = atoi(strsep(&info, ";"));
    u.follower_list = make_list(strdup(strsep(&info, "];")), u.follower_list);
    u.following = atoi(strsep(&info, ";"));
    u.following_list = make_list(strdup(strsep(&info, "];")), u.following_list);
    u.public_gists = atoi(strsep(&info, ";"));
    u.public_repos = atoi(info);
    return u;
}

int main() {
    char buffer[10000];
    USER *users = malloc(sizeof(USER));
    int i=0;
    FILE *data_file = fopen("users.csv", "r");
    if(data_file == NULL) {
        printf("Error loading file\n");
        return 1;
    }
    fgets(buffer,10000,data_file); // skip header
    // while(fgets(buffer,10000,data_file)) {
        while(i<13) {
        fgets(buffer,10000,data_file);
        users = realloc(users, (i+1)*sizeof(USER));
        users[i] = init_user(buffer);
        i++;
        
    }
    fclose(data_file);
    for(int j=0; j<100; j++) { 
        show_user(&(users[j]));
    }
    return 0;
}