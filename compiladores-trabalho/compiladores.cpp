%option noyywrap
%x NOMEUC

%{
#define YY_NO_UNISTD_H

#include "stdio.h"	
%}

%%

UC= {BEGIN( NOMEUC ); }

<NOMEUC>[A-Za-z ]+ {BEGIN(INITIAL); {strcpy(yylval.texto,yytext);return UCNOME;}}

[0-9]{2}/%	{strcpy(yylval.texto,yytext);return PESO;}

[0-9]+/#	{strcpy(yylval.texto,yytext); return NMEC;}

[[0-9.]+|Faltou|-]/# {yylval.decimal = atof(yytext); return NOTA; }


[a-zA-Z ]+/# {strcpy(yylval.texto,yytext); return NOME;}


[\n] return ENTER;

%%
