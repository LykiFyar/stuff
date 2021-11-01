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

typedef enum {
    NotValid = 0,
    Valid = 1,
} ISVALID;

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
    ISVALID is_valid;
} USER;


ISVALID validtime(struct tm t) {
    int result = Valid;
    time_t currenttime = time(&currenttime);
    time_t convertedtime = mktime(&t);
    time_t limiteinferior = 1112832000; // 7 de Abril de 2005 00:00:00 convertido com mktime(strptime)
    if(convertedtime > currenttime || convertedtime < limiteinferior) result = NotValid;
    return result;
}

ISVALID check_user_valid(USER u) {
    ISVALID end = Valid;
    if (u.id<0 ||
        u.type == Unknown ||
        validtime(u.created_at) == NotValid ||
        u.followers < 0 ||
        u.followers != (sizeof(u.follower_list)/sizeof(u.follower_list[0])) ||
        u.following < 0 ||
        u.following != (sizeof(u.following_list)/sizeof(u.following_list[0])) ||
        u.public_gists < 0 ||
        u.public_repos < 0 )
        end = NotValid;
    return end;
}

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
    printf("\nNumber of public gists: %d\nNumber of public repositories: %d\nIs valid? : %d",(*user).public_gists,(*user).public_repos, (*user).is_valid);
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
    u.is_valid = check_user_valid(u);
    return u;
}

int main() {
    char buffer[3000000];
    USER *users = malloc(sizeof(USER));
    int i=0, valids = 0, invalids = 0;
    FILE *data_file = fopen("users.csv", "r");
    if(data_file == NULL) {
        printf("Error loading file\n");
        return 1;
    }
    fgets(buffer,3000000,data_file); // skip header
    while(fgets(buffer,3000000,data_file)) {
        users = realloc(users, (i+1)*sizeof(USER));
        users[i] = init_user(buffer);
        if (users[i].is_valid == Valid) valids += 1;
        else if (users[i].is_valid == NotValid) invalids += 1;
        show_user(&(users[i]));
        i++;
        
    }
    fclose(data_file);
    printf("Nº de users válidos: %d\nNº de users inválidos: %d\n",valids,invalids);
    return 0;
}