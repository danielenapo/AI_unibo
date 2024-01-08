[[Neural Network]] are based on the Gradient Descent algorithm to update the parameters by
1) Computing the output with a **forward pass**, and the corresponding **loss** function.
2) Computing the **gradient of the loss** with the analytical Backpropagation algorithm.
3) **Updating all the parameters** according to the gradients.
![[NN_operations.gif]]
# Stochastic Gradient Descent
Stochastic Gradient Descent (SGD)
$$\theta^{*}=argmin_{\theta \in \Theta} \sum_{i}L(\theta,(x^{i}, y^i)) $$
0) Randomly initializes the parameters $\theta^{0}$
1) Randomly shuffles the dataset
for $i=0,...,N-1$: 
	2) **Forward pass**: processes B  (_mini-batch_ size) examples simultaneously. 
	3) **Backward pass**: computes gradient
	4) **Step**: updates parameters 

Larger batches provide smoother estimations, and better exploits parallel hardware (as a rule of thumb for the batchsize: start with largest power of 2 that fits in the GPU vram).

![[Pasted image 20230928111516.png | 300]]
![[Pasted image 20230928111525.png |300]]

SGD can easily process "spheres", but has a harder time with "canyons", since it is forced to use small learning rates, otherwise it would overshoot the minimum:
![[Pasted image 20230928111620.png| 300]]
# Second order methods
One solution might be using **second order methods** like Newton's method:
Fits a paraboloid at each point of the function using 2nd derivatives, using it as a _rescaling factor_ for the first derivative (following the Taylor's expansion)
![[Pasted image 20230928111943.png]]
They can be very effective, and its update formula is: $$-lr \cdot H_{f}^{-1}(x_{t})\nabla f(x_{t})$$Where $H_f$ is the Hessian matrix (contains all 2nd order partial derivatives).
PROBLEM: we have to compute the inverse of H each time we update the parameters, and that's very costly.

# Momentum
Adds a "**velocity**" term ($\upsilon$) to the standard [[#Stochastic Gradient Descent]], and the update formula becomes:
$$\theta^{(t-1)}=\theta^{t}+\upsilon^{(t+1)}$$
where $\upsilon$ is also updated at each step: 
$$\upsilon^{(t+1)}=\mu \upsilon^{t}-lr\cdot \nabla L(\theta^{t})$$
$\mu \in [0,1)$ is the **momentum**, and it's a fixed coefficient.
![[Pasted image 20230928190744.png]]
- reduces noise of SGD (smoother)
- faster convergence
## Nesterov momentum
It's a variant that slightly modifies the $\upsilon$ formula as follows:
$$\upsilon^{(t+1)}=\mu \upsilon^{t}-lr\cdot \nabla L(\theta^{t} + \mu \upsilon^{t})$$
i.e. uses a partially updated $\theta^{t}$ in the loss gradient so it "looks ahead" to compute a more accurate gradient.
It can reach a faster convergence as it skips some steps.

