%{
#include <stdio.h>
#include <string.h>
int maxLength = 0;
%}
%%
[a-zA-Z]+ {
    int len = strlen(yytext);
    if (len > maxLength) {
        maxLength = len;
    }
}
\n { /* Ignore newlines */ }
. { /* Ignore any other characters */ }
%%
int yywrap() { return 1; }
int main() {
    yylex();
    printf("Length of the longest word: %d\n", maxLength);
    return 0;
}
