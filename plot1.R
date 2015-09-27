# Q1: Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
# Using the base plotting system, make a plot showing the total PM2.5 emission from all 
# sources for each of the years 1999, 2002, 2005, and 2008.
library(dplyr)

#Load data
if(!exists("NEI")){
  NEI <- readRDS("summarySCC_PM25.rds")
}
#Group by year and sum total Emissions
NEI2<-
  group_by(NEI,year) %>%
  summarize(total = sum(Emissions))

png(file = "plot1.png")
barplot(names.arg=NEI2$year,height=NEI2$total/1000000, xlab="Year",ylab="Total PM2.5 Emissions (Megatons)",main="PM2.5 Emissions in the US by Year")
dev.off()
