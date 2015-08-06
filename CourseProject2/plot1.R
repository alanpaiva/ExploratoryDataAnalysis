## 1- Loading data
## 2- Building data for plot1
## 3- Nominate columns
## 4- Making plot 1
## 5- Retaining the file

NEI <- readRDS("./exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("./exdata-data-NEI_data/Source_Classification_Code.rds")
library(plyr)

total.emissions <- ddply(NEI, .(as.character(year)), summarize, total=sum(Emissions)/1000000)

colnames <- c("year","million.tons")
colnames(total.emissions) <- colnames

par(ps=12, mar=c(5.1,5.1,4.1,2.1))
barplot(total.emissions$million.tons,
        col="grey",
        main=expression("Emissions from PM"[2.5]*" in USA"),
        xlab="Years",
        ylab=expression("Total of PM"[2.5]*" emitted, in million tons"),
        names.arg=total.emissions$year)

dev.copy(png, file = "plot1.png")
dev.off()
