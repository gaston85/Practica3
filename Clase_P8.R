matriz<- matrix(c(1,2,3,4))
matriz_2<- matrix(c(1,2,3,4), ncol = 2, nrow = 2, byrow = T)
matriz_2
solve(matriz_2)
cbind(matriz,matriz_2)

A <- matrix(data = c(1, 5, 8, 4, 8, 7, 9, 1, 3),ncol = 3, nrow = 3, byrow = T)
A
A[3,2]

velocidad<- matrix(c(10, NA, 15, 1, 5, NA, 20, NA, 50, NA, 12, 16), ncol =4 )
velocidad
which(is.na(velocidad),arr.ind = T) #me muestra las filas y las col

rm(list = ls())
pp_diciembre<-c(28,130,118.9)
pp_enero<-c(40,153.2,135.4)
pp_febrero<-c(43,152.9,127.2)

pp<-c(28,130,118.9,40,153.2,135.4,43,152.9,127.2)
matriz_pp_vreano<-matrix(pp,ncol = 3,byrow = T,dimnames = estaciones)

estaciones<-list(c("pp_diciembre","pp_enero","pp_febrero"),c("Mendoza","Jujuy","Buenos Aires"))


prom_mendoza<-mean(matriz_pp_vreano[,1])
prom_jujuy<-mean(matriz_pp_vreano[,2])
prom_BsAS<-mean(matriz_pp_vreano[,3])
prom_verano<-cbind(prom_mendoza,prom_jujuy,prom_BsAS)
matriz_pp_vreano<-rbind(matriz_pp_vreano,prom_verano)
matriz_pp_vreano<- matriz_pp_vreano[1:3,1:3]
matriz_pp_vreano<-matriz_pp_vreano[,-c(4,5)]
row.names(matriz_pp_vreano)[4] <- "Medias"
