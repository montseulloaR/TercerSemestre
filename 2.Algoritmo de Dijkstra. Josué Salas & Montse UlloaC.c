#include<stdio.h>
#include<stdlib.h>
int matriz [8][8];
 int v[8];

void dykstra();
void imp_mat();
int visitado(int j);
void el_camino(int p);
void deletev();

int main(){//a0 b1 c2 d3 e4 f5 g6 h7
	int f,c,l;
	
	    //a
		matriz[0][1]=3;
		matriz[0][2]=1;
		//b
		matriz[1][0]=3;
		matriz[1][3]=1;
		matriz[1][6]=5;	
		//c
		matriz[2][0]=1;
		matriz[2][3]=2;
		matriz[2][5]=5;
		//d
		matriz[3][2]=2;
		matriz[3][1]=1;
		matriz[3][4]=4;
		matriz[3][5]=2;
		//e5
		matriz[4][3]=4;
		matriz[4][6]=2;
		matriz[4][7]=1;
		//f5
		matriz[5][2]=5;
		matriz[5][3]=2;
		matriz[5][7]=3;
		//g6
		matriz[6][1]=5;
		matriz[6][4]=2;
		//h7
		matriz[7][4]=1;
		matriz[7][5]=3;
		printf("\n\t Matriz Original\n");
		
	imp_mat();	
	printf("\n\n");
	for(l=0;l<4;l++){
		printf("\n %d.-iteracion de Dijkstra\n",l+1);	
    	dykstra();
		deletev();	
	}
}


void dykstra(){
	int y=0,w=0,q=0;
	int vc[8][2];
	int x=0,num=7,c=1,n=0;
	int r=0;
	int u=0;
	int vis;
	int p=0;
	c=1;
	
	do{
		num=7;
		v[0]=0;//Nodo donde inciara la busqueda en este caso sera A que es igual a 0
		for (x=0;x<8;x++){
			vis = visitado(x);
			if(matriz[y][x]!=0 &&num!=matriz[y][x] &&num>matriz[y][x] && visitado(x)!=1 ){
				num = matriz[y][x];
				vc[r][0] = y;
				vc[r][1] = x; 
				w=x;
				q=y;
				printf("\n\nITERACION %d", x);
				printf("\n[y:%d]  [x:%d]", y, x);
				printf("\nmatriz[y][x]: %d  ||  num:%d  ||  vis:%d  ||  num>matriz[y][x]:%d", matriz[y][x], num, visitado(x)!=1, num>matriz[y][x]);
			}
		} 
		printf("\nNUM %d", num);
		r++;
		v[c]=w;
		c++;
		y=w;
//rintf("%d",w);
		u++;
		if(w==7) {
			u=64;	
		}
	}while(u<64);

	x=0;

	if(c>10) {
		while(vc[x][0]<10&&vc[x][0]>0){
			q=vc[x-1][0];
			w=vc[x-1][1];
		}
		 
		imp_mat();
		printf("\n\n\tBucle Infinito encontrado en [%d][%d]\n",q,w);
		matriz[q][w]=0;
		deletev();
		return;
	}	 

	imp_mat();
	printf("\n\nCamino desde A -> H \n\n\t");
	for(x=0;x<c;x++){
		el_camino(v[x]);
	}
	
	printf("\n");printf("\n");
	for(x=1;x<w-1;x++){
		matriz[vc[x][0]][vc[x][1]]=0;
		matriz[vc[x][1]][vc[x][0]]=0;
	}


}

void imp_mat(){
	int f,c;
	printf("\n    A  B  C  D  E  F  G  H ");
			for (f=0;f<8;f++){
				printf("\n");
				el_camino(f);if(f==7) printf("->");
				for(c=0;c<8;c++){
					printf("[%d]",matriz[f][c]);
				}	
			}	
	}

int visitado(int j){
	int g;
	for(g=0;g<8;g++){
		if(j==v[g]) {
			return 1;	
		}
	} 
}

void deletev(){
	int g;
	for(g=0;g<8;g++) {
		v[g]=0;	
	}	
}

void el_camino(int p){
	
	switch(p){
		case 0:{
			printf("A->");
			break;
		}
		case 1:{
			printf("B->");
			break;
		}
		case 2:{
			printf("C->");
			break;
			}	
		case 3:{
			printf("D->");
			break;
		}
		case 4:{
			printf("E->");
			break;
		}
		case 5:{
			printf("F->");
			break;
		}
		case 6:{
			printf("G->");
			break;
		}
		case 7:{
			printf("H");
			break;
		}
	}
}

  

