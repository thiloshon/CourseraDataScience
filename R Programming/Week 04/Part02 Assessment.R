rankhospital<- function(state, outcomeType, num="best"){
    outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    
    stateList<- levels(as.factor(outcome[,7]))
    
    if(!state %in% stateList){
        stop("invalid state")
    }
    
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
    
    ysf<-temp[[state]][,c(2,val)]
    
    #print(ysf)
    
    if(num=="best") tempnum<- 1
    else if(num=="worst") tempnum<- nrow(ysf)
    else tempnum = num
    
    
    tempnum<-as.numeric(tempnum)
    
    if(nrow(ysf)<tempnum){
        return(NA)
    }
    
    ysdf<- ysf[complete.cases(ysf),]
    
    #print(ysf)
    
    new<- order(ysdf[,2],ysdf[,1])
    #print(new)
    
    
    #print(nrow(new))
    #print(nrow(new))
    #print(num)
    
    if(num=="best") num<- 1
    if(num=="worst") num<- length(new)
    num<-as.numeric(num)
    
    #print(num)
    
    if( num > length(new) ) return(NA)
    
    #print(new[num])
    
    #ysf
    
    ysdf[new[num],][,1]
    
    
    
}







