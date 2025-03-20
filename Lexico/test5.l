%option noyywrap
%{
	#include<stdio.h>
%}

%%
[A-Z]{4}[0-9]{6}[HM][A-Z]{2}[A-Z]{3}[0-9]{2} { printf("CURP: %s\n", yytext); }
%%
int main()
{
printf("Ingrese texto para analizar:\n");
yylex();  // Llama al analizador léxico
	return 0;
}