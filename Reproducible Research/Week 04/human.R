library(ggplot2)
stormData <- read.csv("stormData.csv.bz2")
stormData$EVTYPE <- as.character(stormData$EVTYPE)
strData <- stormData[, c(8, 23)]

set <- aggregate(strData$FATALITIES, list(strData$EVTYPE), sum)
val <- set[order(set$x, decreasing = TRUE),]
val <- val[1:10,]

library(gridExtra)

p1 <- ggplot(val) +
    geom_point(aes(y = val$x, x = val$Group.1), color = "Red") +
    theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
    labs(title = "Top 10 deadliest events in terms of human fatalities") +
    xlab("Event") +
    ylab("Fatalities")

# the injuries data


strData2 <- stormData[, c(8, 24)]
set2 <- aggregate(strData2$INJURIES, list(strData$EVTYPE), sum)
val2 <- set2[order(set2$x, decreasing = TRUE),]
val2 <- val2[1:10,]

p2 <- ggplot(val) +
    geom_point(aes(y = val2$x, x = val2$Group.1), color = "Blue") +
    theme(axis.text.x = element_text(angle = 90, hjust = 1)) + 
    xlab("Event") +
    ylab("Injuries")+ 
    labs(title = "Top 10 deadliest events in terms of human injuries")



grid.arrange(p1, p2, ncol = 2)

#+ geom_point(aes(y = val$x, x = val$Group.1, color="Blue")) +