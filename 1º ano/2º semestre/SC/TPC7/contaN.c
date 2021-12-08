int contaN(char* s, int c) {
    int i;
    int result;
    result = 0;
    for (i = c; s[i]!= '\0' ; i++) {
     if (s[i] >= '0' && s[i] <= '9' ) 
        result += s[i] - '0';
    }
 return result;
}