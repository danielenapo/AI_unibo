Backpropagation is the automatic differentiation algorithm used in [[Neural Network]]s, used to compute the gradient of the loss function in the most efficient way.

To compute the backpropagation, it's best to think in terms of computational graphs:
![[Pasted image 20231215162156.png]]

We need to compute the derivative of the output (f) with respect to the inputs

To do this we can use the chain rule:
![[Pasted image 20231215162411.png]]

## Jacobian
For vectorized data, the derivatives is no longer a scalar but a matrix: the Jacobian.
![[Pasted image 20231215163937.png]]