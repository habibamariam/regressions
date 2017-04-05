#sVR
dataset= read.csv('Position_Salaries.csv')
dataset=dataset[2:3]

#library(caTools)
#set.seed(123)
#split=sample.split(dataset$Profit,SplitRatio=0.8)
#training_set=subset(dataset,split==TRUE)
#test_set=subset(dataset,split==FALSE)



#fitting SVR to the dataset

regressor =svm(formula=Salary~.,
           data=dataset,
           type='eps-regression')

#prediction with polynmial reg model

y_pred=predict(regressor,data.frame(Level=6.5))

#visualising the regression modellibrary(ggplot2)
ggplot()+
  geom_point(aes(x=dataset$Level,y=dataset$Salary),color='red')+
  geom_line(aes(x=dataset$Level,y=predict(regressor,newdata = dataset)),color='blue')+
  ggtitle('truth or bluff(SVR model)')+
  xlab('Level')+
  ylab('salary')


#visualising the regression modellibrary(ggplot2) with smooth curves
x_grid=seq(min(dataset$Level),max(dataset$Level),0.1)
ggplot()+
  geom_point(aes(x=dataset$Level,y=dataset$Salary),color='red')+
  geom_line(aes(x=x_grid,y=predict(regressor,newdata = data.frame((level=x_grid)))),color='blue')+
  ggtitle('truth or bluff(reg model)')+
  xlab('Level')+
  ylab('salary')

