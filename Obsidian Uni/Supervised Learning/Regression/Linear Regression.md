_Computes the response vector (y) as a linear combination of data (x), with the ai ìm of minimizing an **objective function**._
![[Pasted image 20230120162244.png]]
$y_{i} = w^{T}\times x_{i},  \forall i \in [1 ... N]$
w is the D-dimensional vector to be learned (coefficient vector).

# Error estimation
## Mean Squared Error (MSE)
Could be defined in different way, but we often use the **mean squared error**:
![[Pasted image 20230120163319.png]]
![[Pasted image 20230120163340.png]]
using the **normal equation method**, if $X^{T}X$ is invertible, w can be obtained as:
![[Pasted image 20230120163536.png]]
(But it can also be found with Gradient Descent or SGD).
also if $X^{T}X$ is not invertible, it could be solved with moore-penrose's pseudo-inverse matrix, or **Lasso** regularization.

## $R^{2}$
Quality of the fitting ([[Model Evaluation]]) can be measured by the R squared method:
![[Pasted image 20230120164111.png]]
Compares the fit of the model with a horizoltal straight line (similarly on how [[Probabilities of classes#Lift chart]] works).
With perfect fitting, $R^{2}=1$. If it's bad, $R^{2}<0$.