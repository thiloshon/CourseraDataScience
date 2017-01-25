best<- function(state, outcomeType){
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
    
    new<- order(ysf[,2],ysf[,1])
    ysf[new[1],][,1]
    
    
    #ysf[which.min(ysf[,2]),][,1]
    
    
    
    #print(valuese)
    #which.min(temp[[asdf]]$State)
    
    
}