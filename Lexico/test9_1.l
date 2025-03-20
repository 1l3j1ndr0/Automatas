%option noyywrap
%{
	#include<stdio.h>
%}

%%
(Analizar|Calcular|Catalogar|Categorizar|Comparar|Contrastar|Criticar|Cuestionar|Debatir|Diagramar|Diferenciar|Diagramar|Discutir|Distinguir|Examinar|Experimentar|Explicar|Identificar|Investigar|Lograr|Organizar|Probar|Relatar|Resolver)      { printf("Verbo de analizar: %s\n", yytext); }
(hermoso|positivo|exitoso|efectivo|importante)         { printf("Adjetivo calificativo positivo: %s\n", yytext); }
(y|e|pero|porque|aunque|si|cuando)                       { printf("Conjuncion: %s\n", yytext); }
(a|ante|bajo|con|contra|de|desde|en|entre|hacia|para|por|sobre) { printf("Preposicion: %s\n", yytext); }
(yo|tu|el|ella|nosotros|vosotros|ellos)                 { printf("Pronombre: %s\n", yytext); }

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