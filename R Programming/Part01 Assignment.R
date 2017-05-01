pollutantmean <- function(directory, pollutant="sulfate", id=1:332){
    matr<- matrix( )
    for(i in id){
        if(i<10){
            h<-paste(directory,"/00",i,".csv", sep="")
        }else if(i<100){
            h<-paste(directory,"/0",i,".csv", sep="")
        }else{
            h<-paste(directory,"/",i,".csv", sep="")
        }
        
        j<- read.csv(h)
        # if(pollutant=="sulfate"){
        #     j<- j[,2:3]
        # }else {
        #     j<- j[,3:4]
        # }
        
        #print(j)
        #mean<- colMeans(j,na.rm = TRUE)
        #matr[i,1]<-mean[1]
        matr<-rbind(matr,j)
        #print(mean[2])
        #print(i)
    }
    matr<- matr[,2:3]
    colMeans(matr,na.rm = TRUE)
    #matr
    
}