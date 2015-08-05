## 1- Obtaining full dataset
## 2- Subgrouping the data
## 3- Transform the dates
## 4- Number 1 plot
## 5- Retaining the file

fulldt <- read.csv("./household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
fulldt$Date <- as.Date(fulldt$Date, format="%d/%m/%Y")

data <- subset(fulldt, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(fulldt)

subtime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(subtime)

hist(data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
