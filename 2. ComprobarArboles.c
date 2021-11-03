/*Universidad autonoma de aguascalientes
  Ingeniería en computacion Inteligente
  Estructuras computacionales avanzadas
  Josue Alejandro Salas Rodriguez
  Motserrat Alejandra Ulloa Rivera
  Profesor de la materia: Dr. en C. Luis Fernando Gutiérrez Marfileño
  El programa realiza comprueba si un grafo ingresado por el usuario es un árbol o no lo es
*/
  
#include<stdlib.h>
#include<stdio.h>
#include<stdbool.h>// Booleanos

int main(){
	int num=11, it, it2, op, correcta=0;
	bool arbol, salir;
	int grafo[10][10];
	
	puts("El programa evalua si el grafo ingresado es un arbol o no");
	
	while(!salir){
		op=0;
		puts("1. Ingresar Matriz");
		puts("2. Evaluar si es arbol");
		puts("3. Salir");
		scanf("%d", &op);
		
		switch(op){
			case 1:{
				while(1>num||num>10){
				puts("Numero de nodos del grafo a evaluar [Maximo 10]: ");
				scanf("%d", &num);	
				if (1>num||num>10){ puts("Numero no valido");}	
				}
				
				
				puts("Presencia de arcos entre nodos");
				puts("1 -> Si");
				puts("0 -> No");
	
				for(it=0; it<num; it++){
					for(it2=0; it2<num; it2++){
						printf("Adyacencia entre %d - %d: ", it+1, it2+1);
						scanf("%d", &grafo[it][it2]);
					}
				}
					
				puts("La matriz de adyacencia ingresada");
				for(it=0; it<num; it++){
					for(it2=0; it2<num; it2++){
						printf(" %d ", grafo[it][it2]);
					}
					puts("");
				}
				system("pause");
				break;
			}
			
			case 2:{
				//Al menos un uno
				for(it=0; it<num; it++){
					for(it2=0; it2<num; it2++){
						if(grafo[it][it2]==1) {arbol = true;}	
					}
				}
				
				//Diagonal principal hacia abajo
				for(it=0; it<num; it++){
					for(it2=0; it2<=it; it2++){
						if(grafo[it][it2]==1) {arbol = false;}
					}
				}
				
				//Raiz
				if(num==1&&grafo[0][0]==0){ arbol = true;} 
				
				if(arbol){puts("El grafo es un arbol");}
				else if(!arbol){puts("El grafo NO es un arbol");}
				system("pause");
				break;
			}
			
			case 3:{
				salir = true;
				break;
			}
			
			default: {
				puts("Opcion incorrecta");
				break;
			}
			
		}
	}
	
	
}
