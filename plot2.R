# Q2: Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510")
# from 1999 to 2008? Use the base plotting system to make a plot answering this question. 
library(dplyr)

#Load data
if(!exists("NEI")){
  NEI <- readRDS("summarySCC_PM25.rds")
}
#Group by year, filter by Baltimore and sum total Emissions
NEI2<-
  group_by(NEI,year) %>%
  filter(fips == "24510") %>%
  summarize(total = sum(Emissions))

png(file = "plot2.png")
barplot(names.arg=NEI2$year,height=NEI2$total/1000, xlab="Year",ylab="Total PM2.5 Emissions (kilotons)",main="PM2.5 Emissions in Baltimore by Year")
dev.off()
