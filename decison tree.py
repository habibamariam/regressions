# -*- coding: utf-8 -*-
"""
Created on Wed Mar  8 23:02:59 2017

@author: Habiba
"""

# -*- coding: utf-8
#SVR
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
sc_y=StandardScaler()
X=sc_X.fit_transform(X)
y=sc_y.fit_transform(y)"""

#fitting  decisoin tree regression to data set

from sklearn.tree import DecisionTreeRegressor
regressor=DecisionTreeRegressor(random_state=0)
regressor.fit(X,y)



#predicting the result with polynomial regresion
y_pred=regressor.predict(6.5)

#visualise the SVR results
"""plt.scatter(X,y,color='red')
plt.plot(X,regressor.predict(X),color='blue')
plt.title('regression decision tree')
plt.xlabel('position level')
plt.ylabel('salary')
plt.show()"""

X_grid = np.arange(min(X), max(X), 0.01)
X_grid = X_grid.reshape((len(X_grid), 1))
plt.scatter(X, y, color = 'red')
plt.plot(X_grid, regressor.predict(X_grid), color = 'blue')
plt.title('Truth or Bluff (decision tree Regression Model)')
plt.xlabel('Position level')
plt.ylabel('Salary')
plt.show()
