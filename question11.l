%{
#include <stdio.h>

void print_validity(int is_valid) {
    if (is_valid) {
        printf("Valid DOB: %s\n", yytext);
    } else {
        printf("Invalid DOB: %s\n", yytext);
    }
}

int is_valid_date(int day, int month, int year) {
    if (year < 1900 || year > 2100) return 0;  // Year range check
    if (month < 1 || month > 12) return 0;    // Month range check
    if (day < 1) return 0;                    // Minimum day check

    // Days in each month
    int days_in_month[] = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};

    // Leap year adjustment
    if (month == 2 && ((year % 4 == 0 && year % 100 != 0) || (year % 400 == 0))) {
        days_in_month[1] = 29;
    }

    if (day > days_in_month[month - 1]) return 0; // Maximum day check

    return 1;
}
%}

%%
[0-3][0-9][-/][0-1][0-9][-/][1-2][0-9]{3} {
    int day, month, year;
    sscanf(yytext, "%d%*c%d%*c%d", &day, &month, &year);
    print_validity(is_valid_date(day, month, year));
}
\n { /* Ignore newlines */ }
. { /* Ignore any other characters */ }
%%

int yywrap() { return 1; }

int main() {
    yylex();
    return 0;
}
