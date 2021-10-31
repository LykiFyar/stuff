#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <time.h>

typedef enum {
    Unknown = 1,
    User = 2,
    Bot = 3,
    Organization = 4,    
} TYPE;

typedef struct user {
    int id;
    char* login;
    TYPE type;
    struct tm created_at;
    int followers;
    int* follower_list;
    int following;
    int* following_list;
    int public_gists;
    int public_repos;
    int is_valid;
} USER;

TYPE set_type(char* s) {
    TYPE t;
    if (strcmp(s,"User")) t = User;
    else if (strcmp(s,"Bot")) t = Bot;
    else if (strcmp(s,"Organization")) t = Organization;
    else t = Unknown;
    return t;
}

void print_type(TYPE t) {
    if (t == User) printf("User");
    else if (t == Bot) printf("Bot");
    else if (t == Organization) printf("Organization");
    else printf("Unknown");  
}

struct tm convert_str2time(char* s) {
    struct tm t = {0};
    strptime(s, "%Y-%m-%d %T", &t);
    return t;
}

void print_time(struct tm t) {
    printf("%04d-%02d-%02d %02d:%02d:%02d",t.tm_year + 1900,t.tm_mon + 1, t.tm_mday, t.tm_hour, t.tm_min, t.tm_sec);
}

int* make_list(char *s, int* v) {
    int i = 0, t;
    char *c, *temp;
    if (*s == '[') {
        s += 1;
        c = s;
        while(*s) {
            t = 0;
            while(*c != ',' && *c != ']') {
                c += 1;
                t += 1;
            }
            if(strlen(s)) {
                v = realloc(v,(sizeof(int))*(i+1));
                temp = strndup(s,t);
                v[i] = atoi(temp);
                c += 1;
                s = c;
                i++;
            }
        }
    }
    else v = NULL;
    return v;
}

void print_list(int *v, int N) {
    int i = 0;
    if (v) {
        while (i<N && v[i]) {
            printf("%d;",v[i]);
            i++;
        }
    }
}

void show_user(USER *user) {
    printf("-------------\nUser id: %d\nUser login: %s\nType of user: ",(*user).id,(*user).login);
    print_type((*user).type);
    printf("\nAccount created at: ");
    print_time((*user).created_at);
    printf("\nFollowers: %d\nIDs of followers: ",(*user).followers);
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
    u.type = set_type(typeofuser);
    u.created_at = convert_str2time(strdup(strsep(&info, ";")));
    u.followers = atoi(strsep(&info, ";"));
    char *flwrlist = strsep(&info, ";");
    u.follower_list = make_list(flwrlist, u.follower_list);
    u.following = atoi(strsep(&info, ";"));
    char *flwglist = strdup(strsep(&info, ";"));
    u.following_list = make_list(flwglist, u.following_list);
    u.public_gists = atoi(strsep(&info, ";"));
    u.public_repos = atoi(info);
    u.is_valid = 0;
    return u;
}

int main() {
    char buffer[3000000];
    USER *users = malloc(sizeof(USER));
    int i=0;
    FILE *data_file = fopen("users.csv", "r");
    if(data_file == NULL) {
        printf("Error loading file\n");
        return 1;
    }
    fgets(buffer,3000000,data_file); // skip header
    while(fgets(buffer,3000000,data_file)) {
        users = realloc(users, (i+1)*sizeof(USER));
        users[i] = init_user(buffer);
        show_user(&(users[i]));
        i++;
        
    }
    fclose(data_file);
    return 0;
}