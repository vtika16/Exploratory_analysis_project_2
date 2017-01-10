##set working directory##
setwd("/Users/vtika/Desktop/R Programming/Exploratory Analysis/Week 4 Assignment/")

##load ggplot2##
library(ggplot2)

##loading datasets##
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEI$year <- factor(NEI$year, levels=c('1999', '2002', '2005', '2008'))

# Baltimore City, Maryland == fips
maryland_onroad <- subset(NEI, fips == 24510 & type == 'ON-ROAD')

# Aggregate
maryland_dataframe <- aggregate(MD.onroad[, 'Emissions'], by=list(MD.onroad$year), sum)
colnames(maryland_dataframe) <- c('year', 'Emissions')

# How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City? 

# Generate the graph in the same directory as the source code
png('plot5.png')

ggplot(data=maryland_dataframe, aes(x=year, y=Emissions))  + geom_bar(stat = "identity") + guides(fill=F) +
  ggtitle('Total Emissions of Motor Vehicle Sources in Baltimore City, Maryland') + 
  ylab(expression('PM'[2.5])) + xlab('Year') + theme(legend.position='none') + 
  geom_text(aes(label=round(Emissions,0), size=1, hjust=0.5, vjust=2))

dev.off()