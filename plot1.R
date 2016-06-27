# Plot 1
#Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 

#Read in data files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Aggregate total emissions across all years
aggEmissions <- aggregate(Emissions ~ year, NEI, sum)

#Plot
png('plot1.png', width=480, height=480)
plot(aggEmissions$year, aggEmissions$Emissions, type = "l", 
     main = "Total PM2.5 Emissions from 1999 ~ 2008",
     xlab = "Year", ylab = "Emissions")
mtext("Aggregate emissions have gone down between 1999 and 2008", side = 1, line = 4)

dev.off()