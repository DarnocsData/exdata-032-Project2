
This repo contains code and plots for Project 2 of the Exploratory Data Analysis course.
The overall goal of this assignment is to explore the National Emissions Inventory database and see what it say about fine particulate matter pollution in the United states over the 10-year period 1999–2008. You may use any R package you want to support your analysis.

Questions

You must address the following questions and tasks in your exploratory analysis. For each question/task you will need to make a single plot. Unless specified, you can use any plotting system in R to make your plot.

1. Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.
Ans: Yes emissions have decreased. See plot1.png

2. Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? Use the base plotting system to make a plot answering this question.
Ans: Yes emissions have decreased in Baltimore City. See plot2.png

3. Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to make a plot answer this question.
Ans: non-road and on-road emmisions have decreased. See plot3.png

4. Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?
Ans: Emissions have decreased. See plot4.png

5. How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?
Ans: Emissions have decreased. See plot5.png

6. Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (fips == "06037"). Which city has seen greater changes over time in motor vehicle emissions?
Ans: Emissions in Baltimore have decreased. Emissions in LA County are relatively unchanged. See plot4.png