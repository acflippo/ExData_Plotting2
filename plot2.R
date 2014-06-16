# Exploratory Data - Project 2 - plot 2
# Annie Flippo

# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") 
# from 1999 to 2008? Use the base plotting system to make a plot answering this question.

# Get and read data
source("./ExData_project2.R")

# Subsetting to only Baltimore data
baltimore <- NEI[NEI$fips=="24510",]

f <- factor (baltimore$year)
totalBaltimore <- tapply(baltimore$Emissions, f, sum)

# Make it a data frame
totalBaltimore <- as.data.frame(totalBaltimore)
totalBaltimore <- cbind(row.names(totalBaltimore), totalBaltimore)

colnames(totalBaltimore) <- c("Year", "Emissions")

# Install plyr package if needed - step to install is provided in the commented line below
# install.packages("plyr")
library(plyr)

# Use plyr's round_any() function
y_max <- round_any(max(totalBaltimore$Emission), 1000) + 500
y_range <- range(0, y_max)

png(filename="plot2.png", width=480, height=480, units="px")

barplot(totalBaltimore$Emission, main="Total Emission in Baltimore, MD", 
        xlab="Year", ylab="Emission (in tons)", ylim=y_range, col="red")

dev.off()