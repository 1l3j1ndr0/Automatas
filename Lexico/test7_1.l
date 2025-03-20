%option noyywrap
%{
	#include<stdio.h>
%}

%%
.   { putchar(tolower(yytext[0])); }
%%
int main()
{
char nombre_archivo[100];  // Buffer para almacenar el nombre del archivo

    printf("Ingresa el nombre del archivo de entrada: ");
    fgets(nombre_archivo, sizeof(nombre_archivo), stdin);  // Leer el nombre del archivo

    // Eliminar el salto de línea que podría quedar al final del nombre del archivo
    nombre_archivo[strcspn(nombre_archivo, "\n")] = '\0';

    FILE *archivo = fopen(nombre_archivo, "r");  // Intentar abrir el archivo
    if (!archivo) {
        perror("Error al abrir el archivo");
        return 1;
    }

    yyin = archivo;  // Asigna el archivo de entrada
    yylex();         // Llama al analizador léxico
    fclose(archivo);

    return 0;
}