%{
#include <stdio.h>
%}

%%
((http)|(ftp))s?:\/\/[a-zA-Z0-9]{2}(\.[a-z]{2,6})+(\/[a-zA-Z0-9+=?]*)* { printf("\nURL Valid\n"); }
www { printf("\nURL Invalid (Missing Protocol)\n"); }
.|\n { printf("\nURL Invalid (Unknown Format)\n"); }
%%

int yywrap() { return 1; }

int main() {
    printf("\nEnter URL: ");
    yylex();
    printf("\n");
    return 0;
}
