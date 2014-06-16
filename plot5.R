# Exploratory Data - Project 2 - plot 5
# Annie Flippo

# How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

# Get and read data
source("./ExData_project2.R")

# Subsetting to only Baltimore data
baltimore <- NEI[NEI$fips=="24510",]

baltimoreEmissions <- merge(baltimore, SCC, by="SCC")

vehicleIndex <- grep("vehicle", baltimoreEmissions$SCC.Level.Two, ignore.case=TRUE)
vehicleEmission <- baltimoreEmissions[vehicleIndex,]

View(vehicleEmission)

sumDF <- aggregate(vehicleEmission$Emissions, 
                   by=list(Year=vehicleEmission$year), FUN=sum)
colnames(sumDF)[2] <- "Emissions"

y_range = range(0, max(sumDF$Emission))

png(filename="plot5.png", width=480, height=480, units="px")

plot(sumDF$Year, sumDF$Emission, type="b", main="Vehicle Emission in Baltimore", 
     xlab="Year", ylab="Emission (in tons)", ylim=y_range, col="dark red")
points(sumDF, pch=19, col="dark red")

dev.off()

