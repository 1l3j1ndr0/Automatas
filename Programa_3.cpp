#include <iostream>
#include <fstream>
#include <sstream>
#include <cctype>
using namespace std;

bool esNumero(const string& lexema) {
    for (size_t i = 0; i < lexema.length(); i++) {
        if (!isdigit(lexema[i])) return false;
    }
    return true;
}

bool esPalabra(const string& lexema) {
    for (size_t i = 0; i < lexema.length(); i++) {
        if (!isalpha(lexema[i])) return false;
    }
    return true;
}

int main() {
    ifstream archivo("entrada.txt");
    if (!archivo) {
        cerr << "No se pudo abrir el archivo de entrada." << endl;
        return 1;
    }

    string contenido, lexema;
    int totalConEspacios = 0, totalSinEspacios = 0;
    int totalLexemas = 0, totalPalabras = 0, totalNumeros = 0, totalCombinadas = 0;

    stringstream buffer;
    buffer << archivo.rdbuf();
    contenido = buffer.str();
    totalConEspacios = contenido.length();

    stringstream ss(contenido);
    while (ss >> lexema) {
        totalLexemas++;
        totalSinEspacios += lexema.length();
        
        if (esNumero(lexema)) {
            totalNumeros++;
        } else if (esPalabra(lexema)) {
            totalPalabras++;
        } else {
            totalCombinadas++;
        }
    }

    archivo.close();

    cout << "Total de caracteres (con espacios): " << totalConEspacios << endl;
    cout << "Total de caracteres (sin espacios): " << totalSinEspacios << endl;
    cout << "Total de lexemas: " << totalLexemas << endl;
    cout << "Total de palabras: " << totalPalabras << endl;
    cout << "Total de números: " << totalNumeros << endl;
    cout << "Total de combinadas: " << totalCombinadas << endl;

    return 0;
}

