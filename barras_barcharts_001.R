data(mtcars)

x <- table(mtcars$cyl)

x

y <- table(mtcars$gear)

y

colores_001 <- c("orange","blue","purple")

 barras_002 <- barplot(x,xlab="Cilindros",ylab="Frecuencias",col=colores_001,main="Número de Cilindros",ylim = c(0,18))

text(barras_002,x +0.5,labels = x,pos = 3)
 
 
 barras_001 <- barplot(y,xlab="Engranajes",ylab="Frecuencias",col=rainbow(3),main="Número de Engranajes",ylim = c(0,15))

text(barras_001,x + 0.5 ,labels=x)

lines(barras_001,c(10,4,2),type="o",lwd=3)


barras_001 <- barplot(y, xlab = "Engranajes", ylab = "Frecuencias", col = rainbow(3), main = "Número de Engranajes")
text(barras_001, y + 0.4, labels = y, pos = 3)





data(mtcars)

x <- table(mtcars$cyl)

colores_001 <- c("orange","blue","purple")

barras_001 <- barplot(x,xlab="Cilindros",ylab="Frecuencias",main="Número de Cilindros",col=colores_001)


lines(barras_001,c(10,5,8),type="o",lwd=3)

text(barras_001,x + 0.5,labels = x,pos = 3)



barras_002 <- barplot(y,xlab="Engranajes",ylab="Frecuencias",col=rainbow(3),main = "Números de Engranajes")

text(barras_002,y + 0.5,labels = y,pos = 3)








