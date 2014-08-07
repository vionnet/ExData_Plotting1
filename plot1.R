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
#Create plot1.png
png(file = "plot1.png", width = 480, height = 480)
hist(workData$Global_active_power, main = "Global Active Power", ylab = "Frequency", xlab = "Global Active Power (kilowatts)", col = "red")
dev.off()