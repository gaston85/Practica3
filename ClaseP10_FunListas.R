#############FUNCIONES##################
nudos_a_ms <- function(viento) {
  ms <- viento * 0.5144
  return(ms)
}

ms_a_nudos<-function(viento){
  if(!is.numeric(viento)) stop("viento no es numerico")
  nudos<- viento *1.944
  return(nudos)
}
ms_a_nudos("fuerte")

datos_viento <- data.frame(hora = seq(0, 9),
                           viento = c(21.58, 18.08, 7.19, 7.19, 7.19, 7.19, 7.19,
                                      3.69, 3.69, 7.19))
head(datos_viento)

datos_viento$viento_ms <- nudos_a_ms(datos_viento$viento)
head(datos_viento)
class(datos_viento$viento_ms)

nudos_a_ms <- function(viento, conversion = 0.51) { #Puedo cambiar la variable de conversion a una con mayor precision
  if (!is.numeric(viento)) stop("viento no es numérico")
  ms <- viento * conversion
  return(ms)
}

nudos_a_ms(50,0.5144)

convertir_viento<-function(viento,unidades){
  if (!is.numeric(viento)) stop("viento no es numérico")
  if(unidades=="ms") {
    ms <- viento * 0.5144
    return(ms)
  } else if(unidades=="nudos"){
    nudos<- viento *1.944
    return(nudos)
  } else
    cat("Error. Ingreso una unidad no valida")
}
convertir_viento(50,readline("Ingrese las unidades deseadas: "))


#######LISTAS###########
rm(list = ls())
familia <- list(Mama1="Maria",Mama2="Juana", casadas=10,Hijxs=c("Hugo", "Paula"),
                edad=c(8,7)) #genero la lista familia
class(familia$edad[1])

familia_2 <- list(mascotas = "Gato",vacaciones_favoritas = c("Mar del Plata","Bariloche"))
familia_concatenada <- c(familia, familia_2)
familia_concatenada

#Ejercicio----
rm(list = ls())

clase<-list(alumnxs=c("Cate","Gaston","Felipe","Candelaria","Camila"),edad=c(20,22,22,22,21))
clase$promedio_edad<-mean(clase$edad)
lapply(clase,length)
