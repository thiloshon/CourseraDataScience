library(ggplot2)
emmissionData <- readRDS("summarySCC_PM25.rds")

subdata <- emmissionData$fips == "24510"
subData <- emmissionData[subdata,]

plotting <- aggregate(subData$Emissions ~ subData$year, subData, sum)

barplot(plotting$`subData$Emissions`, names.arg = c("1999", "2002","2005","2008"))
title(main = "Total emissions from PM2.5 in Baltimore City, \nMaryland", xlab = "Years", ylab = "Total Emissions")
