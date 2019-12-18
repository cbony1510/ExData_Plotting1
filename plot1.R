setwd("~/Coursera/Course Project 1")
library(data.table)
data <- fread("household_power_consumption.txt")
names(data)

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
# data$Time <- strptime(data$Time, format = "%H:%M:%S")

data_subset <- data[data$Date >= "2007-02-01" & data$Date <= "2007-02-02"]
png(file = "plot1.png")
hist(as.numeric(data_subset$Global_active_power), col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", drop.na = TRUE)
dev.off()


