#install.package("class")
#Seleccionamos el .csv
data <-read.csv(file.choose())
#Ordenas los datos
str(data)
#Ves los datos
View(data)
#Creas una tabla seleccionando como se van a clasificar en este caso tipo
table(data$tipo)
#Genera la seed para el random
set.seed(9850)
#Creas el random y se multiplica por tu data
gp<-runif(nrow(data))
#Ordenas la nueva data
data<-data[order(gp),]
#Observas
str(data)
#primeros 10 observas
head(data,10)
#observas
str(data)
#Creas un resumen de tus 50 EE quitando la ultima columna que es la del tipo de clasificacion
summary(data[,c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50)])
#Creas la funcion normalize
normalize<- function(x){+return((x-min(x))/(max(x)-min(x)))}
#lo aplicas en los 1-5 como un cap
normalize(c(1,2,3,4,5))
#Aplicas la formula normalize a nuestra data
data_n<-as.data.frame(lapply(data[,c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50)],normalize))
#Observas nueva data
str(data_n)
#Resumen nueva data
summary(data_n)
#train
#Aqui separamos nuestra data en train tomamos del 1 al 80
trainData <- data_n[1:80,]
#Esta sera la que usaremos para testear nuestro algoritmo ya entrenado del 81 al 115
testData <- data_n[81:115,]
#Aqui seleccionamos los target de las datas que en este caso seria la columna 51=tipo/tipo de clasificacion
trainData_target<-data[1:80,51]
testData_target<-data[81:115,51]
#Requerimos la clase para iniciar el algoritmo knn
require(class)
#Raiz cuadrada del numero de datos totales en este caso 115, el resultado sera el numero de vecinos
sqrt(115)
#Entrenamos
m1<-knn(train=trainData, test=testData,cl= trainData_target, k=11)
#Mostramos el algoritmo entrenado
m1
#testeamos nuestro algoritmo vs nuestro apartado para test
table(testData_target,m1)

