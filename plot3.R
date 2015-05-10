# Use the data from the plot 2 to generate plot 3. 
# Set the png and image size
png("plot3.png",width=480, height=480, units="px")
with(newData, {
    plot(DateTime, Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
    lines(DateTime, Sub_metering_2, col = 'Red')
    lines(DateTime, Sub_metering_3, col = 'Blue')
})
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()