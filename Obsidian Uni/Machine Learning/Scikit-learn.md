#python
It's a Python library for [[Machine Learning]] and data analysis. 

## workflow
Most commonly, the steps in using the Scikit-Learn estimator API are as follows
1. Choose a class of model by importing the appropriate estimator class from Scikit-Learn.
2. Choose model [[Hyperparameter]]s by instantiating this class with desired values.
	- or in the first attempt use the default values
1. Arrange data into a features matrix and target vector following the discussion above.
2. Fit the model to your data by calling the ``fit()`` method of the model instance.
3. Apply the Model to new data:
	- For supervised learning, often we predict labels for unknown data using the ``predict()`` method.
	- For unsupervised learning, we often transform or infer properties of the data using the ``transform()`` or ``predict()`` method.

## Useful python stuff
for [[Hyperparameter#Tuning]], in particolar when using cross validation and parameter grids, it's essential to remember this equivalence in Python:
![[Pasted image 20230125194141.png]]
It's in fact possible to pass a dictionary of type {"nameOfParameter":value} as kwargs in a function.
This is very useful when cross-validating different parameters combinations
