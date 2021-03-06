setwd("D:/Uni Works/Data Science/Module 4/Assignment 1")
file<-file("household_power_consumption.txt")
data_full<-read.table(text = grep("^[1,2]/2/2007", readLines(file), value = TRUE), col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), sep = ";", header = TRUE)
data_full$Date <- as.Date(data_full$Date, format = "%d/%m/%Y")
data <- subset(data_full, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

png(filename='plot4.png',width=480,height=480,units='px')

par(mfrow=c(2,2))
plot(data$Global_active_power ~ data$Datetime, type="l",ylab="Global Active Power",xlab="")
plot(data$Voltage ~ data$Datetime, type="l",ylab="Voltage",xlab="")
with(data,{
    plot(Sub_metering_1 ~ Datetime, type="l",ylab="Energy sub metering",xlab="")
    lines(Sub_metering_2 ~ Datetime, col="red")
    lines(Sub_metering_3 ~ Datetime, col="blue")
})

legend("topright",col=c("black","red","blue"),lty=1,lwd=2,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

plot(data$Global_reactive_power ~ data$Datetime, type="l",ylab="Global ReActive Power",xlab="")

dev.off()