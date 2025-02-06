#include <iostream>
#include <cctype>

using namespace std;

void revisar(string s) {
	int contNum = 0 , contLet = 0, contCom = 0;
	bool tieneNumero = false, tieneLetras = false;

	for (int i = 0; i < s.length(); i++) {  // Uso de ?ndices en lugar de range-based for
		char c = s[i];
		
		
		if (isdigit(c)) {
			tieneNumero = true;
		} else if (isalpha(c)) {
			tieneLetras = true;
		}
		
		if(isspace(c)){
			if (tieneNumero && tieneLetras) {
				contCom +=1;
			}
			if (tieneNumero) {
				contNum +=1;
			}
			if (tieneLetras) {
				contLet+=1;
			}
			tieneLetras = false;
		    tieneNumero = false;
		}
		
		
		
	}
	
	if(contCom>0){
		cout<<"Compuestas: "<<contCom+1<<endl;
	}
	if(contLet>0){
		cout<<"Palabras: "<<contLet+1<<endl;
	}
	if(contNum>0){
		cout<<"Entero: "<<contNum+1<<endl;
	}
	
}

int main() {
	string texto;
	int res=0;
	
	while(res!=2) {
		cout << "Ingresa palabras separadas por espacios : ";
		getline(cin, texto);
		
		revisar(texto);

		do {
			cout <<endl<<endl<<"Quiere ingresar otras palabra? \n1)Si\n2)No" << endl;
			cout <<endl<<"Respuesta: ";
			cin>>res;
			cin.ignore();
			texto ="";
		} while(res<1||res>2);
	}
}
