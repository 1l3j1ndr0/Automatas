/* Seccion de delcaraciones C */
%{
	#include<stdio.h>
	int yylex(void);
	int yywrap ();
	int wrap();
	int yyerror(char* s);
%}
/* Seccion de declaraciondes YACC */
%start sentence
%token NUMERO OPERADOR
/*Reglas de la gramatica */
%% 
	sentence: NUMERO OPERADOR NUMERO {printf("Entrada correcta.\n");}
%%
/* Codigo C */
int main()
{
	printf("beggining...\n");
	int res = yyparse();
	printf("s\n ending",res);
	return (res);
}