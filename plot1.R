# Course project 1: Plot1

rm(list = ls())
data <- read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?")  # loading the data

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")  # converting the date variable to Date class

data <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02")) # Subsetting  the data

data$datetime <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")  # Converting dates and times

attach(data)
hist(Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "Red")

dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()
detach(data)
