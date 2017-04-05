#simple linear regression
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

dataset=pd.read_csv('Salary_data.csv')
X=dataset.iloc[:,:-1].values
y=dataset.iloc[:,1].values

#splitting dataset into training and data set
from sklearn.cross_validation import train_test_split
X_train,X_test,y_train,y_test=train_test_split(X,y,test_size=1/3,random_state=0)

#feature scaling
"""from sklearn.preprocessing import StandardScaler
sc_X=StandardScaler()
X_train=sc_X.fit_transform(X_train)
X_test=sc_X.transform(X_test)"""

#fitting the simple linear regression on to this training set#
from sklearn.linear_model import LinearRegression
regressor=LinearRegression()
regressor.fit(X_train,y_train)                 
#predicting the test set observation
y_pred=regressor.predict(X_test)
#visualizing the training set result

plt.scatter(X_train,y_train,color='red')
plt.plot(X_train,regressor.predict(X_train),color='blue')
plt.title('salary vs experience(training set)')
plt.xlabel('year of experience')
plt.ylabel('salary')
plt.show()

#visualizing the test set result

plt.scatter(X_test,y_test,color='red')
plt.plot(X_train,regressor.predict(X_train),color='blue')
plt.title('salary vs experience(Test set)')
plt.xlabel('year of experience')
plt.ylabel('salary')
plt.show()