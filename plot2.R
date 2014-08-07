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

#plot2 of assignment 1
png(file = "plot2.png", width = 480, height = 480)
plot(workData$newtime, workData$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
