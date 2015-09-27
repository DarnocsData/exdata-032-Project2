# Q5: How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City? 
library(dplyr)
library(ggplot2)

#Load data
if(!exists("NEI")){
  NEI <- readRDS("summarySCC_PM25.rds")
}

#Motor vehicles sources are where NEI$type=="ON-ROAD"
NEI_subset<-NEI[NEI$type=="ON-ROAD",]

#Now filter the NEI data by Baltimore (fips == "24510")
NS_Baltimore<-
  group_by(NEI_subset,year) %>%
  filter(fips == "24510") %>%
  summarize(total = sum(Emissions))
NS_Baltimore

png(file = "plot5.png")
barplot(names.arg=NS_Baltimore$year,height=NS_Baltimore$total, xlab="Year",ylab="Total PM2.5 Emissions (tons)",
        main="PM2.5 Emissions in Baltimore from Motor Vehicles by Year")
dev.off()
