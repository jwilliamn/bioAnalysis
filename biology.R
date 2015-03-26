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
# Omitting NAs
newBio <- subset(bioData, !is.na(bioData$dc.en.menores.de.5.años))

tmp0 <- read.csv(listFiles[1])
tmp1 <- read.csv(listFiles[1])
for(i in 2:7){
    name <- listFiles[i]
    tmp <- read.csv(listFiles[i])
    tmp$ddc <- tmp$dc.en.menores.de.5.años - tmp0$dc.en.menores.de.5.años
    tmp$ddct <- tmp$dc.en.menores.de.5.años - tmp1$dc.en.menores.de.5.años
    tmp$Invt <- tmp$Inversión.pública + tmp0$Inversión.pública
    tmp0 <- tmp
    write.table(tmp, file = name, sep = ",")
}

# Multiple plotting
ggplot(aes(x = year), data = subset(bioData, Regiones == "Huancavelica")) + 
    geom_line(aes(y = Inversión.salud, colour = "Inversión.salud")) + 
    geom_line(aes(y = Inversión.educación, colour = "Inversión.educación")) + 
    geom_line(aes(y = Inversión.transporte, colour = "Inversión.transporte"))