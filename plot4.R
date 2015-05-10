# Use the data from the plot 2 to generate plot 4. 
# Set the png and image size
png("plot4.png",width=480, height=480, units="px")
par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))
with(newData, {
    plot(DateTime, Global_active_power, type = "l", 
         ylab = "Global Active Power", xlab = "")
    plot(DateTime, Voltage, type = "l", ylab = "Voltage", xlab = "datetime")
    plot(DateTime, Sub_metering_1, type = "l", ylab = "Energy sub metering",
         xlab = "")
    lines(Sub_metering_2, DateTime, col = 'Red')
    lines(Sub_metering_3, DateTime, col = 'Blue')
    legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, 
           bty = "n",
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    plot(DateTime, Global_reactive_power, type = "l", 
         ylab = "Global_reactive_power", xlab = "datetime")
})
dev.off()