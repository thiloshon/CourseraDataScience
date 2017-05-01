testing <- read.csv("pml-testing.csv")
training <- read.csv("pml-training.csv")
train
summary(train)
str(train)
str(test)

inTrain <- createDataPartition(y=training$classe, p=0.70, list=FALSE)
train  <- training[inTrain,]
test  <- training[-inTrain,]


library(caret)
?featurePlot
featurePlot(train, train$classe)

trainSansZeroVar <- train[, -c(nearZeroVar(train))]


trainSansZeroVar$classeNumeric<-as.numeric(trainSansZeroVar$classe)


correlation <-cor(trainSansZeroVar[,c(6:99)] ,trainSansZeroVar$classeNumeric)
tr<-trainSansZeroVar[,c(6:99)]

tr<-tr[,which(!is.na(correlation) )]


#tr$classe<-trainSansZeroVar$classe
rf<-train(tr,trainSansZeroVar$classe, method="rf", preProcess="pca")

test2<-test[,c(colnames(tr))]

predictions <- predict(rf, newdata=tr)
confusion_matrix <- confusionMatrix(predictions, trainSansZeroVar$classe)
confusion_matrix

predictions <- predict(rf, newdata=test2)
predictions
test2<-test[,c(colnames(tr))]

confusion_matrix <- confusionMatrix(predictions, test$classe)
confusion_matrix

testing2<-testing[,c(colnames(tr))]
predictions <- predict(rf, newdata=testing2)
predictions


results <- data.frame(pred = predict(randomForest, test.sub),
                      obs = test$classe)

p <- ggplot(results, aes(x = pred, y = obs))
p <- p + geom_jitter(position = position_jitter(width = 0.25, height = 0.25))
p


