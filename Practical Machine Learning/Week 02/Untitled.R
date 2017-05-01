install.packages("AppliedPredictiveModeling")
library(AppliedPredictiveModeling)
data(AlzheimerDisease)
predictors
diagnosis

library(AppliedPredictiveModeling)
data(concrete)
install.packages("caret")
library(caret)
set.seed(1000)
inTrain = createDataPartition(mixtures$CompressiveStrength, p = 3/4)[[1]]
training = mixtures[ inTrain,]
testing = mixtures[-inTrain,]
training
library(ggplot2)
qplot(CompressiveStrength, )



#--------------------------------------


library(AppliedPredictiveModeling)
data(segmentationOriginal)
library(caret)
s<-segmentationOriginal
names(segmentationOriginal)

inTrain = createDataPartition(segmentationOriginal$Class, p = 0.7, list = F)
training <- segmentationOriginal[ inTrain,]
testing = segmentationOriginal[-inTrain,]
training
set.seed(125)
library(rpart)
gbmFit1 <- train(Class ~ ., data = training, 
                 method = "rpart")

gbmFit1$finalModel

#---------------------------
#

install.packages("pgm")
library(pgmm)
data(olive)
load("olive")
olive

gbmFit1 <- train(Area ~ ., data = olive, 
                method = "rpart")

gbmFit1$finalModel
newdata = as.data.frame(t(colMeans(olive)))
predict(gbmFit1,newdata)



#------------------------------------


install.packages("ElemStatLearn")
library(ElemStatLearn)
library(caret)

data(vowel.train)

data(vowel.test)
train<-vowel.train
test<-vowel.test
train
train$y<-as.factor(train$y)
train
set.seed(33833)
rf<-train(y~., data=train, method="rf")
rf
rf$results
rf$metric
rf$method
rf$finalModel

gbm<-train(y~., data=train, method="gbm")

gbm
gbm$results
gbm$finalModel

new<-as.data.frame(rf,gbm,train$y)

