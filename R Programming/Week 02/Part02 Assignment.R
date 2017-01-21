complete <- function(directory, id=1:332){
    matr<- data.frame(directory=0, value=0)
    for(i in id){
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
        #print(records)
        
        matr<- rbind(matr, c(i,records))
        
    }
    
    matr
}