# Plot 3
# Of the four types of sources indicated by the 𝚝𝚢𝚙𝚎 (point, nonpoint, onroad, nonroad) variable, 
#  which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? 
#  Which have seen increases in emissions from 1999–2008? 

# Loading GG Plot
library("ggplot2")

#Read in data files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Subset baltimore
balitmore <- subset(NEI, fips == '24510')

#Aggregate total emissions for Baltimore City across all years and by different types
baltimoreEmissions <- aggregate(Emissions ~ year + type, baltimore, sum)

#Load GG Plot
library("ggplot2")

#Create Plot 
png('plot3.png', width=480, height=480)

plot3 <- ggplot(baltimoreEmissions, aes(x=year, y=Emissions, color=type)) +
    geom_point(alpha=.3) +
    geom_smooth(alpha=.2, size=1, method="loess") +
    ylab(expression('Total PM2.5 Emissions')) +
    ggtitle("Total Emissions by Type in Baltimore")
       
print(plot3)

dev.off()