%{
#include <stdio.h>
unsigned charCount =0, wordCount=0, lineCount=0;
%}
word [^ \t\n][a-zA-Z\-\']+
eol \n

%%
{word} { wordCount++; charCount += yyleng; }
{eol} { charCount++; lineCount++; }
[a-zA-Z0-9]+ {}
%%

int main(){
yylex();
printf("\n%d %d %d\n",lineCount, wordCount, charCount);
}

