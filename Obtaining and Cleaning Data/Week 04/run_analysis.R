# following are simple file readings
trainData <- read.table("train/X_train.txt")
testData <- read.table("test/X_test.txt")
testLabel<- read.table("test/Y_test.txt")
trainLabel<- read.table("train/Y_train.txt")
trainSubject<- read.table("train/subject_train.txt")
testSubject<- read.table("test/subject_test.txt")
features<- read.table("features.txt")

#mearging datasets
testTemp<- cbind(testSubject,testLabel)
testFinal<- cbind(testTemp,test)
trainTemp<- cbind(trainSubject,trainLabel)
trainFinal<- cbind(trainTemp,train)
finalDataSet<- rbind(trainFinal,testFinal)

# Giving menaingful coloumn names
featureVector<- as.vector(features[,2])
featureVector<- append(featureVector, "Subject", after=0)
featureVector<-append(featureVector, "Task", after=1)
colnames(finalDataSet)<- featureVector

#extracting measurements on mean only
meanData<- finalDataSet[grepl("mean", colnames(finalDataSet))]

#giving meaningful variable names
finalDataSet$Task<-as.character(finalDataSet$Task)
finalDataSet$Task[finalDataSet$Task == "1"] <- "WALKING"
finalDataSet$Task[finalDataSet$Task == "2"] <- "WALKING_UPSTAIRS"
finalDataSet$Task[finalDataSet$Task == "3"] <- "WALKING_DOWNSTAIRS"
finalDataSet$Task[finalDataSet$Task == "4"] <- "SITTING"
finalDataSet$Task[finalDataSet$Task == "5"] <- "STANDING"
finalDataSet$Task[finalDataSet$Task == "6"] <- "LAYING"

#splitting to different Subject+Activity combinations
answerList <- split(finalDataSet, list(finalDataSet$Subject, finalDataSet$Task))

#calculating average of each combination
now<- lapply(answerList, function(df) colMeans(as.data.frame(df)[,3:563]))

#converting list to a dataframe
answerDataFrame<- as.data.frame(now)

#final file writting
write.table(answerDataFrame, file = "foo.txt")

#End of Code


# Dump Codes
#answerDataFrame <- data.frame( check.names = FALSE)