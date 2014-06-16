# Exploratory Data - Project 2 - plot 6
# Annie Flippo

# Compare emissions from motor vehicle sources in Baltimore City with emissions 
# from motor vehicle sources in Los Angeles County, California (fips == "06037"). 
# Which city has seen greater changes over time in motor vehicle emissions?

# Get and read data
source("./ExData_project2.R")

# Subsetting to Baltimore (fips=24510) and Los Angeles (fips=06037)
cities <- NEI[NEI$fips %in% c("24510","06037"), ]
cityEmission <- merge(cities, SCC, by="SCC")
vehicleIndex <- grep("vehicle", cityEmission$SCC.Level.Two, ignore.case=TRUE)
vehicleEmissions <- cityEmission[vehicleIndex, ] 

# Baltimore Vehicle Emission
bEmission <- vehicleEmissions[vehicleEmissions$fips=="24510",]
f <- factor (bEmission$year)
baltimoreEmission <- tapply(bEmission$Emissions, f, sum)

# Los Angeles vehicle emission
laEmission <- vehicleEmissions[vehicleEmissions$fips=="06037",]
f <- factor (laEmission$year)
laEmission <- tapply(laEmission$Emissions, f, sum)

# Combine result for plotting
sumEmission <- rbind(baltimoreEmission, laEmission)
row.names(sumEmission) <- c("Baltimore", "Los Angeles")

# Install plyr package if needed - step to install is provided in the commented line below
# install.packages("plyr")
library(plyr)
y_range <- range(0, round_any(max(sumEmission)+550, 1000))

plot.new()
png(filename="plot6.png", width=640, height=640, units="px")

barplot(sumEmission, legend.text = c("Baltimore", "Los Angeles"), 
        ylim=y_range, beside=TRUE, xlab="Year", ylab="Emission (in tons)",
        col=c("blue","dark green"), args.legend = list(x = "topleft"),
        main="Vehicle Emission by City"
)

dev.off()

## Note: The side-by-side barplot required a special matrix
## with the column headings to be the year (x-axis), and
## the row.names to be the City as the categories
## Output of the sumEmission matrix

#               1999      2002      2005      2008
#Baltimore    403.77  192.0078  185.4144  138.2402
#Los Angeles 6109.69 7188.6802 7304.1149 6421.0170
