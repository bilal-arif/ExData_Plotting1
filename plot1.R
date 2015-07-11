setwd("D:/Uni Works/Data Science/Module 4/Assignment 1")
file<-file("household_power_consumption.txt")
data_full<-read.table(text = grep("^[1,2]/2/2007", readLines(file), value = TRUE), col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), sep = ";", header = TRUE)
data_full$Date <- as.Date(data_full$Date, format = "%d/%m/%Y")
data <- subset(data_full, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))



png(filename='plot1.png',width=480,height=480,units='px')
hist(data$Global_active_power,col="red",main="Global Active Power",ylab="Frequency",xlab="Global Active Power (kilowatts)")
dev.off()