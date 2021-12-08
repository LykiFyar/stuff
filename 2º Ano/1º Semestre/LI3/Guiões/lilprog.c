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

typedef struct {
    int *list;
    int counter;
} LIST;

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
    LIST follower_list;
    int following;
    LIST following_list;
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
        u.followers != u.follower_list.counter ||
        u.following < 0 ||
        u.following != u.following_list.counter ||
        u.public_gists < 0 ||
        u.public_repos < 0 )
        end = NotValid;
    return end;
}

TYPE set_type(char* s) {
    TYPE t;
    if (strcmp(s,"User") == 0) t = User;
    else if (strcmp(s,"Bot") == 0) t = Bot;
    else if (strcmp(s,"Organization") == 0) t = Organization;
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

LIST make_list(char *s, LIST l) {
    int i = 0, t;
    char *c, *temp;
    l.list = NULL;
    l.counter = 0;
    if (*s == '[') {
        s += 1;
        c = s;
        while(*s && *s != ']') {
            t = 0;
            while(*c != ',' && *c != ']') {
                c += 1;
                t += 1;
            }
            if(strlen(s)) {
                l.list = realloc(l.list,(sizeof(int))*(i+1));
                temp = strndup(s,t);
                l.list[i] = atoi(temp);
                l.counter += 1;
                c += 1;
                s = c;
                i++;
            }
        }
    }
    return l;
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
    print_list((*user).follower_list.list,(*user).followers);
    printf("\nFollowing: %d\nIDs of following: ",(*user).following);
    print_list((*user).following_list.list,(*user).following);
    printf("\nNumber of public gists: %d\nNumber of public repositories: %d\nIs valid? : %d\n",(*user).public_gists,(*user).public_repos, (*user).is_valid);
}

USER init_user(char* info){
    struct user u;
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

char* type2str(TYPE t) {
    char* s;
    if (t == User) s = "User";
    else if (t == Bot) s = "Bot";
    else if (t == Organization) s = "Organization";
    else s = "Unknown";
    return s;
}
/*  NON FUNCTIONAL
char* list2str(LIST l) {
    char* s = "[", *c = NULL;
    int i;
    if(l.counter != 0) {
        i = 0;
        while(l.list[i]) {
            c = sprintf(c,"%d",l.list[i]);
            s = realloc(s,sizeof(s)+strlen(c)+1);
            strcat(c," ");
            strcat(s, c);
        }
        s = realloc(s,sizeof(s)+1);
        strcat(s,"]");
    }
    else s = "[]";
    return s;
}
*/

void fprintlist(LIST l, FILE **stream) {
    int i = 0;
    if(l.counter > 0) {
        fprintf((*stream),"[%d", l.list[i]);
        i++;
        while(i<l.counter) {
            fprintf((*stream),", %d", l.list[i]);
            i++;
        }
        fprintf(*stream,"]");
    }
    else fprintf(*stream,"[]");
}

void fwriteuser(USER user, FILE **stream) {
    char* time = malloc(20);
    strftime(time,20,"%4Y-%2m-%2d %2H:%2M:%2S",&(user.created_at));
    fprintf((*stream),"%d;%s;%s;%s;%d;",user.id,user.login,type2str(user.type),time,user.followers);
    fprintlist(user.follower_list,stream);
    fprintf((*stream),";%d;",user.following);
    fprintlist(user.following_list,stream);
    fprintf((*stream),";%d;%d\n", user.public_gists, user.public_repos);
}


void fwriteusers(USER* users, ISVALID value, int maxusers, FILE **stream) {
    int i = 0;
    while(i<maxusers) {
        if(value == users[i].is_valid) fwriteuser(users[i], stream);
        i++;
    }
}

void fwriteusers2streams(USER* users, int maxusers, FILE **validstream, FILE **invalidstream) {
    int i = 0;
    while(i<maxusers) {
        if(users[i].is_valid == Valid) fwriteuser(users[i], validstream);
        else fwriteuser(users[i], invalidstream);
        i++;
    }
}

int main() {
    char buffer[3000000];
    USER *users = malloc(sizeof(USER));
    int i=0, valids = 0, invalids = 0, maxusers = 0;
    FILE *data_file = fopen("users.csv", "r");
    if(data_file == NULL) {
        printf("Error loading file\n");
        return 1;
    }
    fgets(buffer,3000000,data_file); // skip header
    while(fgets(buffer,3000000,data_file)) {
      /*  while (i<15) {         // para testes com poucos registos
            fgets(buffer,3000000,data_file); */
        users = realloc(users, (i+1)*sizeof(USER));
        users[i] = init_user(buffer);
        if (users[i].is_valid == Valid) valids += 1;
        else if (users[i].is_valid == NotValid) invalids += 1;
        maxusers += 1;
        // show_user(&(users[i]));
        i++;
        
    }
    fclose(data_file);
    printf("Nº de users válidos: %d\nNº de users inválidos: %d\n",valids,invalids);
    /*FILE *fprintvalid = fopen("users-ok.csv","w");
    fwriteusers(users,Valid,maxusers, &fprintvalid);
    fclose(fprintvalid);
    FILE *fprintinvalid = fopen("users-invalid.csv","w");
    fwriteusers(users,NotValid,maxusers, &fprintinvalid);
    fclose(fprintinvalid);
    */
    FILE *fprintvalid = fopen("users-ok.csv","w");
    FILE *fprintinvalid = fopen("users-invalid.csv","w");
    fwriteusers2streams(users,maxusers, &fprintvalid, &fprintinvalid);
    fclose(fprintvalid);
    fclose(fprintinvalid);
    return 0;
}
