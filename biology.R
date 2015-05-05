# Analysis de inversion económica vs salud

# ordenamiento de data
setwd('/home/williamn/Repository/bioAnalysis')
listFiles <- list.files("bioData", full.names = TRUE)
dat<- data.frame()
for(i in 1:length(listFiles)){
    dat <- rbind(dat, read.csv(listFiles[i]))
}
write.table(dat, file = "data.txt", sep = ",", row.names = F)

# Reading data
bioData <- read.csv('data.txt')
library(ggplot2)
library(ggthemes)
library('gridExtra')
library('reshape2')

# Exploratory analysis
# Multiple plotting for investments
ggplot(aes(x = year), data = subset(bioData, Regiones == "Loreto")) + 
    geom_line(aes(y = Inversión.salud, colour = "Inversión.salud")) + 
    geom_line(aes(y = Inversión.educación, colour = "Inversión.educación")) + 
    geom_line(aes(y = Inversión.transporte, colour = "Inversión.transporte")) + 
    theme_bw()

# Desidad de profesionales
ggplot(aes(x = year), data = subset(bioData, Regiones == "Loreto")) + 
    geom_line(aes(y = Médicos.asignados/Población, colour = "Médicos.asignados/Población")) + 
    geom_line(aes(y = enfermeros/Población, colour = "enfermeros/Población")) + 
    geom_line(aes(y = obstétras/Población, colour = "obstétras/Población")) + 
    theme_bw()

# Dc en < 5 años
ggplot(aes(x = year), data = subset(bioData, Regiones == "Junin")) + 
    geom_line(aes(y = dc.en.menores.de.5.años, colour = "dc.en.menores.de.5.años")) + 
    theme_bw()

# Rurality vs dc < 5 years
da <- read.csv('data.csv')

ggplot(aes(x = Indice.ruralidad), data = subset(da, Regiones == "Lima")) + 
    geom_line(aes(y = dc.en.menores.de.5.años, colour = "dc.en.menores.de.5.años")) + 
    theme_bw()

# Rurality vs goverment expenditure
ggplot(aes(x = Indice.ruralidad), data = subset(da, Regiones == "Cuzco")) + 
    geom_line(aes(y = Inversión.salud, colour = "Inversión.salud")) + 
    geom_line(aes(y = Inversión.educación, colour = "Inversión.educación")) + 
    geom_line(aes(y = Inversión.transporte, colour = "Inversión.transporte")) + 
    theme_bw()

ggplot(aes(x = Indice.ruralidad), data = subset(da, Regiones == "Cuzco")) + 
    geom_line(aes(y = Médicos.asignados/Población, colour = "Médicos.asignados/Población")) + 
    geom_line(aes(y = enfermeros/Población, colour = "enfermeros/Población")) + 
    geom_line(aes(y = obstétras/Población, colour = "obstétras/Población")) + 
    theme_bw()

# Rurality over time
ggplot(aes(x = year), data = subset(da, Regiones == "Cuzco")) + 
    geom_line(aes(y = Indice.ruralidad, colour = "Indice.ruralidad")) + 
    theme_bw()

