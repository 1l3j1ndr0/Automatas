%option noyywrap
%{
	#include<stdio.h>
%}

%%
[a-zA-Z](plicar|lasificar|ompletar|onstruir|emostrar|ibujar|jecutar|mplear|sbozar|xaminar|lustrar|nterpretar|ostar|lanear|racticar|rogramar|razar|sar|tilizar)  { printf("Verbo de aplicacion: %s\n", yytext); }
%%
int main()
{
char nombre_archivo[100];  // Buffer para almacenar el nombre del archivo

    printf("Ingresa el nombre del archivo de entrada: ");
    fgets(nombre_archivo, sizeof(nombre_archivo), stdin);  // Leer el nombre del archivo

    // Eliminar el salto de l�nea que podr�a quedar al final del nombre del archivo
    nombre_archivo[strcspn(nombre_archivo, "\n")] = '\0';

    FILE *archivo = fopen(nombre_archivo, "r");  // Intentar abrir el archivo
    if (!archivo) {
        perror("Error al abrir el archivo");
        return 1;
    }

    yyin = archivo;  // Asigna el archivo de entrada
    yylex();         // Llama al analizador l�xico
    fclose(archivo);

    return 0;
}