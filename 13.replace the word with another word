%{ 
#include<stdio.h> 
#include<string.h> 
char replace_with [] = "nikhil"; 
char replace [] ="i"; 
%} 
%% 
[a-zA-Z]+ { if(strcmp(yytext, replace)==0) 
fprintf(yyout, "%s", replace_with); 
else
fprintf(yyout, "%s", yytext);} 
. fprintf(yyout, "%s", yytext); 
%% 
int yywrap() 
{ 
return 1; 
} 
int main() 
{ 
extern FILE *yyin, *yyout; 
yyin=fopen("rwinput.txt", "r"); 
 yyout=fopen("rwoutput.txt", "w"); 
yylex(); 
}