_An [[Hyperparameter]] used to govern the **pace** at which an algorithm updates or learns the values of a parameter estimate_
The learning rate factor (lr) in the [[Optimizers#Stochastic Gradient Descent]] formula can either be fixed or dynamic.
# per-parameter adaptive
Based on the values of single parameters, we can reach faster convergence by automatically
- **reducing** the lr for dimension whose gradient is large
- **increasing** the lr for dimensions whose gradient is small

## AdaGrad
_Adaptive Gradient rescales each entry with the inverse history of its squared values_
$$s^{(t+1)}=s^{t}+ \nabla L(\theta^{t}) \odot \nabla L(\theta^{t}) $$
The $\odot$ represents **element-wise** product, thus $s^{(t+1)}$ sums to $s^{t}$ the squared values of the loss's gradient.
Then the parameter update formula applies the adaptive lr as follows:
$$\theta^{(t+1)}=\theta^{t}-\frac{lr}{\sqrt{s^{t+1}+\epsilon}}\odot \nabla L(\theta ^{t})$$
- parameters with small updates have their lr increased
- parameters with large updates have their lr decreased

However, $s^{t}$ is monotonically increasing overall (might reduce all learning rates too early when we're still far from optimum).

## RMSProp
Modifies [[#AdaGrad]], introducing a parameter $\beta \in [0,1]$ to govern the decay of $s^{t}$ through an exponential moving average (like [[Optimizers#Momentum]]).
$$s^{(t+1)}=\beta s^{t}+ (1-\beta) \nabla L(\theta^{t}) \odot \nabla L(\theta^{t})$$
(tipically $\beta \ge 0.9$)

## ADAM
Extends [[#RMSProp]] to also keep a running average of gradients (basically adding [[Optimizers#Momentum]]), introducing:
$$g^{debiased,t}=\frac{g^{(t+1)}}{1-\beta_{1}^{t+1}}$$
$$s^{debiased,t}=\frac{s^{(t+1)}}{1-\beta_{2}^{t+1}}$$
Thus making the parameter update like this:
$$\theta^{(t+1)}=\theta^{t}-\frac{lr}{\sqrt{s^{debiased}+\epsilon}}\odot g^{debiased}$$
ADAM is smoother and faster than the previous:
![[Pasted image 20230928210727.png]]


