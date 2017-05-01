library(ggplot2)
emmissionData <- readRDS("summarySCC_PM25.rds")

plotting <- aggregate(emmissionData$Emissions ~ emmissionData$year, emmissionData, sum)
barplot(plotting$`emmissionData$Emissions`, names.arg = c("1999", "2002","2005","2008"))
title(main = "Total emissions from PM2.5", xlab = "Years", ylab = "Total Emissions")
