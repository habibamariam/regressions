# -*- coding: utf-8 -*-
"""
Created on Tue Mar  7 13:40:42 2017

@author: Habiba
"""

import numpy as np
import matplotlib.pyplot as plt
import pandas as pd


dataset=pd.read_csv('Position_Salaries.csv')
X=dataset.iloc[:,1:2].values
y=dataset.iloc[:,2].values              

"""#splitting dataset into training and data set
from sklearn.cross_validation import train_test_split
X_train,X_test,y_train,y_test=train_test_split(X,y,test_size=0.2,random_state=0)"""

#feature scaling
"""from sklearn.preprocessing import StandardScaler
sc_X=StandardScaler()
X_train=sc_X.fit_transform(X_train)
X_test=sc_X.transform(X_test)"""
#linear regression model
from sklearn.linear_model import LinearRegression
lin_reg=LinearRegression()
lin_reg.fit(X,y)

#fitting polynomial regression
from sklearn.preprocessing import PolynomialFeatures
poly_reg=PolynomialFeatures(degree=4)
X_poly=poly_reg.fit_transform(X)

lin_reg_2=LinearRegression()
lin_reg_2.fit(X_poly,y)

#visualize the results
plt.scatter(X,y,color='red')
plt.plot(X,lin_reg.predict(X),color='blue')
plt.title('regression graph(linear)')
plt.xlabel('position level')
plt.ylabel('salary')
plt.show()
#visualise the polynomial regression
X_grid=np.arange(min(X),max(X),0.1)
X_grid=X_grid.reshape(len(X_grid),1)
plt.scatter(X,y,color='red')
plt.plot(X_grid,lin_reg_2.predict(poly_reg.fit_transform(X_grid)),color='blue')
plt.title('regression graph(polynomial)')
plt.xlabel('position level')
plt.ylabel('salary')
plt.show()

#predicting the result with linear regresion
lin_reg.predict(6.5)

#predicting the result with polynomial regresion
lin_reg_2.predict(poly_reg.fit_transform(6.5))
