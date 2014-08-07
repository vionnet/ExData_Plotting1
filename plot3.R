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

#Create plot3
png(file = "plot3.png", width = 480, height = 480)
plot(workData$newtime, workData$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
points(workData$newtime, workData$Sub_metering_2, type="l", col="red")
points(workData$newtime, workData$Sub_metering_3, type="l", col="blue")
legend("topright", lty=1, col=c("black","red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=0.7)
dev.off()
