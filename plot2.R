
setwd("/Users/vipinaggarwal/Desktop/DataScienceRCS/4.ExploringData/Project1")

data <- read.table("household_power_consumption.txt",sep = ";", header = TRUE, dec = ".", stringsAsFactors = F)

setwd("/Users/vipinaggarwal/Desktop/DataScienceRCS/4.ExploringData/Project1/ExData_Plotting1")

subData <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

subData$Global_active_power <- as.numeric(subData$Global_active_power)

dateTime <- strptime(paste(subData$Date, subData$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

png("plot2.png", width=480, height=480)

plot(dateTime, subData$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

dev.off()
