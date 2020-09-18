# Import Data set
data <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE)

# Format date and time in dataset
library(lubridate)
data$Date <- dmy(data$Date)
data$Time <- hms(data$Time)

# Subset dataframe to 2007-02-01 and 2007-02-02 dates
data <- subset(data, Date=="2007-02-01"|Date=="2007-02-02")

# Create 4 line subplots (Date and Time columns are added for x-axis value)
par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0)) # divide plot graphic to 4 plots
with(data, plot(Date+Time, Global_active_power, type = "l", ylab = "Global Active Power", xlab = "")) #subplot 1
with(data, plot(Date+Time, Voltage, type = "l", ylab = "Voltage", xlab = "datetime")) #subplot 2
with(data, {
    plot(Date+Time, Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
    lines(Date+Time, Sub_metering_2, col = "red")
    lines(Date+Time, Sub_metering_3, col = "blue")
})
legend("topright", names(data)[7:9], col = c("black", "red", "blue"), lty = 1, bty = "n") #subplot 3
with(data, plot(Date+Time, Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime")) #subplot 4

# Save plot to "plot4.png" 480x480 png file in current directory
dev.copy(png, file = "plot4.png", width=480, height=480)
dev.off()