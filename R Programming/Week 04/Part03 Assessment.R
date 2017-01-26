rankall<- function(outcomeType, num="best"){
    outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    
    stateList<- levels(as.factor(outcome[,7]))
    
    types<-c("heart attack", "heart failure", "pneumonia")
    
    if(!outcomeType %in% types){
        stop("invalid outcome")
    }
    
    outcome[, 11] <- as.numeric(outcome[, 11])
    outcome[, 17] <- as.numeric(outcome[, 17])
    outcome[, 23] <- as.numeric(outcome[, 23])
    
    if(outcomeType=="heart attack") val<-11
    if(outcomeType=="heart failure") val<-17
    if(outcomeType=="pneumonia") val<-23
    
    temp <- split(outcome, outcome$State)
    
    #ysf<-temp[[state]][,c(2,val,7)]
    
    now <- lapply(temp, function(fdf) fdf[c(7, val,2)])
    
    if(num=="best") tempnum<- 1
    else if(num=="worst") tempnum<- 1
    else tempnum = num
    
    
    tempnum<-as.numeric(tempnum)
    
    answer <- data.frame(state=0, hospital=0)
    
    lapply(now, function(ads){
        
        if(nrow(ads)<tempnum){
            return(NA)
        }
        
        ysdf<- ads[complete.cases(ads),]
        
        #print(ysdf)
        
        new<- order(ysdf[,2],ysdf[,3])
        
        if(num=="best") num<- 1
        if(num=="worst") num<- length(new)
        num<-as.numeric(num)
        
        #print(ysdf[new[num],])
        
        # print("okay")
        # print(ysdf[new[num],][,1])
        # print("Done")
        # print(ysdf[new[num],][,3])
        # print("All")
        
        print(c(ysdf[new[num],][,1],ysdf[new[num],][,3]))
        
        
        # answer<- rbind(answer, num)
        # answer<- rbind(answer, c(ysdf[new[num],][,2],ysdf[new[num],][,3]))
        
    })
    
    #print(ysf)
    answer   
    
    
}