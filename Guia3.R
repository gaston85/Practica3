#Ejercicio 1----
rm(list = ls())
#a
x<-c()
for (i in 1:1000) {
  x[i]<-i
}
x<-seq(1,1000,1)

#b
a<-array(1:600,dim = c(30,20))
for (x in 1:30) {
  for (y in 1:20) {
    a[x,y]<-x*y
  }
}

#c
rm(list = ls())
a<-matrix(1:30,30,1)
b<-matrix(1:20,1,20)
c<-matrix(,30,20)
for (x in a) {
  for (y in b) {
    c[x,y]<-x*y
  }
}

#d
B<-c[,5]

#e
rm(list = ls())
c<-array(,dim = c(30,20,10))
for (x in 1:nrow(c)) {
  for (y in 1:ncol(c)) {
    for (z in 1:10) {
      c[x,y,z]<-x*y*z
    }
  }
}

D<-c[,,4]
#Ejercicio 2----
#a
a<-c(4, -10, 7, -2, 8, -6, 1, -15, 3, -9) 
i <- 3
j <- 5
b <- c ( 1 , 5 , 7 )
c <- c(TRUE, TRUE, FALSE, TRUE, FALSE, FALSE, TRUE, FALSE, FALSE, FALSE)

#i) 
a[] #Devuelve todos los valores de a
#ii) 
a[i, j] #Da error debido a que pide valores en una mayor dimension que la que tiene a
#iii) 
a[seq(i, i, 2)] #Da el valor/es que esta/n en la posicion generada por la secuencia
#iv) 
a[seq(i, j, 3)] #Da el valor/es que esta/n en la posicion generada por la secuencia
#v) 
a[i:length(a)] #Da los valores desde la posicion 3 hasta la ultima
#vi) 
a[c(1, 5, 7)] #Devuelve los valores en las posiciones en el vector
#vii) 
a[b] #Lo mismo que antes pero el vector esta asignado a una variable
#viii) 
a[c] #Da los valores en las posiciones que tengan True en el vector "c"
#ix) 
a[a == -4] #Da el/los valores que cumplen la condicion (Ninguno)

#Ejercicio 3----
rm(list = ls())

#Genero los datos para las matrices
fila_a<-as.numeric(readline("Cuantas filas quiere en la matriz a: "))
col_a<-as.numeric(readline("Cuantas columnas quiere en la matriz a: "))
datos_a<-c()
for (i in 1:(fila_a*col_a)) {
  datos_a[i]<-as.numeric(readline(paste("Ingrese el valor",i,"de la matriz a: ")))
}

fila_b<-as.numeric(readline("Cuantas filas quiere en la matriz b: "))
col_b<-as.numeric(readline("Cuantas columnas quiere en la matriz b: "))
datos_b<-c()
for (i in 1:(fila_b*col_b)) {
  datos_b[i]<-as.numeric(readline(paste("Ingrese el valor",i,"de la matriz b: ")))
}

#Genero las matrices
if(col_a!=fila_b){
  print("No se puede realizar el producto matricial")
}else{
  a<-matrix(datos_a,fila_a,col_a)
  b<-matrix(datos_b,fila_b,col_b)
  c<-matrix(,fila_a,col_b)
  for (x in 1:fila_a) {
    for (y in 1:col_b) {
      c[x,y]<-sum(a[x,]*b[,y])
    }
  }
}

#b
if(col_a!=fila_b){
  print("No se puede realizar el producto matricial")
}else{
  a<-matrix(datos_a,fila_a,col_a)
  b<-matrix(datos_b,fila_b,col_b)
  c<-matrix(,fila_a,col_b)
  for (x in 1:fila_a) {
    for (y in 1:col_b) {
      c[x,y]<-(a[x,y]*b[x,y])
    }
  }
}
#Ejercicio 4----
rm(list = ls())
datos<-c(3,31,7,1)
datos_b<-c(2,9)
a<-matrix(datos,2,2)
b<-matrix(datos_b)

#Generar la determinante
det_a<-a[1,1]*a[2,2]-a[1,2]*a[2,1]

adj_a<-matrix(c(a[2,2],-a[2,1],-a[1,2],a[1,1]),2,2)

inv_a<-adj_a/det_a
if(ncol(a)!=nrow(b)){
  print("Las dimensiones no coinciden")
}else{
  x<-inv_a%*%b 
}
x
solve(a,b)
#Ejercicio 5----
rm(list = ls())
serie<-c()
horario<-0
for (i in 1:8) {
  serie[i]<-as.numeric(readline(paste("Ingrese el valor de temperatura de la hora",horario,": ")))
  horario<-horario + 3
}
cat("El maximo de la serie es de",max(serie),"grados en la hora",which(serie[]==max(serie))*3-3)

#d
sum(serie[serie[]>20])

#Ejercicio 6----

load("temp_bsas.RData")

variable2<-array(variable,dim = c(8,14,4,12,5))
media_mens<-apply(variable2, c(1,2,3,5),mean)

#b##
media_anual<-apply(variable2,c(1,2,3,4),mean)

#c##
media_mens[,,3,]

#d##
#Olavarria -36.89,-60,32
lat_Ola<- -36.89
long_Ola<- -60.32
media_mens[7,6,1,] #Como lo generalizo????

media_mens[which.min(abs(datos_dimensiones$latitude-lat_Ola)),
           which.min(abs(datos_dimensiones$longitude-360-long_Ola)),1,]
#Ejercicio 7----

TEMP<-scan("datos_tmedia_SABE_2010.txt")

dias_sup_40<-which(TEMP>40)
valores_dia_despues<-TEMP[which(TEMP>40)+1]
valores_dia_anterior<-TEMP[which(TEMP>40)-1]
dias_erroneos<-sum(TEMP>40)

######### b # # #

max(TEMP);min(TEMP)

TEMP[TEMP==-999 |TEMP>40]<-NA
max(TEMP,na.rm = T);min(TEMP,na.rm = T)

#### c ###
datosTEMP_ordenados<-sort(TEMP)
median(datosTEMP_ordenados)

#### d ###
TEMP_semanal<-c()
j<-1
for (i in seq(1,358,by=7)) {
  TEMP_semanal[j]<-mean(TEMP[i:(i+7)],na.rm = T)
  j<-j+1
}

#### e ###
intervalos<-round(5*log10(max(TEMP,na.rm = T)-min(TEMP,na.rm = T)))

anchos<-seq(min(TEMP,na.rm = T),max(TEMP,na.rm = T),by=(max(TEMP,na.rm = T)-min(TEMP,na.rm = T))/7)
datosTEMP_ordenados
for (i in 1:7){
  cat("Dentro del intervalo",i,"hay",length(datosTEMP_ordenados[datosTEMP_ordenados>anchos[i] & datosTEMP_ordenados<anchos[i+1]]),"valores \n")
}


#Ejercicio 8----

rm(list = ls())

info<-function(serie){
  serie<-scan(serie)
  serie[serie==-999 |serie >40]<-NA
  media<-mean(serie, na.rm = T)
  maximo<-max(serie,na.rm = T)
  minimo<-min(serie,na.rm = T)
  desvio<-sd(serie,na.rm = T)
  
  return(data.frame("Media"=media,"Maximo"=maximo,"Minimo"=minimo,"Desvio"=desvio))
}
info("datos_tmedia_SABE_2010.txt")

###b
histograma<-function(serie,intervalo){
  serie<-scan(serie)
  serie[serie==-999 |serie >40]<-NA
  ancho<-seq(min(serie,na.rm = T),max(serie,na.rm = T),by=(max(serie,na.rm = T)-min(serie,na.rm = T))/intervalo)
  serie_ordenada<-sort(serie)
  info<-c()
  for (i in 1:intervalo) {
    info[i]<-serie_ordenada[serie_ordenada>ancho[i] & serie_ordenada<ancho[i+1]]   
  }
  histo<-matrix(info,ncol = intervalo)
  return(plot(histo))
}

histograma("datos_tmedia_SABE_2010.txt",2)


#Ejercicio 9----
rm(list = ls())

load("t_media_EF.RData")
nombres<-c()
maximo<-c()
anio<-c()
for (i in 1:5) {
  nombres[i]<-estaciones[i,1]$aux
  anomalia<-max(estaciones[i,2]$aux)
  maximo[i]<-round(max(estaciones[i,2]$aux),digits = 2)
  anio[i]<-1980+which(estaciones[i,2]$aux==anomalia)
}
anomalia_T<-data.frame("Estacion"=nombres,"Anio"=anio,"Temperatura"=maximo)

####b

media<-c()
desvio<-c()
for (i in 1:5) {
  media[i]<-mean(estaciones[i,3]$aux,na.rm = T)
  desvio[i]<-sd(estaciones[i,3]$aux,na.rm = T)
  for (j in estaciones[i,3]$aux) {
    if(j>(media[i]+desvio[i])){
      print(paste("La estacion",estaciones[i,1],
                  "estuvo por encima de la media en el año",
                  1980 + which(estaciones[i,3]$aux==j)),quote = F)
    } 
  }
}


####c

rango_mediana<-function(serie){
  rango<-max(serie,na.rm = T)-min(serie,na.rm = T)
  mediana<-median(serie,na.rm = T)
  rango_y_median<-c(rango,mediana)
  return(rango_y_median)
}


nombres<-c()
rango<-c()
mediana<-c()
for (i in 1:5) {
  nombres[i]<-estaciones[i,1]$aux
  rango[i]<-rango_mediana(estaciones[i,2]$aux)[1]
  mediana[i]<-rango_mediana(estaciones[i,2]$aux)[2]
}

rango_median_enero<-matrix(c(rango,mediana),nrow = 2,byrow = T,
                           dimnames = list(c("Rango","Mediana"),nombres))
#Ejercicio 10----
rm(list = ls())

nombres<-c("Gaston","Rocio","Caterina","Felipe","Evelyn","Romina",
           "Camila","Candelaria","Emanuel","Ezequiel")

lista_nombres<-function(letra){
  nombres<-c("Gaston","Rocio","Caterina","Felipe","Evelyn","Romina",
             "Camila","Candelaria","Emanuel","Ezequiel")
  nombres[toupper(substr(nombres,1,1))==toupper("letra")]
}

nombres2<-list("Gaston","Rocio","Caterina","Felipe","Evelyn","Romina",
               "Camila","Candelaria","Emanuel","Ezequiel")
lista_nombres2<-function(lista,letra){
  nombres_con_letra<-c() 
  for (i in 1:length(lista)) {
    if(toupper(substr(lista[[i]][1],1,1))==toupper(letra)){
      nombres_con_letra[[j]]<-lista[[i]][1] 
      #Al usar doble corchete en un vector vacio, se genera una lista. GOD,no??
      j<-j+1
    }
  }
  if(length(nombres_con_letra)==0){
    nombres_con_letra<-paste("No hay nombres que comiencen con la letra",letra)
  }
  return(nombres_con_letra)
}

lista_nombres2(nombres2,"c")
#Ejercicio 11 es el ejercicio a entregar. (Paja)
#Ejercicio 12----
rm(list = ls())

datos<-read.table("presiondesaturacion.txt",col.names = c("Temperatura","Presion_Saturacion"))

presion_sat<-function(archivo,temperatura){
  if(temperatura<min(archivo[[1]]) |temperatura>max(archivo[[1]])) stop("La temperatura ingreasada no esta dentro del rango del archivo")
  if(sum(datos[[1]]==temperatura)==0) warning("La temperatura ingresada no esta dentro del archivo, se usara el mas cercano")
  P_sat<-archivo[[2]][which.min(abs(temperatura-archivo[[1]]))] 
  return(paste(P_sat,"hPa"))
}

presion_sat()