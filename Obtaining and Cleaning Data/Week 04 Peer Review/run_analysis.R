testDataSet <- read.table("test/X_test.txt")
trainDataSet <- read.table("train/X_train.txt")

if(length(testDataSet[1,])==length(trainDataSet[1,])){
    masterDataSet <- rbind(testDataSet,trainDataSet)
}
