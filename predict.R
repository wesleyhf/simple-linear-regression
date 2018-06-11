dataset = read.table('dataset.txt', header=T)
attach(dataset)

# diagrama de dispersao
plot(ano, taxa, col=c('red', 'blue', 'green'))

# correlacao linear = 0.9232208
cor(ano, taxa)

# teste de hipoteses
cor.test(ano, taxa)

# ajuste do modelo
ajuste.modeloLinear = lm(taxa ~ ano)
ajuste.modeloLinear

# teste de significancia do modelo
summary(ajuste.modeloLinear)

# teste de normalidade
shapiro.test(residuals(ajuste.modeloLinear))

# previsao
predict(ajuste.modeloLinear, newdata=data.frame(ano=2019))

# reta ajustada
plot(ano, taxa, col=c('red', 'blue', 'green'))
abline(ajuste.modeloLinear)

# coeficiente de determinacao
summary(ajuste.modeloLinear)$r.squared