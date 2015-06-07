# Read the data and remove the missing values
data <-read.csv("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

# Set the date format
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

# Acquire the desire subset of the data and remove the complete dataset to 
# free some memory
newData <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data)

# Create a new variable that combines date and time using POSIXct
DateTime <- paste(as.Date(newData$Date), newData$Time)
newData$DateTime <- as.POSIXct(DateTime)

# Construct a histogram with and save it as a png file with set image dimensions 
# as plot 1
png("plot1.png",width=480, height=480, units="px")
hist(newData$Global_active_power, col = "red", main = paste("Global Active Power"), xlab = "Global Active Power (kilowatts)")
dev.off()