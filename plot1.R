##set working directory##
setwd("/Users/vtika/Desktop/R Programming/Exploratory Analysis/Week 4 Assignment/")

##loading datasets##

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

##get sample dataset##

NEI_sample <- NEI[sample(nrow(NEI), size = 2000, replace = F), ]

##aggregate data and round##
emissions <- aggregate(NEI[, 'Emissions'], by = list(NEI$year), FUN = sum)

emissions$PM <- round(emissions[,2]/1000, 2)

# Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
# Using the base plotting system, make a plot showing the total PM2.5 emission from all sources 
# for each of the years 1999, 2002, 2005, and 2008.##

##generate base plot and png file##
png(filename = 'plot1.png')

barplot(emissions$PM, names.arg = emissions$Group.1,
        main = expression('Total Emission of PM'[2.5]),
        xlab = 'Year', ylab = expression(paste('PM', ''[2.5], ' in Kilotons')))

dev.off()

write.csv()