setwd("~/Coursera/Course Project 1")
library(data.table)
data <- fread("household_power_consumption.txt")
names(data)

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
# data$Time <- strptime(data$Time, format = "%H:%M:%S")

data_subset <- data_subset[data_subset$Date >= "2007-02-01" & data_subset$Date <= "2007-02-02"]
data_subset_date <- data_subset$Date
data_subset_time <- data_subset$Time
data_subset$DateTime <- as.POSIXct(paste(data_subset$Date, data_subset$Time), format="%Y-%m-%d %H:%M:%S")

png(file = "plot3.png")
with(data_subset, plot(DateTime,as.numeric(Sub_metering_1), type = "line", main = "", xlab = "", ylab = "Energy sub metering"))
with(data_subset, lines(DateTime,as.numeric(Sub_metering_2), col = "red"))
with(data_subset, lines(DateTime,as.numeric(Sub_metering_3), col = "blue"))   
legend("topright",legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),  lwd=1, col = c("black", "red","blue"))
dev.off()

     
     