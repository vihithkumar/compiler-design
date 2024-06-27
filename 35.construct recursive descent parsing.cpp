#include <stdio.h>
#include <stdlib.h>
#include <string.h>

const char *input;
int i = 0;

void E();
void E_prime();
void T();
void T_prime();
void F();

void error() {
    printf("Error in parsing\n");
    exit(1);
}

void match(char expected) {
    if (input[i] == expected) {
        i++;
    } else {
        error();
    }
}

void E() {
    T();
    E_prime();
}

void E_prime() {
    if (input[i] == '+') {
        match('+');
        T();
        E_prime();
    }
    // epsilon production (do nothing)
}

void T() {
    F();
    T_prime();
}

void T_prime() {
    if (input[i] == '*') {
        match('*');
        F();
        T_prime();
    }
    // epsilon production (do nothing)
}

void F() {
    if (input[i] == 'i') {
        match('i');
    } else if (input[i] == '(') {
        match('(');
        E();
        match(')');
    } else {
        error();
    }
}

int main() {
    input = (char *)malloc(50 * sizeof(char));
    printf("Enter the string: ");
    scanf("%s", input);
    
    E();
    
    // Check if the entire input string was consumed
    if (input[i] == '\0') {
        printf("Parsing successful\n");
    } else {
        error();
    }
    
    free((void *)input);
    return 0;
}
