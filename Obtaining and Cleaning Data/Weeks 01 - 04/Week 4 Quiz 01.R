test<- function(val1, val2, type){
    
    sdf<- 0
    for(i in 1:190){
        #aprint(x[i,1])
        #which()
        
        #print(which(val1[,1]==val2[i,1]&val2[,10]=="Lower middle income"))
        print(which(val1[,1]==val2[i,1]&grepl("June", val2[i,10])))
        #print(grepl("June", val2[i,10]))
        #c.*\Bcat\B.*
    }
    
    sdf
}