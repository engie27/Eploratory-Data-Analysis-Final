# Plot 2
#Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (𝚏𝚒𝚙𝚜 == "𝟸𝟺𝟻𝟷𝟶") ?

#Read in data files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Subset for Baltimroe Data Only
baltimore <- subset(NEI, fips == '24510')

## Aggregate total emissions for Baltimore City across all years
baltimoreEmissions <- aggregate(Emissions ~ year, baltimore, sum)

# Create Plot 
png('plot2.png', width=480, height=480)
plot(baltimoreEmissions$year, baltimoreEmissions$Emissions, type = "l", 
     main = "Baltimore PM2.5 Emissions from 1999 ~ 2008",
     xlab = "Year", ylab = "Emissions")
mtext("Emissions for Baltimore have gone down overall between 1999 and 2008", side = 1, line = 4)

dev.off()