# Import Data set
data <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE)

# Format date and time in dataset
library(lubridate)
data$Date <- dmy(data$Date)
data$Time <- hms(data$Time)

# Subset dataframe to 2007-02-01 and 2007-02-02 dates
data <- subset(data, Date=="2007-02-01"|Date=="2007-02-02")

# Create line plot (Date and Time columns are added for x-axis value)
with(data, plot(Date+Time, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))

# Save plot to "plot2.png" 480x480 png file in current directory
dev.copy(png, file = "plot2.png", width=480, height=480)
dev.off()