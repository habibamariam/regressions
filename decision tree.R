#decision tree regresion

dataset= read.csv('Position_Salaries.csv')
dataset=dataset[2:3]

#library(caTools)
#set.seed(123)
#split=sample.split(dataset$Profit,SplitRatio=0.8)
#training_set=subset(dataset,split==TRUE)
#test_set=subset(dataset,split==FALSE)



#fitting decision tree regression to the dataset

regressor = rpart(formula=Salary~.,
                  data=dataset,
                  control = rpart.control(minsplit =1)) 
           

#prediction with polynmial reg model

y_pred=predict(regressor,data.frame(Level=6.5))

#visualising the decision tree regression modellibrary(ggplot2)
"""ggplot()+
  geom_point(aes(x=dataset$Level,y=dataset$Salary),color='red')+
  geom_line(aes(x=dataset$Level,y=predict(regressor,newdata = dataset)),color='blue')+
  ggtitle('truth or bluff(regression decision tree)')+
  xlab('Level')+
  ylab('salary')"""


#visualising the regression modellibrary(ggplot2) with smooth curves
library(ggplot2)
x_grid=seq(min(dataset$Level),max(dataset$Level),0.01)
ggplot()+
  geom_point(aes(x=dataset$Level,y=dataset$Salary),color='red')+
  geom_line(aes(x=x_grid,y=predict(regressor,newdata = data.frame(Level=x_grid))),color='blue')+
  ggtitle('truth or bluff(reg model)')+
  xlab('Level')+
  ylab('salary')


