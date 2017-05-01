library(ggplot2)
emmissionData <- readRDS("summarySCC_PM25.rds")

type <- readRDS("Source_Classification_Code.rds")

log<-grepl("Comb", type$EI.Sector) & grepl("Coal", type$EI.Sector)
g<- type[log,]

logical<-emmissionData$SCC %in% g$SCC

coalData <- emmissionData[logical,]

ggplot(data=coalData, aes(x=year, y=Emissions)) + geom_bar(stat="identity") + scale_x_discrete(limits = c(1999, 2002, 2005, 2008))
