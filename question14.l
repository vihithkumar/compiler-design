%{
#include<stdio.h>
%}

%%

"="|[-+*/]   { printf("Valid operator: %s\n", yytext); }
.             { printf("Invalid input\n"); }

%%

int yywrap() {
    return 1;
}

int main() {
    printf("Enter the input: ");
    yylex();
    return 0;
}
