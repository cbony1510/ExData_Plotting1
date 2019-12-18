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

png(file = "plot4.png")
par(mfrow=c(2,2))
hist(as.numeric(data_subset$Global_active_power), col = "red", xlab = "", ylab = "Global Active Power", main = "", drop.na = TRUE)
with(data_subset, plot(DateTime,as.numeric(Voltage), type = "line", xlab = "datetime", ylab = "Voltage", drop.na = TRUE))
with(data_subset, plot(DateTime,as.numeric(Sub_metering_1), type = "line", xlab = "", ylab = "Energy sub metering", drop.na = TRUE))
with(data_subset, lines(DateTime,as.numeric(Sub_metering_2), col = "red", drop.na = TRUE))
with(data_subset, lines(DateTime,as.numeric(Sub_metering_3), col = "blue", drop.na = TRUE))     
legend("topright", col = c("black", "red", "blue"), border = "white", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 3)
with(data_subset, plot(DateTime,as.numeric(Global_reactive_power), col = "black", type = "line", xlab = "datetime", ylab = "Global_reactive_power", drop.na = TRUE))     
dev.off()
