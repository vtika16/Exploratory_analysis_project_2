##set working directory##
setwd("/Users/vtika/Desktop/R Programming/Exploratory Analysis/Week 4 Assignment/")

##loading datasets##

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

##sample dataset##

NEI_sampling <- NEI[sample(nrow(NEI), size=5000, replace=F), ]

##subsetting for Maryland##  
maryland <- subset(NEI, fips = '24510')

##Aggregate dataset##
maryland_aggregate <- aggregate(Emissions ~ year, maryland, sum)

##create png file and plot##

png(filename = "plot2.png")

barplot(height = maryland_aggregate$Emissions, 
        names.arg = maryland_aggregate$year, 
        xlab = "years", 
        ylab = expression('total PM'[2.5]*' emission'),
        main=expression('Total PM'[2.5]*' in the Baltimore City, MD emissions at various years'))


dev.off()

