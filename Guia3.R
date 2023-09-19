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

