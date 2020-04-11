

setwd("/Users/vipinaggarwal/Desktop/DataScienceRCS/4.ExploringData/Project1")

data <- read.table("household_power_consumption.txt",sep = ";", header = TRUE, dec = ".", stringsAsFactors = F)

setwd("/Users/vipinaggarwal/Desktop/DataScienceRCS/4.ExploringData/Project1/ExData_Plotting1")

subData <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

subData$Sub_metering_1 <- as.numeric(subData$Sub_metering_1)
subData$Sub_metering_2 <- as.numeric(subData$Sub_metering_2)
subData$Sub_metering_3 <- as.numeric(subData$Sub_metering_3)
dateTime <- strptime(paste(subData$Date, subData$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

subData$Global_active_power <- as.numeric(subData$Global_active_power)
subData$Global_reactive_power <- as.numeric(subData$Global_reactive_power)
subData$Voltage <- as.numeric(subData$Voltage)

png("plot4.png", width=480, height=480)

par(mfrow=c(2,2))

plot(dateTime, subData$Global_active_power, type = "l", ylab = "Global Active Power", xlab = "")

plot(dateTime, subData$Voltage, type = "l", xlab = "dateTime", ylab = "Voltage")

plot(dateTime, subData$Sub_metering_1, type = "l", ylab="Energy Submetering", xlab="")
lines(dateTime, subData$Sub_metering_2, type = "l", col = "red")
lines(dateTime, subData$Sub_metering_3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty=1, lwd=2.5, col=c("black", "red", "blue"))

plot(dateTime, subData$Global_reactive_power, type = "l", xlab = "dateTime", ylab = "Global Reactive Power")

dev.off()
