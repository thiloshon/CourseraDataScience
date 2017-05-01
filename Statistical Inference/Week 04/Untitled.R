mns = NULL
for (i in 1 : 1000) mns = c(mns, mean(runif(40)))
mns
hist(mns)


expmns = NULL
rexp(40,0.2)
for (i in 1 : 1000) expmns = c(expmns, mean(rexp(40,0.2)))
expmns
hist(expmns)

one<-NULL
for (i in 1 : 1000) one = c(one, mean(rexp(40,0.2)))

two<-NULL
for (i in 1 : 1000) two = c(two, rexp(40,0.2))

hist(one)
hist(two)
g <- ggplot(as.data.frame(two), aes(x = two))
g <- g + geom_histogram(fill = "salmon", aes(y = ..density..), colour = "black") 
g <- g  + geom_vline(xintercept = mean(two), colour = "blue")
g <- g + geom_density(size = 2)

g

g <- ggplot(as.data.frame(expmns), aes(x = expmns))
g <- g + geom_histogram(fill = "salmon", aes(y = ..density..), colour = "black") 
g <- g + geom_vline(xintercept = 5, colour="red")+ geom_vline(xintercept = mean(expmns), colour = "blue")
g <- g + geom_density(size = 2)

g

mean(expmns)
var(expmns)

n<- 1000
means <-cumsum(rexp(n,0.2))/(1:n)
library(ggplot2)
g <- ggplot(data.frame(x = 1:n, y = means), aes(x = x, y = y)) 
g <- g + geom_hline(yintercept = 0) + geom_line(size = 2)
g <- g + labs(x = "Number of obs", y = "Cumulative mean")
g

varience<- 25
mean<-5

grid<-NULL
for (i in 1 : 1000) grid = c(grid, (mean(rexp(40,0.2))-mean)/sqrt(varience/40))

ggplot(grid)+geom_histogram()

g <- ggplot(data.frame(x = 1:n, y = grid), aes(x = x, y = y)) 
g <- g + geom_hline(yintercept = 0) + geom_line(size = 2)
g <- g + labs(x = "Number of obs", y = "Cumulative mean")
g

g <- ggplot(as.data.frame(grid), aes(x = grid))
g <- g + geom_histogram(fill = "salmon",
                        binwidth=1, aes(y = ..density..), colour = "black") 
g <- g + geom_density(size = 2)
g <- g + geom_vline(xintercept = mu, size = 2)
g

mean(rexp(40,0.2)) - 5


f<-ToothGrowth

t.test( f$len[31:60],f$len[1:30],paired = F)
t.test(f$len ~ supp, paired = F, var.equal=F, data=as.data.frame(f))

mean(f$len) + c(-1,1) * qnorm(0.975) * sd(f$len)/sqrt(length(f$len)) 
mean(f$len)
library(ggplot2)
ggplot(f,aes(supp,len))+facet_grid(.~dose)+geom_boxplot(aes(fill = supp))
qplot(supp,len,data=f, facets=~dose, main="Tooth growth of guinea pigs by supplement type and dosage (mg)",xlab="Supplement type", ylab="Tooth length") + geom_boxplot(aes(fill = supp))


OJData<- f[f$supp=="OJ",]
VCData<- f[f$supp=="VC",]
t.test(OJData$len , VCData$len, alternative = "greater", paired = FALSE, conf.level = 0.95)
f[f$supp=="OJ",]


OJData<- f[f$dose==0.5,]
VCData<- f[f$dose==2,,]
t.test(VCData$len , OJData$len, alternative = "greater", paired = FALSE, conf.level = 0.95)
f[f$supp=="OJ",]





