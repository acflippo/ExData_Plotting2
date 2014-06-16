# Exploratory Data - Project 2 - plot 4
# Annie Flippo

# Across the United States, how have emissions from coal combustion-related 
# sources changed from 1999–2008?

# Get and read data
source("./ExData_project2.R")

# Get all coal-related SCC Category 
coalIndex <- grep("coal", SCC$Short.Name, ignore.case=TRUE)
coalSCC <- SCC[coalIndex,]

coalNEI <- merge(NEI, coalSCC, by="SCC")
View(coalNEI)

combustionIndex <- grep("combustion", coalNEI$SCC.Level.One, ignore.case=TRUE)
coalCombNEI <- coalNEI[combustionIndex,]

View(coalCombNEI)

sumDF <- aggregate(coalCombNEI$Emissions, 
                   by=list(year=coalCombNEI$year, type=coalCombNEI$SCC.Level.Two), FUN=sum)


colnames(sumDF)[3] <- "Emissions"
View(sumDF)

png(filename="plot4.png", width=640, height=640, units="px")

qplot(year, Emissions/1000, data=sumDF, color=type, 
      geom="line", main="Emissions by Coal Combustion-related Sources", ylab="Emissions (in thousand of tons)")

dev.off()
