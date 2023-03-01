_When the relationship cannot be described by a straight line. _
![[Pasted image 20230120170221.png]]

the function becomes
$y=w_{0}+w_{1}x+w_{2}x^{2}+ ... +w_{D}x^{D}$
It's often used Vandermore matrix to represent this equation as a matrix multiplication:
$y=w^{T} \times Vandermore(x, k)$
Where k i the degree of the polynomial equation.

# Fitting
polynomial regression is prone to:
- **Underfitting** -> if k is not high enough to correctly fit the data
![[Pasted image 20230120171140.png]]
- **Overfitting** -> when k is way too high, so the model fits too much on the training data, being uncapable of generalizing with new data
![[Pasted image 20230120171302.png]]
- **good fitting** -> since K is a [[Hyperparameter]], a "sweet spot" value needs to be found
![[Pasted image 20230120171613.png]]