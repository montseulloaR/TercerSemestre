/*Universidad autonoma de aguascalientes
  Ingeniería en computacion Inteligente
  Estructuras computacionales avanzadas
  Josue Alejandro Salas Rodriguez
  Motserrat Alejandra Ulloa Rivera
  Profesor de la materia: Dr. en C. Luis Fernando Gutiérrez Marfileño
  El programa realiza las combinaciones del conjunto dado a partir de binarios
  */



#include <stdio.h>
#include <stdlib.h>

int binario (int n);
int v[6];
char conjunto[] = {'r','e','z','a','g','o'};
int numero;
int main(){
	int x,z;
	
	puts("Este programa obtiene todos los subconjuntos del conjunto potencia");
	puts("Conjunto potencia del conjunto: A={r,e,z,a,g,o}");
	puts("");
	puts("BINARIO  SUBCONJUNTOS");
	
	for(x=0; x<64;x++){
		numero = -1;
		binario(x);
		for(z=5; z>-1; z--) printf("%d", v[z]);
		printf("   ");
		for(z=5; z>-1; z--){
			if(v[z]==1) printf("%c", conjunto[z]);
		} 
		printf("\n");
	}
	system("pause");
	return 0;
}

int binario (int n){
	numero++;
	if(n!=0){
		binario (n/2);
		numero--;
		v[numero]=n%2;
	}	

}
