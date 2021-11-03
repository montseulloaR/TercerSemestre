/*Universidad autonoma de aguascalientes
  Ingeniería en computacion Inteligente
  Estructuras computacionales avanzadas
  Josue Alejandro Salas Rodriguez
  Motserrat Alejandra Ulloa Rivera
  Profesor de la materia: Dr. en C. Luis Fernando Gutiérrez Marfileño
  El programa realiza las permutaciones de N numero de elementos a peticion del usuario por medio del algoritmo
  de Johnson Trotter
  */

#include<stdlib.h>
#include<stdio.h>
#include<conio.h>
int main(){
	int numEle;
	int aux,aux2;
	int i,c,y,op,x,k, out=0;
	int lim;
	
	while (out == 0) {

		system("cls");
	 	printf("1. Comenzar el programa");
	    printf("\n2. Salir ");
	    scanf("%d", &op);

		switch(op){
			case 1:{ 
			    printf("Este programa genera las permutaciones de un conjunto n elementos\n");
			    printf("Donde n puede ser un valor maximo de 10\n");
			    printf("Dame el numero de elementos que quieras permutar: ");
				scanf("%d",&numEle);
				aux2=numEle;
				int vec_perm[numEle];
				for(i=0;i<numEle;i++){
				    printf("Valor %d: ", i+1);
			    	scanf("%d", &vec_perm[i]);
				}
				lim=1;
				
			    for(i=1;i<=numEle;i++){
				lim=lim*i;
				} //factorial
				lim=lim/numEle;
			        for(y=0;y<lim;y++){
					for(x=0; x<numEle; x++){
						c=x+1;
						if(c>numEle-1) c=0;
						aux=vec_perm[x];
					vec_perm[x]=vec_perm[c];
					vec_perm[c]=aux;
					for(k=0;k<numEle;k++) {printf("%d",vec_perm[k]);}
					printf("\n");
					}
				}
			system("pause");
			}
			break;
			case 2: 
				out = 1;
			break;
		}
			
	}
	system("pause");
	return 0;
}
