%{
#include <stdio.h>
#include <string.h>

int yylex();
int yyparse();

int yywrap()
{
	return 1;
}

void yyerror(const char *str)
{
	fprintf(stderr,"error: %s\n",str);
}

int main()
{
	yyparse();
}

%}

%union
{
    int num_int;
    float num_float;
    char *str;
}

%token INCLUDE
%token INT FLOAT CHAR VOID DOUBLE
%token WHILE FOR IF ELSE
%token PRINTF
%token LS_EQ GR_EQ EQ NOT_EQ

%token <num_int> INTEIRO
%token <num_float> REAL
%token <str> NOME_VAR
%token <str> STRING_TOKEN
%token <str> COMENTARIO

%start blocos

%type<num_int> numero expressao



%%

blocos: blocos bloco 
    | bloco
    ;

bloco: funcao
    |declaracao
    ;

funcao: 
    PRINTF '(' STRING_TOKEN ')' ';'     { printf("printf -- %s -- OK", $3);}
    ;

declaracao:
    tipo NOME_VAR '=' expressao ';' { printf("%s = %d OK",$2,$4);}
    ;

tipo:
    INT
    |FLOAT
    |CHAR
    |VOID
    |DOUBLE
    ;

expressao: numero               { $$ = $1;}
    |numero '+' numero          { $$ = $1 + $3;}
    |numero '-' numero          { $$ = $1 - $3;}
    |numero '*' numero          { $$ = $1 * $3;}
    |numero '/' numero          { $$ = $1 / $3;}
    ;

numero: 
    INTEIRO                     {$$ = $1;}
    |REAL                       {$$ = $1;}
    ;
%%

// int main()
// {
// 	yyparse();
// }
