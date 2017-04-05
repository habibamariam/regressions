# -*- coding: utf-8 -*-
"""
Created on Wed Mar  8 14:23:35 2017

@author: Habiba
"""

# -*- coding: utf-8 -*-
"""
Created on Tue Mar  7 22:46:42 2017

@author: Habiba
"""

# -*- coding: utf-8 -*-
"""
Created on Tue Mar  7 13:40:42 2017

@author: Habiba
"""
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
from sklearn.preprocessing import StandardScaler
sc_X=StandardScaler()
sc_y=StandardScaler()
X=sc_X.fit_transform(X)
y=sc_y.fit_transform(y)

#fitting  SVR to data set
from sklearn.svm import SVR
regressor=SVR(kernel='rbf')
regressor.fit(X,y)

#predicting the result with polynomial regresion
y_pred=sc_y.inverse_transform(regressor.predict(sc_X.transform(np.array([[6.5]]))))

#visualise the SVR results
plt.scatter(X,y,color='red')
plt.plot(X,regressor.predict(X),color='blue')
plt.title('regression graph(SVR)')
plt.xlabel('position level')
plt.ylabel('salary')
plt.show()
