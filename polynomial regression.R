dataset= read.csv('Position_Salaries.csv')
dataset=dataset[2:3]

#library(caTools)
#set.seed(123)
#split=sample.split(dataset$Profit,SplitRatio=0.8)
#training_set=subset(dataset,split==TRUE)
#test_set=subset(dataset,split==FALSE)


#fitting linear regression to the dataset

lin_reg=lm(formula=Salary~.,
           data = dataset)
#fitting polynomial regression to the dataset
dataset$Level2=dataset$Level^2
dataset$Level3=dataset$Level^3
dataset$Level4=dataset$Level^4
poly_reg=lm(formula=Salary~.,
            data=dataset)
#visualising the linear reg model
ggplot()+
  geom_point(aes(x=dataset$Level,y=dataset$Salary),color='red')+
  geom_line(aes(x=dataset$Level,y=predict(lin_reg,newdata = dataset)),color='blue')+
  ggtitle('truth or bluff(linear regression)')+
  xlab('Level')+
  ylab('salary')
#visualising the polynomial reg modellibrary(ggplot2)
ggplot()+
  geom_point(aes(x=dataset$Level,y=dataset$Salary),color='red')+
  geom_line(aes(x=dataset$Level,y=predict(poly_reg,newdata = dataset)),color='blue')+
  ggtitle('truth or bluff(linear regression)')+
  xlab('Level')+
  ylab('salary')

#predicting the salary with linear reg model


y_pred=predict(lin_reg,data.frame(Level=6.5))

#prediction with polynmial reg model
y_pred=predict(poly_reg,data.frame(Level=6.5,Level2=6.5^2,Level3=6.5^3,Level4=6.5^4))

