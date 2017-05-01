library(ggplot2)
emmissionData <- readRDS("summarySCC_PM25.rds")
subdata <-  emmissionData$fips == "24510" | emmissionData$fips == "06037" 
subData <- emmissionData[subdata,]

type <- readRDS("Source_Classification_Code.rds")

log<-grepl("Vehicles", type$EI.Sector)
g<- type[log,]

logical<-subData$SCC %in% g$SCC

vehicleData <- subData[logical,]

temp<-aggregate(subData$Emissions, list(subData$year, subData$fips), sum)

ggplot(temp, aes(x=Group.1, y=x, color=Group.2, group = Group.2))+geom_point() + geom_line()+labs(title = "Total emissions from PM2.5 in Baltimore City (24510)\n and Los Angeles County (06037) for motor vehicles") + xlab("Year") + scale_x_discrete(limits = c(1999, 2002, 2005, 2008))+ ylab("Total Emissions")


