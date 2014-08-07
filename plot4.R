#Create plot4
dev.copy(png, file = "plot4.png", width = 480, height = 480)
par(mfrow = c(2,2), mar = c(4, 4, 2, 1), oma = c(1, 1, 1, 1))
with(workData, {
  #top left
  plot(newtime, Global_active_power, type="l", xlab="", ylab="Global Active Power")
  #top right
  plot(newtime, Voltage, type="l", xlab="datetime", ylab="Voltage")
  #bottom left
  plot(newtime, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
  points(newtime, Sub_metering_2, type="l", col="red")
  points(newtime, Sub_metering_3, type="l", col="blue")
  legend("topright", lty=1, col=c("black","red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty="n", cex = 0.8)
  #bottom right
  plot(newtime, Global_reactive_power, type="l", xlab="datetime", ylim=c(0,0.5))

})

dev.off()