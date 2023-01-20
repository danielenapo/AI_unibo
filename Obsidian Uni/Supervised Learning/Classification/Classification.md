_GOAL: assign input data to predefined categories or classes (discrete)._
At the end, a **classification** model is obtained. 

Given a dataset X in which the class labels y(x) are unknown, the model finds them combining x with parameters $\theta$.
M(x, $\theta$)= y(x)
So the model M is **parametrized**, and ==the learning process consists on finding the parameters,== to reduce the prediction error as much as possible

## Workflow
1. Learning the model from a train dataset (fitting the model)
2. Estimating accuracy with a test dataset ([[Model Evaluation]])
3. Label new individuals 

### "flavours" of classification
- CRISP -> assign only one label 
- PROBABILISTIC -> assign a probability for each possible label

## Methods
- [[Decision Trees]]
- [[Naive Bayes]]
- [[KNN]]
- [[Linear Perceptron]]
- [[Support Vector Machines (SVM)]]

on top of those, [[Ensamble methods]] can be used to increase the performance of the models.

## Comparison
comparison is made with 3 different dataset (some are linearly separable, others not). Ensamble methods (like random forest) are more eccurate than their base version
![[Pasted image 20230120160934.png]]