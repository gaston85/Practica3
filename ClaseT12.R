#################
##################################################################
# # Laboratorio de Procesamiento de Informacion Meteorologica
# 
# 2do cuatrimestre 2023
##################################################################

# Clase_Informacion R y binario Alumnos
###################################################

############formato R #########
rm(list = ls())
x <- stats::runif(20) #Indica el paquete que pertenece

y <- list(a = 1, b = TRUE, c = "oops")

save(x, y, file = "xy.RData") #Guardo las variables bajo ese archivo

load("xy.RData") #Cuiado, si existen variables con el mismo nombre, al cargar estas se sobreescribiran

save.image()
unlink("xy.RData")	
unlink(".RData") 		


##################
rm(x,y)
attach("xy.RData") #Lo guarda en la seccion del global enviroment, otra seccion
x
y

detach("file:xy.RData")

##########################
try(data(package="rpart")) #Muestra los archivos de datos en la libreria     

data(USArrests, "VADeaths") #carga los conjuntoa de datos
#Crea la promesa de evaluar la expresion si es que se la solicita 

ds <- c("USArrests", "VADeaths") 
ds
data(list = ds) #recien cargo los datos

#################################
#ejercicio que hacen SOLOS
rm(list = ls())
# genero una matriz de 20 valores aleatorios que tenga 5 columnas
a<-matrix(runif(20),ncol = 5)
a
# Crear una segunda matriz de 20 n�meros ordenados por fila en 5 columnas
b<-matrix(runif(20),ncol = 5, byrow = T)
b
# Guardar los datos usando la funci�n save en el archivo matriz20.Rdata
save(a,b,file = "matriz20.Rdata")

# Borrar el ambiente de trabajo y volver a cargar la informaci�n guardada en 
# matriz20.RData utilizando dos m�todos diferentes
rm(a,b)
load("matriz20.Rdata")
attach("matriz20.Rdata")
detach("file:matriz20.Rdata")

########################################


### BINARIO####
rm(list = ls())
#####################
#La forma mas general
zz <- file("testbin")	#Este archivo es para escribir y leer texto y esta cerrado
zz                             	

##########################
#Lo abro con el modo wb
zz <- file("testbin", "wb")	
zz

#####################

writeBin(1:10, zz) #Que quiero y donde

close(zz)

zz <- file("testbin", "rb")#Tengo que pedirle permiso par poder leerlo

readBin(zz, integer(), 4)

readBin(zz, integer(), 6)    

######################################
zz1 <- file("testbin", "wb")		        
writeBin(pi, zz1, endian = "little")   	
close(zz1)                         		 

zz1 <- file("testbin", "rb")
readBin(zz1, numeric(), 1, endian = "little")

########################################

zz2 <- file("testbin", "wb")
writeBin(pi^2, zz2, size = 4, endian = "swap")
close(zz2)                         		    

zz2 <- file("testbin", "rb")            
readBin(zz2, numeric(), size = 4, endian = "swap")

## SIZE Y ENDIAN NO NOS COMPETEN  #####
#El permiso tiene que ser binario para escribir en binario
