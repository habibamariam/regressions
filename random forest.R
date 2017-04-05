#random frest regression
dataset= read.csv('Position_Salaries.csv')
dataset=dataset[2:3]

#library(caTools)
#set.seed(123)
#split=sample.split(dataset$Profit,SplitRatio=0.8)
#training_set=subset(dataset,split==TRUE)
#test_set=subset(dataset,split==FALSE)



#fitting polynomial regression to the dataset

#create the regresor here
set.seed(1234)
regressor=randomForest(x=dataset[1],
                       y=dataset$Salary,
                       ntree = 500)

#prediction with polynmial reg model

y_pred=predict(regressor,data.frame(Level=6.5))




#visualising the random forest regression modellibrary(ggplot2) with smooth curves
x_grid=seq(min(dataset$Level),max(dataset$Level),0.001)
ggplot()+
  geom_point(aes(x=dataset$Level,y=dataset$Salary),color='red')+
  geom_line(aes(x=x_grid,y=predict(regressor,newdata = data.frame(Level=x_grid))),color='blue')+
  ggtitle('truth or bluff(random forest regressiom)')+
  xlab('Level')+
  ylab('salary')