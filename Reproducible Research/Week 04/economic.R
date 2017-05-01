stormData <- read.csv("stormData.csv")
stormData$EVTYPE <- as.character(stormData$EVTYPE)
strData <- stormData[, c(8, 25:30)]

strData$PROPDMGEXP<-as.factor(toupper(strData$PROPDMGEXP))
strData$CROPDMGEXP<-as.factor(toupper(strData$CROPDMGEXP))

# index <- c("","0","2","?", "H", "K", "M", "B")
# values <- c(1,1,1,1,100, 1000, 1000000, 1000000000)
# strData$compensation <- values[match(strData$PROPDMGEXP, index)]
# strData$compensationCrop <- values[match(strData$CROPDMGEXP, index)]



index <- c("","+", "-", "0", "1", "2", "3", "4", "5", "6", "7", "8", "?", "H", "K", "M", "B")
values <- c(1,1,1,1,1,1,1,1,1,1,1,1,1,100, 1000, 1000000, 1000000000)
strData$compensation <- values[match(strData$PROPDMGEXP, index)]
strData$compensationCrop <- values[match(strData$CROPDMGEXP, index)]

strData$propertyDamage<- strData$PROPDMG*strData$compensation
strData$cropDamage<- strData$CROPDMG*strData$compensationCrop

set <- aggregate(strData$propertyDamage, list(strData$EVTYPE), sum)
val <- set[order(set$x, decreasing = TRUE),]
val <- val[1:10,]
p3<- ggplot(val) + 
    geom_point(aes(y = x, x = Group.1)) + 
    theme(axis.text.x = element_text(angle = 90, hjust = 1))

# the injuries data 

set2 <- aggregate(strData$cropDamage, list(strData$EVTYPE), sum)
val <- set2[order(set2$x, decreasing = TRUE),]
val <- val[1:10,]
ggplot(val) + 
    geom_point(aes(y = x, x = Group.1)) + 
    theme(axis.text.x = element_text(angle = 90, hjust = 1))
