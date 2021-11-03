##install.packages('e1071', dependencies=true)
library(e1071)
setwd("")
datos<-read.csv("iris.cvs", sep = ";", dec = '.', header="T")
dim(datos)

muestra<- sample(1:150, 50)
ttesting <- datos[muestra,]
taperndizaje <- datos[-muestra,]

#train naive.bayes

modelo <- naiveBayes(tipo~., data=taprendizaje)
modelo
prediccion <- predict(modelo, ttesting[,-5])

## Matriz de confusion

MC <- tabla(ttesting[,5], prediccion)
MC

#Porcentaje de buena clasificacion 

acierto<-(sum(diag(MC)))/sum(MC)
acierto

#Error

error <-1-acierto 
error