# Import Data set
data <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE)

# Format date and time in dataset
library(lubridate)
data$Date <- dmy(data$Date)
data$Time <- hms(data$Time)

# Subset dataframe to 2007-02-01 and 2007-02-02 dates
data <- subset(data, Date=="2007-02-01"|Date=="2007-02-02")

# Create histogram plot with Global Active Power variable
hist(data$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

# Save plot to "plot1.png" 480x480 png file in current directory
dev.copy(png, file = "plot1.png", width=480, height=480)
dev.off()