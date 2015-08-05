## 1- Obtaining full dataset
## 2- Subgrouping the data
## 3- Transform the dates
## 4- Number 3 plot 
## 5- Retaining the file

fulldt <- read.csv("./household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
fulldt$Date <- as.Date(fulldt$Date, format="%d/%m/%Y")

data <- subset(fulldt, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(fulldt)

subtime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(subtime)

with(data, {
  plot(Sub_metering_1~Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
