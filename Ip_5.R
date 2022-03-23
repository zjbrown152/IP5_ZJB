#Read in csv file
data=read.csv('Self Awareness Dataset.csv')
data$X <- NULL
data$X.1 <- NULL
data$X.2 <- NULL
data$ï..Date <- NULL
# Missing Values?
colSums(is.na(data))
#install.packages('caTools')
set.seed(123)

#Split set
split=sample.split(data$End.of.the.day.Feeling..0.to.10., SplitRatio = .17)
training_set=subset(data, split==FALSE)
testing_set=subset(data, split==TRUE)

#Fit it
regressor<-lm(formula = End.of.the.day.Feeling..0.to.10.~.,data = training_set)
summary(regressor)

#Validation Predictions
new<-data.frame(Day='Thursday', Sleep.Hour=6, Exercise.Hour= 2, Study.Hour=1,StudyDS.Hour=0, Work.Hour=0)
predict(regressor, new)

new1<-data.frame(Day='Monday', Sleep.Hour=6, Exercise.Hour=0, Study.Hour=1, StudyDS.Hour=0, Work.Hour=6)
predict(regressor, new1)

new2<-data.frame(Day='Tuesday', Sleep.Hour=7, Exercise.Hour=1, Study.Hour=4, StudyDS.Hour=1, Work.Hour=6)
predict(regressor, new2)

new3<-data.frame(Day='Wednesday', Sleep.Hour=7, Exercise.Hour=2, Study.Hour=1, StudyDS.Hour=1, Work.Hour=6)
predict(regressor, new3)

new4<-data.frame(Day='Thursday', Sleep.Hour=6, Exercise.Hour=0, Study.Hour=1, StudyDS.Hour=1, Work.Hour=6)
predict(regressor, new4)

summary(regressor)
#All of the independent variables had a p-value over .05 except for the "DayThursday" variable. 
#This means  that we can say all of the variables except that principle are not statisically significant.
#The r2 score is .1673, which is almost 0 so we can say that this is not a very good regression model.

