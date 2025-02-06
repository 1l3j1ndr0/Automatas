#include <iostream>
#include <cctype>
using namespace std;

string revisar(string s) {
	bool tieneNumero = false, tieneLetras = false;

	for (int i = 0; i < s.length(); i++) {  
		char c = s[i];
		if (isdigit(c)) {
			tieneNumero = true;
		} else if (isalpha(c)) {
			tieneLetras = true;
		} else {
			return "Contiene caracteres especiales";
		}
	}

	if (tieneNumero && tieneLetras) {
		return "Compuesta";
	}
	if (tieneNumero) {
		return "Numero entero";
	}
	if (tieneLetras) {
		return "Palabra";
	}
	return "Cadena vacía o no reconocida";
}

int main() {
	string cadena;
	int res=0;
	while(res!=2) {
		cout << "Ingresa una palabra o elemento: ";
		cin >> cadena;
		cout << "La cadena ingresada es: " << revisar(cadena) << endl<<endl;
		cadena = "";

		do {
			cout <<endl<<endl<<"Quiere ingresar otra palabra? \n1)Si\n2)No" << endl;
			cout <<endl<<"Respuesta: ";
			cin>>res;
		} while(res<1||res>2);
	}
}
