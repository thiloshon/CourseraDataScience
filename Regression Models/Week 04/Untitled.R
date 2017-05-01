library(MASS)
data<-shuttle
?shuttle
data$useBinary<- (data$use=="auto")*1
data
useBinary

fit<-glm(useBinary~wind, family = "binomial", data=data)

cf<-exp(fit$coefficients)

cf

cf[1]/cf[2]
summary(fit)


?glm



#------------------------------------------------------

cars<-mtcars
cars
?cars
?mtcars

fit<-glm(am~mpg, family =  "binomial", data=cars)
fit






