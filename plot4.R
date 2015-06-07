# Read the data and remove the missing values
data <- read.csv("household_power_consumption.txt", header=TRUE, sep=';', na.strings="?")

# Set the date format
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

# Acquire the desire subset of the data and remove the complete dataset to 
# free some memory
newData <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data)

# Create a new variable that combines date and time using POSIXct
DateTime <- paste(as.Date(newData$Date), newData$Time)
newData$DateTime <- as.POSIXct(DateTime)

# generate plot 4 which includes 4 separate plots of global active power, voltage
# energy sub metering and global reactive power. 
# Set the png and image size
png("plot4.png",width=480, height=480, units="px")
par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))
plot(newData$DateTime, newData$Global_active_power, type = "l", 
         ylab = "Global Active Power", xlab = "")
plot(newData$DateTime, newData$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")
plot(newData$DateTime, newData$Sub_metering_1, type = "l", ylab = "Energy sub metering",
         xlab = "")
lines(newData$Sub_metering_2, newData$DateTime, col = 'Red')
lines(newData$Sub_metering_3, newData$DateTime, col = 'Blue')
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, bty = "n",
legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(newData$DateTime, newData$Global_reactive_power, type = "l", 
         ylab = "Global_reactive_power", xlab = "datetime")
dev.off()