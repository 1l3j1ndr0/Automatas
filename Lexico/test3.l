%option noyywrap
%{
	#include<stdio.h>
%}

%%
[a-zA-Z][a-zA-Z0-9_]* { printf("Identificador: %s\n", yytext); }
%%
int main()
{
printf("Ingrese texto para analizar:\n");
yylex();  // Llama al analizador léxico

	return 0;
}