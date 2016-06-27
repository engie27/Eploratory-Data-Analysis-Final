# Plot 5
# How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

# Loading GG Plot
library("ggplot2")

#Read in data files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Subset NEI for Vehicle Emission Data
VehicleRows <- grep('Vehicle', SCC$EI.Sector)
SCCVehSubset <- SCC[VehicleRows,]
NEIVeh <- subset(NEI, NEI$SCC %in% SCCVehSubset$SCC)
BaltNEIVeh <- subset(NEIVeh, fips == '24510')

#Aggregating total vehicle emissions across all years
aggVehEmissions <- aggregate(Emissions ~ year, BaltNEIVeh, sum)

# Plot
png('plot5.png', width=480, height=480)
plot(aggVehEmissions$year, aggVehEmissions$Emissions, type = "l", 
     main = "Total Vehicle Emissions in Baltimore from 1999 ~ 2008",
     xlab = "Year", ylab = "Emissions")

mtext("Vehicle Emissions in Baltimore have been declining between 1999 and 2008", side = 1, line = 4)

dev.off()
