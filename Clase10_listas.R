##################
##################################################################
# # Laboratorio de Procesamiento de Informacion Meteorologica/Oceanografica
#
# 2� cuatrimestre 2023

##################################################################

##### Clase LISTAS----

#####################
pp=rnorm(120,mean=20, sd=7)
hist(pp)
result=hist(pp) #guardo la variable
result #Los resultados de las funciones se guardan como listas
is.list(result)


hist(pp,freq=TRUE)
hist(pp,freq=FALSE)

result=hist(pp)
###################################
familia <- list("Maria", "Juan", 10, c("Hugo", "Paula"), c(8,6))
familia
lista.ABC <- c(lista.A, lista.B, lista.C)

#Forma de nombrar las componentes de la lista
familia <- list(madre="Maria", padre="Juan", casados=10,hijos=c("Hugo", "Paula"), edades=c(8, 6))


length(familia)
length(familia$casados)
length(familia$hijos)

#################################
#Formas de pedir las variables dentro de una componente
familia$madre #Con signo peso
familia[["madre"]] #Con el nombre de la componente
familia[[4]] #Con la posicion de la componente

#Pedir de forma especifica
familia[[4]][1]

#Puedo cambiar las variables dentro de las componentes
familia[["padre"]] <- "Juan Pedro"
familia$padre   		


#Puedo agregar variables
familia[[4]][3]<-"Ana"
familia$edades[3]<-1
familia$cumple<-c("3mar","15oct","31dic","7feb","5feb")

################################

mi.lista <- list(a = 1:3, b = c("hola", "adios"),z=matrix(1:4,2,2))

mi.lista[1:2]

mi.lista[2]#La informacion de la componente
mi.lista[[2]]#Los elementos de esa componente (puedo laburar con estos)

is.list(mi.lista[2])
is.list(mi.lista[[2]])

################Apply pero para listas###################

air<-airquality

lapply(airquality[, 1:4], mean, na.rm = TRUE)

sapply(airquality[, 1:4], mean, na.rm = TRUE) #Lo mismo pero con formato horizontal

################################################

cc<-list(rbinom(10,30,0.5),runif(90,5,40))
cc
lapply(cc,mean)
sapply(cc,mean)

#Ejemplo----
rm(list = ls())

datos<-read.table("datos_lista.txt",header = T) #Lo abre como D.F.
datosl<-as.list(read.table("datos_lista.txt",header = T))

corr_boya_Ersst<-cor.test(datosl$BOYA,datosl$ErSST)
corr_boya_Ersst
corr_boya_Hadstt<-cor.test(datosl$BOYA,datosl$HadSST)
corr_boya_Hadstt

#Quien tiene mayor correlacion?
corr_boya_Ersst$estimate>corr_boya_Hadstt$estimate

#Correlaciones segun el ENSO???
datosl$obs
cor.test(datosl$BOYA[datosl$obs=="EN"],datosl$ErSST[datosl$obs=="EN"])
cor.test(datosl$BOYA[datosl$obs=="EN"],datosl$HadSST[datosl$obs=="EN"])
