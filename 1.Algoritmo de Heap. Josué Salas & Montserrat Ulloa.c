/*Universidad autonoma de aguascalientes
  Ingeniería en computacion Inteligente
  Estructuras computacionales avanzadas
  Josue Alejandro Salas Rodriguez
  Motserrat Alejandra Ulloa Rivera
  Profesor de la materia: Dr. en C. Luis Fernando Gutiérrez Marfileño
  El programa realiza las permutaciones de N numero de elementos a peticion del usuario
  */
#include<stdio.h>
#include<stdlib.h>
int num_ele;
int flag;
void permutaciones(int num_ele, int vec_con[]);
int inter(int *pri_ind, int *seg_ind);
int contaaaa=1, i;
int main(){
    printf("Este programa genera las permutaciones de un conjunto n elementos\n");
    printf("Donde n puede ser un valor maximo de 10\n");
    printf("Dame el numero de elementos que quieras permutar: ");
    scanf("%d",&num_ele);
    flag=num_ele;
    //Validar num_ele 1 a 10
    int vec_con[num_ele];
    if(num_ele>0 && num_ele<11){
        for(i=0;i<num_ele;i++){
            printf("Digite el elemento %d: ",i+1);
            scanf("%d",&vec_con[i]);               
        }
        
        permutaciones(num_ele,vec_con);
    }
    else{
        printf("El valor de n esta fuera de rango\n");
    }
    

    system("PAUSE");
    return 0;    
        
}
int inter(int *pri_ind, int *sig_ind){
    int aux;
    aux=*pri_ind;
    *pri_ind=*sig_ind;
    *sig_ind=aux;
}

void permutaciones(int num_ele, int vec_con[]){
    int cont_perm;
    if(num_ele==1){
        printf("Permutacion No. %d\n",contaaaa);
        contaaaa++;
        for(i=0; i<flag;i++){
        printf("%d ",vec_con[i]);
        }printf("\n");
        
    }
    else{
        
        for(cont_perm=0;cont_perm<num_ele-1;cont_perm++){
            
            permutaciones(num_ele-1,vec_con);
            
            if((num_ele%2)==0){
                inter(&vec_con[cont_perm],&vec_con[num_ele-1]);
            }
            else{
                inter(&vec_con[0],&vec_con[num_ele-1]);
            }
        }
        
        
        
        permutaciones(num_ele-1,vec_con);
        
    }
    

}
