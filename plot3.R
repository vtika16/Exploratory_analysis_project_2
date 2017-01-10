##set working directory##
setwd("/Users/vtika/Desktop/R Programming/Exploratory Analysis/Week 4 Assignment/")

##get ggplot2##
library(ggplot2)

##loading datasets##

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Sampling the dataset
NEI_sampling <- NEI[sample(nrow(NEI), size=5000, replace=F), ]

# Baltimore City, Maryland == fips
maryland <- subset(NEI, fips == 24510)
maryland$year <- factor(MD$year, levels=c('1999', '2002', '2005', '2008'))

# Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
# which of these four sources have seen decreases in emissions from 1999-2008 for Baltimore City? 
# Which have seen increases in emissions from 1999-2008? 
# Use the ggplot2 plotting system to make a plot answer this question.

# Generate the graph in the same directory as the source code
png(filename='plot3.png', width=800, height=500, units='px')

ggplot(data=maryland, aes(x = year, y = log(Emissions))) + facet_grid(. ~ type) + guides(fill=F) +
  geom_boxplot(aes(fill=type)) + stat_boxplot(geom ='errorbar') +
  ylab(expression(paste('Log', ' of PM'[2.5], ' Emissions'))) + xlab('Year') + 
  ggtitle('Emissions per Type in Baltimore City, Maryland') +
  geom_jitter(alpha=0.10)

dev.off()