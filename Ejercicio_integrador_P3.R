rm(list=ls())

#setwd("")
load("./datos.Rdata")

#Miremos que dimensiones tiene el array
dimensiones<-dim(datos_PP)

#Veamos cual es el valor maximo
max(datos_PP,na.rm = T)

#Ploteamos un histograma para ver como es la variable
hist(datos_PP,breaks=500,main="Histograma de frecuencias", xlab="Precipitacion [mm]",ylab="Frecuencia")

#Cuantos valores tengo arriba de un determinado umbral
length(which(datos_PP >= 1))/(prod(dim(datos_PP))) #1 mm
length(which(datos_PP >= 5))/(prod(dim(datos_PP))) #5 mm
length(which(datos_PP >= 10))/(prod(dim(datos_PP))) #10 mm
length(which(datos_PP >= 25))/(prod(dim(datos_PP))) #25 mm
length(which(datos_PP >= 100))/(prod(dim(datos_PP))) #100 mm
length(which(datos_PP >= 250))/(prod(dim(datos_PP))) #250 mm

datos_PP[datos_PP==-99]<-NA
datos_PP

# 2 ##

lista_datos<-function(info){
  media<-mean(info,na.rm =T)
  desv_est<-sd(info,na.rm = T)
  maximo<-max(info,na.rm = T)
  
  return(list(Media=media,Desvio=desv_est,Maximo=maximo))
}
resultado<-lista_datos(datos_PP)

# 3 ##
#a

region_filas<-dimensiones[1]/5
region_col<-dimensiones[2]/5
prod(region_filas,region_col)

#b/#c

medias<-matrix(NA,25,25)
desvios<-matrix(NA,25,25)
maximos<-matrix(NA,25,25)
for (x in seq(1,125,5)) {
  for (y in seq(1,125,5)) {
    tabla<-datos_PP[x:(x+4),y:(y+4),]
    resultado_c<-lista_datos(tabla)
    medias[(x+4)/5,(y+4)/5]<-resultado_c$Media
    desvios[(x+4)/5,(y+4)/5]<-resultado_c$Desvio
    maximos[(x+4)/5,(y+4)/5]<-resultado_c$Maximo
  }
}

lons<-rep(seq(-66,-61-0.2,by=0.2))
lats<-rep(seq(-30-35+0.2),by=-0.2)

DATOS<-data.frame("lons"=lons,"lats"=lats,"medias"=as.vector(medias),"desvios"=as.vector(desvios),"maximos"=as.vector(maximos))
