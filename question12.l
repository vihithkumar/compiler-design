%{
#include <stdio.h>

void print_token(const char *type) {
    printf("Token recognized: %s (%s)\n", yytext, type);
}
%}

%%
[a-zA-Z]+    { print_token("word"); }
"=="|"<="|">="|"!="|"<"|">"  { print_token("relational operator"); }
[ \t\n]      { /* Ignore whitespace */ }
.            { /* Ignore any other characters */ }
%%

int yywrap() { return 1; }

int main() {
    printf("Enter text for token recognition:\n");
    yylex();
    return 0;
}
