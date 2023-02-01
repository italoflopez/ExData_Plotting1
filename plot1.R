library(dplyr)
library(lubridate)
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",destfile = "C://Users//ilopez//OneDrive - Superintendencia de Bancos de la Republica Dominicana//Documentos//Data Science Specialization//Data_Science_Specialization//Curso 4//Week 1//data.zip")
data <- read.table("household_power_consumption.txt",header = T,sep = ";")
data%>%head(20) 
colnames(data)
data <- data[("1/2/2007"==data$Date)|(data$Date=="2/2/2007"),]
data$Date<-data$Date%>%dmy()
hist(data$Global_active_power%>%as.numeric(),col="red",main="Global Active Power",
     xlab = "Global Active Power (kilowatts)")
png("plot1.png",height = 480,width = 480)
hist(data$Global_active_power%>%as.numeric(),col="red",main="Global Active Power",
     xlab = "Global Active Power (kilowatts)")
dev.off()
