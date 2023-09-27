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
media_anual<-apply(variable2,c(1,2,3,4),mean)
media_mens[,,3,]

#Olavarria -36.89,-60,32

media_mens[7,6,1,] #Como lo generalizo????