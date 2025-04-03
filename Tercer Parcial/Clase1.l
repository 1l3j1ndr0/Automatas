%option noyywrap
%{
    #include <stdio.h>

    int cont = 1;  // Contador de lÌneas
    int contP = 1;	//Contar palabras
    int contC = 1;	//Contar caracteres
%}

%%

\n+ { cont++; }  // Lineas
[a-zA-Z·ÈÌÛ˙¡…Õ”⁄¸‹Ò—0-9'-]+ {contP++;}	// Palabras
. {contC++;}	//Caracteres incluido los espacios

%%

int main() {
    char nombre_archivo[100];

    strcpy(nombre_archivo, "elbrutodelasmates.txt");

    FILE *archivo = fopen(nombre_archivo, "r");  // Abrir el archivo
    if (!archivo) {
        perror("Error al abrir el archivo");
        return 1;
    }

    yyin = archivo;  // Asigna el archivo de entrada
    yylex();         // Llama al analizador lÈxico
    fclose(archivo);

    printf("\nCantidad total de lineas: %d\n", cont);
    printf("Cantidad total de palabras: %d\n", contP);
    printf("Cantidad total de caracteres: %d\n", contC);


    return 0;
}
