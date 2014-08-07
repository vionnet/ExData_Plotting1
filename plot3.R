#Create plot3
png(file = "plot3.png", width = 480, height = 480)
plot(workData$newtime, workData$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
points(workData$newtime, workData$Sub_metering_2, type="l", col="red")
points(workData$newtime, workData$Sub_metering_3, type="l", col="blue")
legend("topright", lty=1, col=c("black","red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=0.7)
dev.off()
