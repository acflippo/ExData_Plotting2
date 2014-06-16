# Exploratory Data - Project 2 - plot 3
# Annie Flippo

# Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
# which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? 
# Which have seen increases in emissions from 1999–2008? Use ggplot2 to answer the questions.

# Get and read data
source("./ExData_project2.R")

# Install ggplot2 if it doesn't exist
# install.packages("ggplot2")
library(ggplot2)

# Subsetting to only Baltimore data
baltimore <- NEI[NEI$fips=="24510",]

View(baltimore)

# Create a factor of unique type 
typeCategory <- factor(unique(baltimore$type))

# Create a factor of unique year
yearCategory <- factor(unique(baltimore$year))

sumDF <- aggregate(baltimore$Emissions, by=list(year=baltimore$year, type=baltimore$type), FUN=sum)

#colnames(sumDF)
colnames(sumDF)[3] <- "Emissions"

#View(sumDF)

png(filename="plot3.png", width=640, height=640, units="px")

qplot(year, Emissions, data=sumDF, facets = .~type, geom="path",
      main="Baltimore Emissions by Type")

dev.off()