corr <- function(directory, threshold=0){
    ans<-vector()
    timer<-1;
    for(i in 1:332){
        
        if(i<10){
            h<-paste(directory,"/00",i,".csv", sep="")
        }else if(i<100){
            h<-paste(directory,"/0",i,".csv", sep="")
        }else{
            h<-paste(directory,"/",i,".csv", sep="")
        }
        
        j<- read.csv(h)
        
        y<- j[complete.cases(j[,2:3]),]
        
        records<- nrow(y)
        
        if(records>threshold){
            val<- cor(y[2],y[3])
            ans[timer]<-val
            timer<-timer+1
            
        }
        
    }
    
    print(head(ans))
    print(summary(ans))
    ans
    
}