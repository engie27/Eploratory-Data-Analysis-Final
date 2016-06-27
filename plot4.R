# Plot 4
# Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008? 

# Loading GG Plot
library("ggplot2")

#Read in data files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Subset NEI for Coal Emission Data
CoalRows <- grep('Coal', SCC$EI.Sector)
SCCCoalSubset <- SCC[CoalRows,]
NEICoal <- subset(NEI, NEI$SCC %in% SCCCoalSubset$SCC)

#Aggregate coal emissions
aggregateCoal <- aggregate(Emissions ~ year, NEICoal, sum)

# Create Plot
png('plot4.png', width=480, height=480)
plot(aggregateCoal$year, aggregateCoal$Emissions, type = "l", 
     main = "Total Coal Emissions from 1999 ~ 2008",
     xlab = "Year", ylab = "Emissions")
mtext("Coal emissions have been decreaseing between 1999 and 2008", side = 1, line = 4)

dev.off()
