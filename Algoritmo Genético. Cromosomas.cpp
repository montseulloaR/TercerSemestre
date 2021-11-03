/* Algoritmo Genetico */
#include<stdlib.h>
#include<windows.h>
#include<locale.h>
#include <time.h>

int Eva[51];// Evaluacion de cada cromosoma
int contadorGenes=1;
bool matriz = true, done = false; //Si es true, va a Temp1 

void cruzamiento(int M1[51][20], int M2[51][20], int s);
int suma(int M1[51][20], int M2[51][20]);
int ruleta(int s);
int* mutar(int a[20]);
void pasar(int* V, int M2[51][20]);
void imprimir(int M1[51][20]);

int main(){
	srand(time(0));
	int Original[51][20], Temp1[51][20], Temp2[51][20];
	int s=0, al; //Suma de calificaciones de la poblacion
	
	
	//Asignacion de numero aleatorio entre 0 y 1 a la matriz original
	for(int i=0;i<51;i++)	{
		for(int j=0;j<20;j++){
			al=rand()%2;
			Original[i][j]=al; 
		}
	}
	
	imprimir(Original);
	
	s = suma(Original, Temp1);
	for(int i = 0; i<25; i++)cruzamiento(Original, Temp1, s);

	int cuenta = 1;
	while (done==false){
		contadorGenes=1;
		printf("\n\GENERACION: %d", cuenta);
		if(matriz == true){
			s = suma(Temp1, Temp2);
			for(int x = 0; x<25; x++){cruzamiento(Temp1, Temp2, s);}
			//imprimir(Temp2);
			matriz = false;	
		}
		
		else{
			s = suma(Temp2, Temp1);
			for(int y = 0; y<25; y++)cruzamiento(Temp2, Temp1, s);
			//imprimir(Temp1);
			matriz = true;
		}
		
		cuenta++;
	}
	
	if (matriz == true) imprimir(Temp1);
	else { imprimir(Temp2);}
	
	return 0;
	system("pause");
}

void cruzamiento(int M1[51][20], int M2[51][20], int s){
	int A[20], B[20];
	int p1=0, p2=0, Pcruce=0, probC=0, prob=0;
	//	printf("\n\nPASO 1: Seleccion por ruleta");
	p1 = ruleta(s);
	p2 = ruleta(s);
	//	printf("\n\nPASO 2: Cruzamiento");
	
	Pcruce = rand()%(20);
	probC = rand()%(11-1);
	prob = rand()%(11-1);
	
		/*printf("\n\tCromosoma de cruce = %d", Pcruce);
		printf("\n\tProbabilidad de cruce > probabilidad [%d > %d] = ", probC, prob);*/
	
	if(prob < probC){
		//printf("true");
		for(int i=0; i<Pcruce; i++){
			A[i]=M1[p1][i];
			B[i]=M1[p2][i];
		}
		
		for(int i=Pcruce; i<20; i++){
			A[i]=M1[p2][i];
			B[i]=M1[p1][i];
		}
	}
	
	else {
		//printf("false");
		for(int i=0; i<20; i++){
			A[i]=M1[p1][i];
			B[i]=M1[p2][i];
		}	
	}
	
	
	/*printf("\n\tHijo 1:\t");
	for(int j=0;j<20;j++){
			printf("[%d]", A[j]);
	}
	
	printf("\n\tHijo 2:\t");
	for(int j=0;j<20;j++){
			printf("[%d]", B[j]);
	}
	
	printf("\n\nPASO 3: Mutacion");*/
	pasar(mutar(A), M2);
	pasar(mutar(B), M2);	
}

int suma(int M1[51][20], int M2[51][20]){
	int s=0, may=0;
	//printf("\n");
	
	for(int i=0; i<51; i++) Eva[i]=0; //Reinciar el vector de las calificaciones
	for(int i=0;i<51;i++){
		for(int j=0;j<20;j++){if(M1[i][j]==1) Eva[i]++;} // Calificaciones
		if (Eva[i]==20) done = true; //YA SE TERMINÓ DE MUTAR
		s+= Eva[i]; //Suma de calificaciones
		if (Eva[may]<Eva[i]) may = i; //Mayor calificacion
	}

	for(int i=0; i<20; i++)M2[0][i] = M1[may][i];
	
	return s;
}

int ruleta(int s){
    int c=0, Ca=Eva[0], i=0;
    float r=0;
    r = 1 + rand()%(11-1);
    r/=10;
    c = r * s;
    
    while (Ca < c){
    	i++;
        Ca = Ca + Eva[i];
    }
    
    /*printf("\n\tPADRE: cromosma #%d ", i+1);
    printf("\n\tProbabilidad de R:  %.1f", r);*/
    
    return i;
}

int* mutar(int a[20]){
	int probM=0;
	
	//printf("\n\tGENES MUTADOS:");
	for(int i=0; i<20; i++){
		probM = rand()%(101-1);
		if(probM>95){
			//printf(" [%d] ", i+1);
			if(a[i]==0) a[i]=1;
			else a[i]=0;
		}
	}
	
	/*for(int j=0;j<20;j++){
			printf("[%d]", a[j]);
	}*/
	
	return a;

}

void pasar(int* V, int M2[51][20]){
	for(int j=0; j<20; j++){
		M2[contadorGenes][j] =  *(V+j);
	}
	contadorGenes++;
}

void imprimir(int M1[51][20]){	
	int may=0, f=0;
	printf("\n");
	for(int i=0; i<51; i++) Eva[i]=0; //Reinciar el vector de las calificaciones
	for(int i=0;i<51;i++){
		printf("Cromosoma %d:\t", i+1);
		for(int j=0;j<20;j++) {
			printf(" %d ", M1[i][j]); 
			if(M1[i][j]==1) Eva[i]++;
		}
		printf("\t: [%d] \n", Eva[i]);
		if (Eva[may]<Eva[i]) may = i;
		f+= Eva[i];
	}

	printf("\nCromosoma con mayor calificacion %d = %d", may+1, Eva[may]);
	printf("\nSuma de calificaciones:  %d", f);
}
