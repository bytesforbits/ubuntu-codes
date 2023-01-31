%{
/*
* A lexer for the basic grammar to use for recognizing English sentences.
*/
#include <stdio.h>
int yylex();
int yyerror();

%}


%token NOUN PRON VERB ADV ADJ PREP CONJ NOUN_OR_VERB
%%
sentence: subject VERB object { printf("Sentence is valid.\n"); }
;
subject: NOUN
| PRON | NOUN_OR_VERB 
;
object: NOUN | NOUN_OR_VERB 
;
%%
extern FILE *yyin;
int main()
{
do
{
yyparse();
}
while (!feof(yyin));
return 0;
}
int yyerror(s)
char *s;
{

fprintf(stderr, "1%s\n", s);
}
