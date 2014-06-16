# Exploratory Data - Project 2 - plot 1
# Annie Flippo

# Have total emissions from PM2.5 decreased in the United States 
# from 1999 to 2008? Using the base plotting system, make a plot 
# showing the total PM2.5 emission from all sources for each of 
# the years 1999, 2002, 2005, and 2008

# Get and read data
source("./ExData_project2.R")

f <- factor (NEI$year)
totalEmission <- tapply(NEI$Emissions, f, sum)

# This returns an array with the Year as row.names
class(totalEmission)

# Make it a data frame
totalEmission <- as.data.frame(totalEmission)
totalEmission <- cbind(row.names(totalEmission), totalEmission)

colnames(totalEmission) <- c("Year", "Emissions")
colnames(totalEmission)

# Find y-axis range to the nearest integer
y_range <- range(0, ceiling( max(totalEmission$Emission/1000000) ))

png(filename="plot1.png", width=480, height=480, units="px")

barplot(totalEmission$Emission/1000000, main="Total Emission by Year", 
        xlab="Year", ylab="Emission (in millions of tons)", ylim=y_range, col="blue")

dev.off()