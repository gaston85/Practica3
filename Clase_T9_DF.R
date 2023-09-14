##################
##################################################################
# # Laboratorio de Procesamiento de Informaci�n Meteorol�gica/Oceanogr�fica
#
# 2� cuatrimestre 2023
##################################################################

###########  CLASE data.frame ALUMNOS

################Ejemplo Iris#####################

iris
print(iris)
plot(iris) 		
summary(iris)
str(iris) 			
head(iris) 	
tail(iris) 			
########################################

m <- cbind(ord=1:3, edad=c(30L, 26L, 9L)) #Creo una matriz, mientras nombro los vectores
v <- c(1.80, 1.72, 1.05) 

ff <- data.frame(familia=c("Padre", "Madre", "Hijo"),m, estatura=v)
ff <- data.frame(familia=c("Padre", "Madre", "Hijo"),m, estatura=v,row.names=1) #Lo que tenes en el primer elemento pasa 
#a ser los nombres de las filas

#############################
WORKDIR <- "/home/clinux01/Documentos/GastonLabo/Practica_3"

setwd (WORKDIR)

mitabla <- read.table("Leer_tabla.txt") #El archivo tiene que estar en el lugar donde trabajas
is.data.frame(mitabla)
colnames(mitabla)
rownames(mitabla)

#Como acceder a las variables, los datas frames tienen como PRIORIDAD las columnas
mitabla$Piso

mitabla[[2]]

mitabla[2] #Me muestra toda la informacion de la columna, no me sirve para trabajar con los valores

mitabla[3, 2] #Acceso a un elemento individual como si fuera matriz       

mitabla[3, 2] <- 106    
#Puedo operar con los valores y agregar nuevas columnas
mitabla$Total <- mitabla$Precio * mitabla$Area

###########################

datosimp <- data.frame(anyos=c(1.3,0.4,1.1,2.3,3.1,1.3),
                       tipo=c(2,3,3,1,3,1),edad=c(22,21,34,42,17,43),
                       sexo=c("H","M","H","H","M","H"))

attach(datosimp)

detach(datosimp)


#Puedo seleccionar por las caracteristicas mediante subset
datos.hombre.filtrados <- datosimp$anyos[datosimp$sexo=='H']
mas.peq <- subset(datosimp,anyos<2,select=c(edad,sexo))

attach(datosimp)
edad.final <- edad + anyos #no afecta al data.frame
datosimp <- transform(datosimp, edad.final = edad+anyos)#Si lo afecta al DF 
datosimp <- transform(datosimp, edad = edad+1) 



############################################


#ejercicio solos leer consigna
rm(list = ls())
aq<-airquality
T_media<-mean(aq$Temp,na.rm = T)
T_med_Mayo<-mean(aq$Temp[aq$Month==5])
dia_mas_ventoso<-aq$Day[max(aq$Wind)]
mes_mas_ventoso<-aq$Month[max(aq$Wind)]
valor_vel_max<-max(aq$Wind)
aq[]==valor_vel_max
a<-subset(aq,Wind==valor_vel_max,select=c(Month,Day))
which(aq[,"Wind"]==valor_vel_max)

orden.viento<-aq[order(aq$Wind,decreasing=F),]#la coma al final ordena todo el DF

mayo<-subset(aq,Month==5,select=c(4,2))
############ nuevo 2023 ###################

library(reshape)

head(airquality)

original<-airquality

formato_long<-melt(airquality,id=c("Month","Day"))

formato_long_2<-melt(airquality,id=c("Month"))

formato_long_3<-melt(airquality,id=c("Ozone"))

