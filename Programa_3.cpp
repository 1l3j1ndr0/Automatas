#include <iostream>
#include <fstream>
#include <sstream>
#include <cctype>

using namespace std;

// Funciones para clasificar lexemas
bool esNumero(const string& lexema) {
    for (int i = 0; i < lexema.length(); i++) {
        if (!isdigit(lexema[i])) {
            return false;
        }
    }
    return true;
}

bool esPalabra(const string& lexema) {
    for (int i = 0; i < lexema.length(); i++) {
        if (!isalpha(lexema[i])) {
            return false;
        }
    }
    return true;
}

int main() {
    // Abrir archivo
    ifstream archivo("entrada.txt");
    if (!archivo) {
        cerr << "No se pudo abrir el archivo de entrada." << endl;
        return 1;
    }

    // Leer contenido del archivo
    string contenido, lexema;
    stringstream buffer;
    buffer << archivo.rdbuf();
    contenido = buffer.str();
    archivo.close();

    // Contadores
    int totalConEspacios = contenido.length();
    int totalSinEspacios = 0, totalLexemas = 0;
    int totalPalabras = 0, totalNumeros = 0, totalCombinadas = 0;

    // Procesar cada lexema
    stringstream ss(contenido);
    while (ss >> lexema) {
        totalLexemas++;
        totalSinEspacios += lexema.length();
        
        if (esNumero(lexema)) {
            totalNumeros++;
        } 
        else if (esPalabra(lexema)) {
            totalPalabras++;
        } 
        else {
            totalCombinadas++;
        }
    }

    // Mostrar resultados
    cout << "Total de caracteres (con espacios): " << totalConEspacios << endl;
    cout << "Total de caracteres (sin espacios): " << totalSinEspacios << endl;
    cout << "Total de lexemas: " << totalLexemas << endl;
    cout << "Total de palabras: " << totalPalabras << endl;
    cout << "Total de números: " << totalNumeros << endl;
    cout << "Total de combinadas: " << totalCombinadas << endl;

    return 0;
}

