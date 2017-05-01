library(ggplot2)
emmissionData <- readRDS("summarySCC_PM25.rds")
subdata <- emmissionData$fips == "24510"
subData <- emmissionData[subdata,]

type <- readRDS("Source_Classification_Code.rds")

log<-grepl("Vehicles", type$EI.Sector)
g<- type[log,]

logical<-subData$SCC %in% g$SCC

vehicleData <- subData[logical,]

ggplot(data=vehicleData, aes(x=year, y=Emissions)) + geom_bar(stat="identity") + scale_x_discrete(limits = c(1999, 2002, 2005, 2008))