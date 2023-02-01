library(dplyr)
library(lubridate)
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",destfile = "C://Users//ilopez//OneDrive - Superintendencia de Bancos de la Republica Dominicana//Documentos//Data Science Specialization//Data_Science_Specialization//Curso 4//Week 1//data.zip")
data <- read.table("household_power_consumption.txt",header = T,sep = ";")
data%>%head(20) 
colnames(data)
data <- data[("1/2/2007"==data$Date)|(data$Date=="2/2/2007"),]
data$Date<-data$Date%>%dmy()
plot(data$Sub_metering_1%>%as.numeric(),
     ylab = "Energy Submetering",type = "l", xaxt = 'n')
lines(data$Sub_metering_2%>%as.numeric(),
     ylab = "Energy Submetering",type = "l", xaxt = 'n',col="red")
lines(data$Sub_metering_3%>%as.numeric(),
      ylab = "Energy Submetering",type = "l", xaxt = 'n',col="blue")
axis(1, at=c(0,1400,2800),labels=c("Thur","Fri","Sat"))
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),pch=19,col = c("black","red","blue"))
png("plot3.png",height = 480,width = 480)
plot(data$Sub_metering_1%>%as.numeric(),
     ylab = "Energy Submetering",type = "l", xaxt = 'n')
lines(data$Sub_metering_2%>%as.numeric(),
      ylab = "Energy Submetering",type = "l", xaxt = 'n',col="red")
lines(data$Sub_metering_3%>%as.numeric(),
      ylab = "Energy Submetering",type = "l", xaxt = 'n',col="blue")
axis(1, at=c(0,1400,2800),labels=c("Thur","Fri","Sat"))
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),pch=19,col = c("black","red","blue"))

dev.off()