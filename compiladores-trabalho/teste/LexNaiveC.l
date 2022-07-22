%{
    #include <stdio.h>
    #include "y.tab.h"
%}

/* Analisador Léxico para naive-C */

%%
-?[0-9]+                                {yylval.num_int = atoi(yytext); return INTEIRO;}
-?[0-9]*\.[0-9]+                        {yylval.num_float = atof(yytext); return REAL;}
"#include"                              return INCLUDE;


"int"                                   return INT;
"float"                                 return FLOAT;
"char"                                  return CHAR;
"void"                                  return VOID;
"double"                                return DOUBLE;


"while"                                 return WHILE;
"for"                                   return FOR;
"if"                                    return IF;
"else"                                  return ELSE;

"printf"                                return PRINTF;


"<="                                    return LS_EQ;
">="                                    return GR_EQ;
"=="                                    return EQ;
"!="                                    return NOT_EQ;


[a-z][a-zA-Z0-9]*                       {yylval.str = strdup(yytext); return NOME_VAR;}
["][^"]*["]                             {yylval.str = strdup(yytext); return STRING_TOKEN;}
\/\*(.*\n)*.*\*\/                       {yylval.str = strdup(yytext); return COMENTARIO;}
[ \n\t]                                 ;

.                                       return yytext[0];

%%