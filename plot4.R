# Q4: Across the United States, how have emissions from coal combustion-related
# sources changed from 1999-2008?
library(dplyr)
library(ggplot2)

#Load data
if(!exists("NEI")){
  NEI <- readRDS("summarySCC_PM25.rds")
}
if(!exists("SCC")){
  SCC <- readRDS("Source_Classification_Code.rds")
}

# Merge the two data sets 
if(!exists("NS")){
  NS<-inner_join(NEI, SCC, by = "SCC", copy = FALSE)
}

# Find the coal combustion data by searching for "coal" and "comb" separately.
coal_index<-which(grepl("Coal", NS$EI.Sector, ignore.case = TRUE))
comb_index<-which(grepl("comb", NS$EI.Sector, ignore.case = TRUE))
# we want the unique values, ie, rows that contain both coal and comb
# That will result in any row where EI.Sector is one of the three below:
# [1] Fuel Comb - Electric Generation - Coal
# [2] Fuel Comb - Industrial Boilers, ICEs - Coal
# [3] Fuel Comb - Comm/Institutional - Coal
coal_comb_index<-unique(coal_index,comb_index)


# Use this index to find the subset matching the SCC codes
NS_subset<-NS[coal_comb_index,]
# SCC_codes

# Now filter the NEI data 
NS_CC<-
  group_by(NS_subset,year) %>%
  summarize(total = sum(Emissions))
NS_CC

#Plot results
png(file = "plot4.png")
barplot(names.arg=NS_CC$year,height=NS_CC$total/1000, xlab="Year",ylab="Total PM2.5 Emissions (kilotons)",
  main="PM2.5 Emissions in the US from Coal Combustion by Year")
dev.off()
