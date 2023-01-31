%{
double vbltable[26];
%}
%union {
double dval;
int vblno;
}

%token <vblno> NAME
%token <dval> NUMBER
%left '-' '+'
%left '*' '/'
%nonassoc UMINUS
%type <dval> expression

%%
statement_list: statement '\n'
| statement_list statement '\n'
;
statement: NAME '=' expression { vbltable[$1] = $3; }
| expression { printf("= %g\n", $1); }
;
expression: expression '+' expression { $$ = $1 + $3; }
| NUMBER
| NAME { $$ = vbltable[$1]; }
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
