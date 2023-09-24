# tutoriales

data(mtcars)

names(mtcars)

x <- table(mtcars$cyl)

x

colores_001 <- c("orange","blue","purple")

barras_001 <- barplot(x,xlab="Cilindros",ylab="Frecuencias",names.arg = c("Cuatro","Seis","Ocho"),
                      col=colores_001,main="Número de Cilindros",ylim=c(0,18),width=c(4,6,8),
                      density=c(10,10,10),border="darkgreen",sub = "Mtcars - Var:Cyl")

text(barras_001,x + 0.5,label=x,pos=3)

lines(barras_001,c(10,5,12),type="o",lwd=2,col="darkblue")

mtext("Var:Cyl",side=3,line=0,cex=2)

grid(lty = 3,col="gray")


y <- table(mtcars$gear)

y

barras_002 <- barplot(y,xlab="Engranajes",ylab="Frecuencias",col=rainbow(3),
                      main="Número de Engranajes",ylim = c(0,18),width=c(3,4,5))

text(barras_002,y + 0.5,label=y,pos=3)

lines(barras_002,c(12,8,4),type="o",lwd=2,col="darkblue")

mtext("Var:Gear",side=3,line=0,cex=2)

grid(lty=4,col="gray")

barras_003 <- barplot(x,xlab="Cilindros",ylab="Frecuencias",col=colores_001,
                      main="Número de Cilindros",horiz = TRUE)

library(lattice)

barchart(x,xlab="Cillindros",ylab="Frecuencias",col=colores_001,main="Número de Cilindros",horizontal = FALSE)

barchart(y,xlab="Engranajes",ylab="Frecuencias",col=rainbow(3),main="Número de Engranajes",horizontal = FALSE)

library(readxl)


paises_001 <- read_excel("G:/Leaflet_Mapas_R_RStudio/paises_001",sheet="paises_002")

paises_millones <- paises_001$POBLACION / 1000000

paises_Europa <- barplot(paises_millones,horiz = TRUE,names.arg = paises_001$PAIS,xlab="Población (Mlls)",
        ylab="Países",main="Población Paises Top Europa",xlim = c(0,100),col="darkblue")

text(paises_millones,paises_Europa,label=paste0(paises_millones,"M"),pos=4)

grid(lty=3,col="orange")


paises_002 <- read_excel("G:/Leaflet_Mapas_R_RStudio/paises_001.xlsx",sheet="paises_001")

paisesmillones_001 <- paises_002$POBLACION / 1000000

europa_paises <- barplot(paisesmillones_001,horiz = TRUE,names.arg = paises_002$PAIS,
                         xlab="Población (Mlls)",ylab="Países",main="Top Países Europeos - Población",
                         xlim=c(0,100),col="orange")



datos_001 <- matrix(c(10,15,8,12,9,6),nrow = 2,byrow = TRUE)

datos_001

rownames(datos_001) <- c("Categoría 1","Categoría 2")

colnames(datos_001) <- c("Grupo 1","Grupo 2","Grupo 3")


barplot(datos_001,beside=TRUE,xlab="Categorías",ylab="Valores",main="Diagrama Barras Apiladas",
        col=c("orange","blue"))




# Datos de ejemplo
datos <- matrix(c(10, 15, 8, 12, 9, 6), nrow = 2, byrow = TRUE)

datos

colnames(datos) <- c("Grupo 1", "Grupo 2", "Grupo 3")
rownames(datos) <- c("Categoría 1", "Categoría 2")

# Generar el gráfico de barras apiladas
barplot(datos, beside = FALSE,
        xlab = "Categorías", ylab = "Valores",
        main = "Diagrama de Barras Apiladas",col=c("orange","blue"))




datos_001 <- matrix(c(10,15,8,12,9,6),nrow=3,byrow = TRUE)

datos_001

rownames(datos_001) <- c("Categoría 1","Categoría 2","Categoría 3")

colnames(datos_001) <-c("Grupo 1","Grupo 2")

b_apiladas <-barplot(datos_001,beside = TRUE,xlab="Categorías",ylab = "Valores",main="Diagrama Barras Apiladas",
        col=c("orange","blue","purple"),ylim=c(0,18))



text(b_apiladas,datos_001,labels = datos_001,pos=3)

library(ggplot2)


ggplot(mtcars,aes(x=cyl)) + geom_bar(fill=colores_001,width=1) + geom_text(stat="count",aes(label=..count..),vjust=-0.5) +geom_line(aes(x=cyl,y=stat(count)),stat="count",group=1,size=1,color="darkblue") +labs(x="Cilindros",y="Frecuencias",title="Número de Cilindros",subtitle = "Var:Cyl")+
  theme_dark()


ggplot(mtcars,aes(cyl)) + geom_bar(stat="identity",width=1) + geom_text(stat="count",aes(label=..count..),vjust=-0.5) + geom_line(aes(x=cyl,y=stat(count)),stat="count",group=1,size=1,color="darkblue")   +labs(x="Cilindros",y="Frecuencias",title="Número de Cilindros",subtitle = "Var:Cyl") + theme_dark()












