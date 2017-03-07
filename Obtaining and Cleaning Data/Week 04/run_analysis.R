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
testFinal<- cbind(testTemp,testData)
trainTemp<- cbind(trainSubject,trainLabel)
trainFinal<- cbind(trainTemp,trainData)
finalDataSet<- rbind(trainFinal,testFinal)

# Giving menaingful coloumn names
featureVector<- as.vector(features[,2])
featureVector<- append(featureVector, "Subject ID", after=0)
featureVector<-append(featureVector, "Activity", after=1)
colnames(finalDataSet)<- featureVector

#giving meaningful variable names
finalDataSet$Activity<-as.character(finalDataSet$Activity)
finalDataSet$Activity[finalDataSet$Activity == "1"] <- "WALKING"
finalDataSet$Activity[finalDataSet$Activity == "2"] <- "WALKING_UPSTAIRS"
finalDataSet$Activity[finalDataSet$Activity == "3"] <- "WALKING_DOWNSTAIRS"
finalDataSet$Activity[finalDataSet$Activity == "4"] <- "SITTING"
finalDataSet$Activity[finalDataSet$Activity == "5"] <- "STANDING"
finalDataSet$Activity[finalDataSet$Activity == "6"] <- "LAYING"

#extracting measurements on mean only
meanData<- finalDataSet[grepl("mean", colnames(finalDataSet)) | grepl("std", colnames(finalDataSet))| grepl("Activity", colnames(finalDataSet))| grepl("Subject ID", colnames(finalDataSet))]

#splitting to different Subject+Activity combinations
#answerList <- split(finalDataSet, list(finalDataSet$Subject, finalDataSet$Task))
answerList <- split(meanData, list(meanData$`Subject ID`, meanData$Activity))

#calculating average of each combination
now<- lapply(answerList, function(df) colMeans(as.data.frame(df)[,3:81]))

#converting list to a dataframe
answerDataFrame<- as.data.frame(now)

#final file writting
write.table(answerDataFrame, file = "foo.txt", row.name=FALSE)

#End of Code


# Dump Codes
#answerDataFrame <- data.frame( check.names = FALSE)