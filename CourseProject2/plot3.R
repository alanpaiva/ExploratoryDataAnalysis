## 1- Loading data
## 2- Subsetting data
## 3- Building data for plot3
## 4- Nominate columns
## 5- Making plot 3
## 6- Retaining the file

NEI <- readRDS("./exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("./exdata-data-NEI_data/Source_Classification_Code.rds")

baltimore.data <- NEI[NEI$fips == "24510",]

library(plyr)
total.emissions <- ddply(baltimore.data, .(as.factor(year), as.factor(type)), summarize, total=sum(Emissions))

colnames <- c("year","type", "tons")
colnames(total.emissions) <- colnames

library(ggplot2)
png(filename = "plot3.png", width = 807, height = 342)
qplot(year, 
      data = total.emissions, 
      facets = . ~ type, 
      geom="bar", 
      weight=tons, 
      main=expression("Total emissions from PM"[2.5]*" in Baltimore City, MD by Source/Type/Year"),
      xlab="Years",
      ylab = expression("Amount of PM"[2.5]*" emitted, in tons"),
      fill = type)

dev.off()
