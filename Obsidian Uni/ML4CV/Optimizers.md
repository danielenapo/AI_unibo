# Stochastic Gradient Descent
Stochastic Gradient Descent (SGD)
$$\theta^{*}=argmin_{\theta \in \Theta} \sum_{i}L(\theta,(x^{i}, y^i)) $$
1) Randomly shuffles the dataset
2) **Forward pass**: processes B  (_mini-batch_ size) examples simultaneously. (if B=1, we get "online" SGD that processes one datapoint at a time)
3) **Backward pass**: computes gradient
4) **Step**: updates parameters 

Larger batches provide smoother estimations, and better exploits parallel hardware (as a rule of thumb for the batchsize: start with largest power of 2 that fits in the GPU vram).

![[Pasted image 20230928111516.png | 300]]
![[Pasted image 20230928111525.png |300]]

SGD can easily process "spheres", but has a harder time with "canyons", since it is forced to use small learning rates, otherwise it would overshoot the minimum:
![[Pasted image 20230928111620.png| 300]]
# Momentum
One solution might be using **second order methods** like Newton's method:
Fits a paraboloid at each point of the function using 2nd derivatives, using it as a _rescaling factor_ for the first derivative.
![[Pasted image 20230928111943.png]]
