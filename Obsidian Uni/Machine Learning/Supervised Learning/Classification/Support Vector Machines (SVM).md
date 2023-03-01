_Usable for non-linearly separable data, uses **kernel functions** to apply a dimension change in which a linear hyperplane can be found._
![[Pasted image 20230119130921.png]]

Inherently binary, uses optimization rather than greedy search ([[Linear Perceptron]]'s method), and statistical learning -> **function estimation problem**.

# Maximum margin hyperplane
![[Pasted image 20230119192202.png]]
there are infinite hyperplanes that can separate the two classes, but it tries to find the only one that maximizes the margin between the closes datapoints of different class.
[[Linear Perceptron]] instead accepts any hyperplane able to separate classes (the first it finds).

Maximum margin is better for generalization (less overfitting)

## Soft margin
It's quite common that a separating hyperplane cannot be found, so it's acceptable to find one that **almost** separates them.
The "tolerance" for the amount of bad classification permitted is given by the [[Hyperparameter]] "C", which can control the amount of overfitting.
Tunong of C is crucial for SVMs.

# Non-linearly separable data
nonlinearity can be overcome with a **non linear mapping** (a change of basis):
Data is mapped into a new space (*"feature space"*), such that a linear hyperplane can be found.

The mapping requires lot of computations, so standard **kernel functions** are used to reduce complexity.
![[Pasted image 20230119193129.png]]
The overall complexity is data-dependent.

## Conclusions
==SVM are not affected by local minima, but are slow for big amount of data==