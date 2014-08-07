#Comments in terminal
#head -n 1 household_power_consumption.txt > subData.txt
#cat household_power_consumption.txt  | grep '^0\{0,1\}[12]/0\{0,1\}2/2007' >> subData.txt

#Start R commend
library("data.table", lib.loc="/Library/Frameworks/R.framework/Versions/3.1/Resources/library")
library(datasets)
#read data
data <- read.table("subData.txt", sep = ";", header = T, na.strings = "?")
dates <- data$Date
times <- data$Time
x <- paste(dates,times)
#reformat
newtime <- strptime(x, "%d/%m/%Y %H:%M:%S")
workData <- cbind(newtime, data)

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