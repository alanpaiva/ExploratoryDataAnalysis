## 1- Loading data
## 2- Subsetting data
## 3- Building data for plot2
## 4- Nominate columns
## 5- Making plot 2
## 6- Retaining the file

NEI <- readRDS("./exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("./exdata-data-NEI_data/Source_Classification_Code.rds")

baltimore.data <- NEI[NEI$fips == "24510",]
library(plyr)

total.emissions <- ddply(baltimore.data, .(as.character(year)), summarize, total=sum(Emissions))

colnames <- c("year","tons")
colnames(total.emissions) <- colnames

par(ps=12, mar=c(5.1,5.1,4.1,2.1))
barplot(total.emissions$tons,
        col="grey",
        main=expression("Total emissions from PM"[2.5]*" in Baltimore City, MD"),
        xlab="Years",
        ylab=expression("PM"[2.5]*" emitted, in tons"),
        names.arg=total.emissions$year)

dev.copy(png, file = "plot2.png")
dev.off()
