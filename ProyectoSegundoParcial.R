
library(e1071)

setwd("C:/Users/Montse/Documents/UAA/3° Semestre/Inteligencia Artificial. Luna/VirusSegundoParcial")
datos<-read.table("Virus2.csv",header=TRUE, sep=";" ,dec=',')
dim(datos)
head (datos)
mutados<-read.table("mutados.csv",header=TRUE, sep=";" ,dec=',')

##Generar la tabla de prueba
muestra <- c(90:113)
todos <- c(1:83)
mutado <- c(1:31)

ttodos <-datos[todos,] #Todos los datos que no se usan para entrenar
ttodos
tmutados <-mutados[mutado,] #Datos de los mutados
tmutados
ttesting <- datos[muestra,] #Datos de la muestra para revisar
ttesting
#taprendizaje <- datos[-todos,] #Datos para entrenar
#taprendizaje

##train.naiveBayes
modelo <- naiveBayes(Receptor~.,data=ttodos) ##Implementa el naiveBayes que ya está cargado en la librería
modelo

prueba <-predict(modelo,ttesting[,-6]) #Prediccion con los datos para revisar
prueba
  
matrizP <- table(ttesting[,6],prueba) #Revision
matrizP

#ttesting[,6] <- prediccion
#ttesting

prediccion <-predict(modelo, tmutados[,-6]) #Prediccion con los datos mutados
prediccion

matrizX <- table(tmutados[,1],prediccion) #Revision
matrizX

