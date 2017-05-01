library(ggplot2)
emmissionData <- readRDS("summarySCC_PM25.rds")
subdata <- emmissionData$fips == "24510"
subData <- emmissionData[subdata,]

temp<-aggregate(subData$Emissions, list(subData$year, subData$type), sum)

ggplot(temp, aes(temp$Group.1, temp$x, color=temp$Group.2, group = temp$Group.2))+geom_point() + geom_line()+labs(title = "Total emissions from PM2.5 in Baltimore City") + xlab("Year") + scale_x_discrete(limits = c(1999, 2002, 2005, 2008))+ ylab("Total Emissions")
