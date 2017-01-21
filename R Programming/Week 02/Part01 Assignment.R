#
# what the heck
# i know right
pollutantmean <- function(directory, pollutant="sulfate", id=1:332){
    matr<- matrix( )
    numberOfRecords <-0
    totalSum<- 0
    for(i in id){
        if(i<10){
            h<-paste(directory,"/00",i,".csv", sep="")
        }else if(i<100){
            h<-paste(directory,"/0",i,".csv", sep="")
        }else{
            h<-paste(directory,"/",i,".csv", sep="")
        }
        print(h)
        
        j<- read.csv(h)
        print(j)
        
        
        if(pollutant=="sulfate"){
            #j<- j[,2:3]
            
            y<- j[complete.cases(j[,2:2]),]
            print(y)
            records<- colSums(y[,2:4],na.rm = TRUE)[1]
            
        }else {
            #j<- j[,3:4]
            print(i)
            
            y<- j[complete.cases(j[,3:3]),]
            records<- colSums(y[,2:4],na.rm = TRUE)[2]
            print(y)
            print(colMeans(y[,2:4]))
        }
        
        numberOfRecords<-numberOfRecords+nrow(y)
        totalSum<- totalSum+records
        
        
        #print(j)
        #mean<- colMeans(j,na.rm = TRUE)
        #matr[i,1]<-mean[1]
        #matr<-rbind(matr,j)
        #print(mean[2])
        #print(i)
    }
    #matr<- matr[,2:3]
    #colMeans(matr,na.rm = TRUE)
    #matr
    print("doneaa")
    totalSum/numberOfRecords
    
}