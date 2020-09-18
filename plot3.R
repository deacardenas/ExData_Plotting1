# Import Data set
data <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE)

# Format date and time in dataset
library(lubridate)
data$Date <- dmy(data$Date)
data$Time <- hms(data$Time)

# Subset dataframe to 2007-02-01 and 2007-02-02 dates
data <- subset(data, Date=="2007-02-01"|Date=="2007-02-02")

# Create line plot with the 3 sub_metering variables (Date and Time columns are added for x-axis value)
with(data, {
    plot(Date+Time, Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
    lines(Date+Time, Sub_metering_2, col = "red")
    lines(Date+Time, Sub_metering_3, col = "blue")
})
legend("topright", names(data)[7:9], col = c("black", "red", "blue"), lty = 1) # add legend to plot

# Save plot to "plot3.png" 480x480 png file in current directory
dev.copy(png, file = "plot3.png", width=480, height=480)
dev.off()