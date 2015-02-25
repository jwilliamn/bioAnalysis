# Analysis de inversion económica vs salud

# ordenamiento de data
setwd('/home/williamn/Repository/bioAnalysis')
listFiles <- list.files("data", full.names = TRUE)
dat<- data.frame()
for(i in 1:7){
    dat <- rbind(dat, read.csv(listFiles[i]))
}
write.table(dat, file = "data.txt", sep = ",")