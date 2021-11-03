#include <stdlib.h>
#include <stdio.h>
/*Universidad autonoma de aguascalientes
  Ingeniería en computacion Inteligente
  Estructuras computacionales avanzadas
  Josue Alejandro Salas Rodriguez
  Motserrat Alejandra Ulloa Rivera
  Profesor de la materia: Dr. en C. Luis Fernando Gutiérrez Marfileño
  El programa calcula las componentes conexas de un grafo
  */

int mat_graf[6][6];
void warshall(int mat_graf[6][6]);
void menu();
void imp_mat(int mat_graf[6][6]);

int main(){
	puts("Este programa calcula las componentes conexas");
	puts("del grafo mostrado en la siguiente matriz de adyacencias");
	mat_graf[0][1]=1;
	mat_graf[1][2]=1;
	mat_graf[2][0]=1;
	mat_graf[2][5]=1;
	mat_graf[3][1]=1;
	mat_graf[3][4]=1;
	mat_graf[4][2]=1;
	mat_graf[5][1]=1;
	imp_mat(mat_graf);
	warshall(mat_graf);
	system("pause");
	return 0;
}

void imp_mat(int mat_graf[6][6]){
	int filas;
	int columnas;
	puts("");
	puts("  a b c d e f ");	
	for (filas=0; filas<6; filas++){
			switch(filas){
				case 0:
				printf("a ");
				break;
				case 1:
				printf("b ");
				break;
				case 2:
				printf("c ");
				break;
				case 3: 
				printf("d ");
				break;
				case 4:
				printf("e ");
				break;
				case 5: 
				printf("f "); 
				break;
			}
		for(columnas=0; columnas<6; columnas++){
			printf("%d ",mat_graf[filas][columnas]);
		}
		puts(" ");
	}
}

void warshall(int mat_graf[6][6]){
	puts("");
	puts("MATRICES BOOLEANAS");
	int n_mat_b;
	int filas;
	int columnas;
	for (n_mat_b=0; n_mat_b<6; n_mat_b++){
		for(filas=0; filas<6; filas++){
			for(columnas=0; columnas<6; columnas++){
				if(mat_graf[filas][columnas]==1||mat_graf[filas][n_mat_b]==1&&mat_graf[n_mat_b][columnas]==1){
					mat_graf[filas][columnas]=1;
				}
				else {
					mat_graf[filas][columnas]=0;
				}
			}
		}
		printf("Matriz %d", n_mat_b+1);
		imp_mat(mat_graf);
	}
}
