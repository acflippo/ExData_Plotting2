## Exploratory Data - Project 2
## Annie Flippo

setwd(".")

# If datafile doesn't exist, download and unzip it
if (!file.exists("~/Dropbox/Coursera_ExploratoryData/Proj2/summarySCC_PM25.rds")) {
        # Download data zip file if it doesn't exist
        
        fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
        download.file(fileUrl, destfile = c("~/Dropbox/Coursera_ExploratoryData/Proj2/exdata-data-NEI_data.zip"), method = "curl")        
       
        unzip ("~/Dropbox/Coursera_ExploratoryData/Proj2/exdata-data-NEI_data.zip")
}

# Data Frame
## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("~/Dropbox/Coursera_ExploratoryData/Proj2/summarySCC_PM25.rds")
SCC <- readRDS("~/Dropbox/Coursera_ExploratoryData/Proj2/Source_Classification_Code.rds")

