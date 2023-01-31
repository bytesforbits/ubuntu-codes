%{
#include <stdio.h>
%}
%%
[0-9]+ {printf("Number\n");}
[a-zA-Z][a-zA-Z0-9]* {printf("Word\n");}
[0-9][a-zA-Z0-9]* {printf("other\n");}
%%

int main(){
yylex();
}

