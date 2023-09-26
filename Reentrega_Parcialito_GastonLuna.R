#Se evaluara la temperatura de un dia deseado con la temperatura promedio del mes
#y con respecto al resultado se enviara un mensaje.
rm(list = ls())

#Pido el ingreso del dia deseado a a analizar

dia<-as.numeric(readline("Ingrese el dia de Agosto deseado a analizar: "))
while (is.na(dia)) {
  dia<-as.numeric(readline("Error. Ingrese en formato numerico el dia deseado: "))
}
while(dia>31|dia<1){
  dia<-as.numeric(readline("Ingresó un dia no perteneciente al mes de Agosto, intente otra vez: "))
}

#Pregunto por las temperaturas de agosto y genero un promedio
total_temp<-0
for (i in 1:31) {
  temp<-as.numeric(readline(paste("Cual es la temperatura del dia",i,"de Agosto? ")))
  while (is.na(temp)) {
    temp<-as.numeric(readline("Error. Ingrese en formato numerico la temperatura deseada: "))
  }
  if(i==dia){ #Guardo la temperatura del dia deseado
    temp_dia_deseado<-temp
  }
  total_temp<-total_temp+temp
  media_agos<-total_temp/i
}

#Evaluo la temperatura del dia deseado con la mensual de agosto y envio un mensaje

if(temp_dia_deseado<media_agos){
  print(paste("El dia",dia,"del mes de Agosto la temperatura fue de",
              paste(temp_dia_deseado,"°C",sep = ""),"es decir debajo de la media mensual"),quote = F)
}else if (temp_dia_deseado>media_agos){
  print(paste("El dia",dia,"del mes de Agosto la temperatura fue de",
              paste(temp_dia_deseado,"°C",sep = ""),"es decir por encima de la media mensual"),quote = F)
}else{
  print(paste("El dia",dia,"del mes de Agosto la temperatura fue de",
              paste(temp_dia_deseado,"°C",sep = ""),"es decir igual a la media mensual"),quote = F)
}
