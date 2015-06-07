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

# Draw a graph global active power for the selected days to generate plot 2
# and save it as a png file with set image dimensions
png("plot2.png",width=480, height=480, units="px")
plot(newData$DateTime, newData$Global_active_power, type = "l",
     ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()