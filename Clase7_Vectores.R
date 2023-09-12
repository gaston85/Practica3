vector_numerico <- c(1, 3, 5, 7) # vector numérico
vector_texto <-c("arbol", "casa", "pez") # vector de caracteres
vector_logico <- c(TRUE, FALSE, TRUE)

nuevo_vector_2<- c(vector_logico, vector_numerico)
nuevo_vector_2
class(nuevo_vector_2)
nuevo_vector_1 <- c(vector_texto, vector_numerico)
class(nuevo_vector_1)


seq(100,10,by=-2)

a<- seq(0,10, by=2)
a[which(a>5)]
a[a>5]



#Ejercicio Vectores

rm(list = ls())


set.seed(11111)

Datos<-15:97

HR<-sample(Datos,31,replace = T)

ocurrencia_pp<-sample(c(1,0),31,replace = T)

#a
mean(HR)

#B Que dia del mes el ambiente estuvo saturado (HR>90). Guarde en un vector los datos de
#HR de esos dias
sobresat<-which(HR>90)
a<-HR[which(HR>90)]
#3.Esos dias coincidieron con precipitaciones?
ocurrencia_pp[sobresat]

#4.Calcule el numero de dias del mes que hubo precipitacion.
D_lluvia<-sum(ocurrencia_pp)
cat("La cantidad de dias que llovio en el mes fueron",D_lluvia)

TF<-c()
R<-c()
HI<-c()
for (i in 1:5) {
  TF[i]<-as.numeric(readline(paste("Ingrese la temp del dia ",i,"en F°: ")))
  R[i] <-as.numeric(readline(paste("Ingrese la Humedad Relativa del dia",i,": ")))
  HI[i]<- -42.379 + 2.04901523* TF[i] + 10.14333127* R[i] -0.22475541 * TF[i] * R[i] - 6.83783 * 10**-3 *TF[i]**2-5.481717*10**-2*R[i]**2+ 1.22874*10**-3*TF[i]**2*R[i] + 8.5282 * 10**-4*TF[i]*R[i]**2- 1.99 *10**-6*TF[i]**2*R[i]**2
  if(R[i]<13 & 80<TF[i] & TF[i]<112){
    Ajuste<-((13-R[i])/4)*sqrt((17-abs(TF[i]-95.))/17)
    HI[i]<-HI[i]-Ajuste
  }else if(R[i]>85 & 80<TF[i] & TF[i]<87){
    Ajuste<-((R[i]-85)/10) * ((87-TF[i])/5)
    HI[i]<-HI[i]+Ajuste
  }else if(HI[i]<80){
    HI[i] = 0.5 * (TF[i] + 61 + ((TF[i]-68)*1.2) + (R[i]*0.094))
  }
  if(HI[i]>80&HI[i]<90){
    print("Caution. Fatigue possible with prolonged exposure and/or physical activity")
  }else if(HI[i]>=90 & HI[i]<103){
    print("Extreme Caution. Heat stroke, heat cramps, or heat exhaustion possible with prolonged exposure and/or physical activity")
  }else if(HI[i]>=103 & HI[i]<124){
   print("Danger. Heat cramps or heat exhaustion likely, and heat stroke possible with prolonged exposure and/or physical activity") 
  }else{
    print("Extreme danger. Heat stroke highly likely")
  }
}

#Si quiero usar el vector
for (i in HI) {
  if(i>80&i<90){
    print("Caution. Fatigue possible with prolonged exposure and/or physical activity")
  }else if(i>=90 & i<103){
    print("Extreme Caution. Heat stroke, heat cramps, or heat exhaustion possible with prolonged exposure and/or physical activity")
  }else if(i>=103 & i<124){
    print("Danger. Heat cramps or heat exhaustion likely, and heat stroke possible with prolonged exposure and/or physical activity") 
  }else{
    print("Extreme danger. Heat stroke highly likely")
  }
}
