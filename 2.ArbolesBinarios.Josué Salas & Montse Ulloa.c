/*Universidad autonoma de aguascalientes
  Ingeniería en computacion Inteligente
  Estructuras computacionales avanzadas
  Josue Alejandro Salas Rodriguez
  Motserrat Alejandra Ulloa Rivera
  Profesor de la materia: Dr. en C. Luis Fernando Gutiérrez Marfileño
  El programa realiza un árbol binario a partir de nodos. Recorridos: inrden, postorden, preorden 
  */
#include <conio.h>
#include <stdlib.h>
#include <stdio.h>

#define TRUE 1
#define FALSE 0

typedef struct _nodo {
   int dato;
   struct _nodo *derecho;
   struct _nodo *izquierdo;
} tipoNodo;

typedef tipoNodo *pNodo;
typedef tipoNodo *Arbol;


//Prototipos
void Insertar(Arbol *a, int dat);
void InOrden(Arbol, void (*func)(int*));
void PreOrden(Arbol, void (*func)(int*));
void PostOrden(Arbol, void (*func)(int*));
void Podar(Arbol *a);
void auxContador(Arbol a, int*);
int Vacio(Arbol r);
void Mostrar(int *d);
 
main()
{
	//setlocale(LC_ALL,"");
	
	Arbol ArbolInt=NULL;
   int altura;
   int nnodos;
   int x;
	
	//Menu ciclado 
	int flag=0, menu=0; 
	
	do
	{
		system("color F0");
		system("CLS");
		printf("\t  \t Arbol binario de busqueda\n");
		printf("\tPrograma que lee los datos de un arbol binario\n");
		printf("\ty despliega los recorridos: PreOrden, InOrden, PostOrden.\n");
		printf("\n\t\t -Menu-\n\n");
		printf("\t1.-  Insertar nodo\n");
		printf("\t2.-  Realizar recorrido por Preorden\n");
		printf("\t3.-  Realizar recorrido por Inorden\n");
		printf("\t4.-  Realizar recorrido por PostOrden\n");
		printf("\t5.- Salir\n");
		printf("\n\tIngresar opcion:  ");
		scanf("%d", &menu);
		
	switch(menu)
	{
		case 1: 
			printf("\n\tDato a insertar: ");
			scanf("%d", &x);
			Insertar(&ArbolInt, x);
			break;
		case 2:
			printf("\n\tPreOrden: ");
   			PreOrden(ArbolInt, Mostrar);
			getchar();
			getchar();
			break;
		case 3:
			printf("\n\tInOrden: ");
   			InOrden(ArbolInt, Mostrar);
   			getchar();
   			getchar();
   			break;
   		case 4:
   			printf("\n\tPostOrden: ");
   			PostOrden(ArbolInt, Mostrar);
   			getchar();
   			getchar();
   			break;
		case 5:
			flag=1;
			break;
		default:
			    printf("\t-Opción inexistente-");
                getchar();
				getchar();
				system("cls");	
	}
	
	}while(flag==0);

	Podar(&ArbolInt);
	getchar();
	return 0;
}

/* Poda: borrar todos los nodos a partir de uno, incluido */
void Podar(Arbol *a)
{
   /* Algoritmo recursivo, recorrido en postorden */
   if(*a) {
      Podar(&(*a)->izquierdo); /* Podar izquierdo */
      Podar(&(*a)->derecho);   /* Podar derecho */
      free(*a);                /* Eliminar nodo */
      *a = NULL;
   }
}

/* Insertar un dato en el árbol ABB */
void Insertar(Arbol *a, int dat)
{
   pNodo padre = NULL;
   pNodo actual = *a;

   /* Buscar el dato en el árbol, manteniendo un puntero al nodo padre */
   while(!Vacio(actual) && dat != actual->dato) {
      padre = actual;
      if(dat < actual->dato) actual = actual->izquierdo;
      else if(dat > actual->dato) actual = actual->derecho;
   }

   /* Si se ha encontrado el elemento, regresar sin insertar */
   if(!Vacio(actual)) return;
   /* Si padre es NULL, entonces el árbol estaba vacío, el nuevo nodo será
      el nodo raiz */
   if(Vacio(padre)) {
      *a = (Arbol)malloc(sizeof(tipoNodo));
      (*a)->dato = dat;
      (*a)->izquierdo = (*a)->derecho = NULL;
   }
   /* Si el dato es menor que el que contiene el nodo padre, lo insertamos
      en la rama izquierda */
   else if(dat < padre->dato) {
      actual = (Arbol)malloc(sizeof(tipoNodo));
      padre->izquierdo = actual;
      actual->dato = dat;
      actual->izquierdo = actual->derecho = NULL;
   }
   /* Si el dato es mayor que el que contiene el nodo padre, lo insertamos
      en la rama derecha */
   else if(dat > padre->dato) {
      actual = (Arbol)malloc(sizeof(tipoNodo));
      padre->derecho = actual;
      actual->dato = dat;
      actual->izquierdo = actual->derecho = NULL;
  }
}


/* Recorrido de árbol en inorden, aplicamos la función func, que tiene
   el prototipo:
   void func(int*);
*/
void InOrden(Arbol a, void (*func)(int*))
{
   if(a->izquierdo) InOrden(a->izquierdo, func);
   func(&(a->dato));
   if(a->derecho) InOrden(a->derecho, func);
}

/* Recorrido de árbol en preorden, aplicamos la función func, que tiene
   el prototipo:
   void func(int*);
*/
void PreOrden(Arbol a, void (*func)(int*))
{
   func(&a->dato);
   if(a->izquierdo) PreOrden(a->izquierdo, func);
   if(a->derecho) PreOrden(a->derecho, func);
}

/* Recorrido de árbol en postorden, aplicamos la función func, que tiene
   el prototipo:
   void func(int*);
*/
void PostOrden(Arbol a, void (*func)(int*))
{
   if(a->izquierdo) PostOrden(a->izquierdo, func);
   if(a->derecho) PostOrden(a->derecho, func);
   func(&a->dato);
}


/* Función auxiliar para contar nodos. Función recursiva de recorrido en
   preorden, el proceso es aumentar el contador */
void auxContador(Arbol nodo, int *c)
{
   (*c)++; /* Otro nodo */
   /* Continuar recorrido */
   if(nodo->izquierdo) auxContador(nodo->izquierdo, c);
   if(nodo->derecho)   auxContador(nodo->derecho, c);
}

/* Comprobar si un árbol es vacío */
int Vacio(Arbol r)
{
   return r==NULL;
}

/* Función de prueba para recorridos del árbol */
void Mostrar(int *d)
{
   printf("%d-> ", *d);
}

