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

png(file = "plot2.png")
plot(data_subset$DateTime,as.numeric(data_subset$Global_active_power), type = "line", xlab = "", ylab = "Global Active Power (kilowatts)", main = "")
dev.off()
