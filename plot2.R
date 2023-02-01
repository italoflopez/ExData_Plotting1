library(dplyr)
library(lubridate)
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",destfile = "C://Users//ilopez//OneDrive - Superintendencia de Bancos de la Republica Dominicana//Documentos//Data Science Specialization//Data_Science_Specialization//Curso 4//Week 1//data.zip")
data <- read.table("household_power_consumption.txt",header = T,sep = ";")
data%>%head(20) 
colnames(data)
data <- data[("1/2/2007"==data$Date)|(data$Date=="2/2/2007"),]
data$Date<-data$Date%>%dmy()
plot(data$Global_active_power%>%as.numeric(),
     ylab = "Global Active Power (kilowatts)",type = "l", xaxt = 'n')
axis(1, at=c(0,1250,2500),labels=c("Thur","Fri","Sat"))
png("plot2.png",height = 480,width = 480)
plot(data$Global_active_power%>%as.numeric(),
     ylab = "Global Active Power (kilowatts)",type = "l", xaxt = 'n')
axis(1, at=c(0,1250,2500),labels=c("Thur","Fri","Sat"))
dev.off()
