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

# generate plot 3: a plot of energy sub-metering against days of interest for 3 sub-metering. 
# Set the png and image size
png("plot3.png",width=480, height=480, units="px")
plot(newData$DateTime, newData$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(newData$DateTime, newData$Sub_metering_2, col = 'Red')
lines(newData$DateTime, newData$Sub_metering_3, col = 'Blue')
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, 
legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()