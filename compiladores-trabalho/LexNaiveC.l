%{
    #include <stdio.h>
%}

/* Analisador Léxico para naive-C */

%%
-?[0-9]+                                fprintf(yyout,"Encontrado Inteiro \"%s\"\n",yytext);
-?[0-9]*\.[0-9]+                        fprintf(yyout,"Encontrado Real \"%s\"\n",yytext);
"int"|"float"|"char"|"void"|"double"    fprintf(yyout,"Encontrado Tipo \"%s\"\n",yytext);
"while"|"for"|"if"|"else"               fprintf(yyout,"Encontrado Instrucao \"%s\"\n",yytext);
"printf"                                fprintf(yyout,"Encontrado Funcao \"%s\"\n",yytext);
"("|")"|"["|"]"|"{"|"}"                 fprintf(yyout,"Encontrado Delimitador \"%s\"\n",yytext);
";"                                     fprintf(yyout,"Encontrado Terminador \"%s\"\n",yytext);
"<"|">"|"<="|">="|"=="|"!="             fprintf(yyout,"Encontrado Operador Relacional \"%s\"\n",yytext);
"+"|"-"|"*"|"/"                         fprintf(yyout,"Encontrado Operador Aritmetico \"%s\"\n",yytext);
"="                                     fprintf(yyout,"Encontrado Operador Atribuicao \"%s\"\n",yytext);
[a-z][a-zA-Z0-9]*                       fprintf(yyout,"Encontrado Variavel \"%s\"\n",yytext);
["][^"]*["]                             fprintf(yyout,"Encontrado String %s\n",yytext);
\/\*(.*\n)*.*\*\/                       fprintf(yyout,"Encontrado Comentario \"%s\"\n",yytext);
[ \n\t]                                 ;

%%
int main()
{
    extern FILE *yyin, *yyout;
    yyin = fopen("input.txt","r");
    yyout = fopen("output.txt", "w");

    return yylex();
}