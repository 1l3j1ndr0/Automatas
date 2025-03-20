%option noyywrap
%{
	#include<stdio.h>
%}

%%
[a-z]{2}[0-9]*@uaeh\.edu\.mx { printf("CORREO INSTITUCIONAL: %s\n", yytext); }
%%
int main()
{
printf("Ingrese texto para analizar:\n");
yylex();  // Llama al analizador léxico
	return 0;
}