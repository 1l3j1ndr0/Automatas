%option noyywrap
%{
	#include<stdio.h>
%}

%%
[A-Z]{4}[0-9]{6}[A-Z0-9]{3}  { printf("RFC: %s\n", yytext); }
%%
int main()
{
printf("Ingrese texto para analizar:\n");
yylex();  // Llama al analizador l�xico
	return 0;
}