
setwd("/Users/vipinaggarwal/Desktop/DataScienceRCS/4.ExploringData/Project1")
 
data <- read.table("household_power_consumption.txt",sep = ";", header = TRUE, dec = ".", stringsAsFactors = F)

setwd("/Users/vipinaggarwal/Desktop/DataScienceRCS/4.ExploringData/Project1/ExData_Plotting1")

subData <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

subData$Global_active_power <- as.numeric(subData$Global_active_power)

png("plot1.png", width=480, height=480)

hist(subData$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

dev.off()
