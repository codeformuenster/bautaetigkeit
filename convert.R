library(reshape)
data = read.csv("wohnungen.csv")
names(data) = c("Stadtbezirk","Bezirksname",2010:2014)
data.melt = melt(data, id.vars=1:2)

write.csv(data.melt,"wohnungen_melt.csv")


data.bezirke = data[!is.na(data$Stadtbezirk), ]
data.bezirke.melt = melt(data.bezirke, id.vars=1:2)

data.bezirke.melt$variable = paste("01-01-",data.bezirke.melt$variable,sep="")

write.csv(data.bezirke.melt,"wohnungen_dates.csv")
