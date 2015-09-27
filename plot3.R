# Q3:Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable,
# which of these four sources have seen decreases in emissions from 1999-2008 for Baltimore City?
# Which have seen increases in emissions from 1999-2008? Use the ggplot2 plotting system to make a plot
# answer this question.
library(dplyr)
library(ggplot2)

#Load data
if(!exists("NEI")){
  NEI <- readRDS("summarySCC_PM25.rds")
}
#Group by year and source, filter by Baltimore and sum total Emissions
NEI2<-
  group_by(NEI,year,type) %>%
  filter(fips == "24510") %>%
  summarize(total = sum(Emissions))

png(file = "plot3.png", width = 640, height = 480)
g<-qplot(year,total, data = NEI2,facets=.~type)
g <- g + geom_line() +
  xlab("Year") +
  ylab("Total PM2.5 Emissions tons") +
  ggtitle("PM2.5 Emissions in Baltimore by Source")
print(g)
dev.off()
