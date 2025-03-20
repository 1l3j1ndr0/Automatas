%option noyywrap
%{
	#include<stdio.h>
%}

%%
[0-9]+.[0-9]* { printf("Numero decimal: %s\n", yytext); }

%%
int main()
{
	printf("Ingrese texto para analizar:\n");
    yylex();  // Llama al analizador léxico
	return 0;
}