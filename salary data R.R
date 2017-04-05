#simple linear regression
load("E:/UDEMY COURSE/.RData")
setwd("E:/UDEMY COURSE/Machine Learning A-Z Template Folder/Part 2 - Regression/Section 4 - Simple Linear Regression")

dataset= read.csv('Salary_Data.csv')






library("caTools", lib.loc="C:/Users/Habiba/Anaconda3/R/library")
#spliting the dataset into training and tst set
set.seed(123)
split=sample.split(dataset$Salary,SplitRatio = 2/3)

training_set=subset(dataset,split==TRUE)
test_set=subset(dataset,split==FALSE)
#Feature scaling

#training_set[,2:3]=scale(training_set[,2:3])

#test_set[,2:3]=scale(test_set[,2:3])
#fitting linear regression to the training set
regressor=lm(formula=Salary~YearsExperience,data=training_set)
y_pred=predict(regressor,newdata = test_set)

#visualising the training sets
ggplot()+
  geom_point(aes(x=training_set$YearsExperience,y=training_set$Salary),color='red')+
  geom_line(aes(x=training_set$YearsExperience,y=predict(regressor,newdata = training_set)),color='blue')+
  ggtitle('Salary vs yearsexperience(training set0)')+
  ylab('salary')+
  xlab('yearsexperience')

#visualising the test sets
ggplot()+
  geom_point(aes(x=test_set$YearsExperience,y=test_set$Salary),color='red')+
  geom_line(aes(x=training_set$YearsExperience,y=predict(regressor,newdata = training_set)),color='blue')+
  ggtitle('Salary vs yearsexperience(test set0)')+
  ylab('salary')+
  xlab('yearsexperience')
