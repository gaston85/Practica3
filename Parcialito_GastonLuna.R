#Se evaluara la temperatura de un dia deseado con la temperatura promedio del mes
#y con respecto al resultado se enviara un mensaje.

rm(list = ls())
#Pido el ingreso del dia deseado a a analizar
dia<-readline("Ingrese el dia de Agosto:")
while(nchar(dia)>=3){ #Verifico que el dia ingresado sea un numero
  dia<-readline("Ingreso erroneo del dia, ingreselo otra vez: ")
}
dia<-as.numeric(dia)


#Pregunto por las temperaturas de agosto y genero un promedio#
Temp_Agosto<-c()
for (i in 1:31) {
  Temp_Agosto[i]<-readline(cat("Ingrese la temperatura del dia",i,"de Agosto: "))
  if(nchar(Temp_Agosto[i])>=3|nchar(Temp_Agosto[i])==0){
    Temp_Agosto[i]<-as.numeric(readline("Error en el formato de temperatura, ingrese la tempearatura otra vez: "))
  }
}
Temp_Agosto<-as.numeric(Temp_Agosto)
Prom_Temp<-mean(Temp_Agosto)
if(is.na(Prom_Temp)==T){
  print("Error en los valores ingresados de temperatura,no se puede calcular el promedio")
}


#Evaluo la temperatura del dia deseado con la mensual de agosto y envio un mensaje

if(Temp_Agosto[dia]<Prom_Temp){
  print(paste("El dia",dia,"del mes de Agosto la temperatura fue de",
              paste(Temp_Agosto[dia],"°C",sep = ""),"es decir debajo de la media mensual"),quote = F)
}else if (Temp_Agosto[dia]>Prom_Temp){
  print(paste("El dia",dia,"del mes de Agosto la temperatura fue de",
              paste(Temp_Agosto[dia],"°C",sep = ""),"es decir por encima de la media mensual"),quote = F)
}else{
  print(paste("El dia",dia,"del mes de Agosto la temperatura fue de",
              paste(Temp_Agosto[dia],"°C",sep = ""),"es decir igual a la media mensual"),quote = F)
}
