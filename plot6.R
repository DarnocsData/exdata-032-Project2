# Q6: Compare emissions from motor vehicle sources in Baltimore City with emissions from motor
#vehicle sources in Los Angeles County, California (fips == "06037"). Which city has seen greater
#changes over time in motor vehicle emissions?
library(dplyr)
library(ggplot2)
library(tidyr)

#Load data
if(!exists("NEI")){
  NEI <- readRDS("summarySCC_PM25.rds")
}

#Motor vehicles sources are where NEI$type=="ON-ROAD"
NEI_subset<-NEI[NEI$type=="ON-ROAD",]

#Now filter the NEI data by Baltimore (fips == "24510") and LA County (fips == "06037")
NEI_Both<-
  group_by(NEI_subset,year,fips) %>%
  filter(fips == "24510" | fips == "06037") %>%
  summarize(total = sum(Emissions))
#Find the mean for both
NEI_Both2<-
  group_by(NEI_Both,fips) %>%
  summarize(mean=mean(total)) 
#Copy mean to NEI_Both dataframe
NEI_Both$Mean<-rep(NEI_Both2$mean,4)
#Calculate the % Anomaly
NEI_Both<-mutate(NEI_Both,Anomaly=(total-Mean)/Mean*100)
#Select desired columns (no longer need 'mean' column )
NEI_Both<-select(NEI_Both,year,fips,total,Anomaly)
#Rename columns
colnames(NEI_Both)<-c("Year","Location","Total","% Anomaly from Mean")
#Rename fips with proper names
NEI_Both$Location[NEI_Both$Location=="06037"]<-rep("LA County",4)
NEI_Both$Location[NEI_Both$Location=="24510"]<-rep("Baltimore",4)
#Melt data from Total and Anomaly columns into one column
NEI_Both<-gather(NEI_Both,variable,value,-Year,-Location)

#plot Totals and Anomalies on separate chart, on top of each other
png(file = "plot6.png",width = 480, height = 640)
g<-qplot(Year,value, data = NEI_Both)+facet_grid(variable~.,scales="free_y")
g<-g+ geom_point(aes(col=Location))
g <- g + geom_line(aes(col=Location)) +
  xlab("Year") +
  ylab("Total PM2.5 Emissions (tons)") +
  ggtitle("PM2.5 Emissions in Baltimore and LA County by Year\nTop Chart: Total Emissions\nBottom Chart: % Anomaly from Mean Value")
print(g)
dev.off()

