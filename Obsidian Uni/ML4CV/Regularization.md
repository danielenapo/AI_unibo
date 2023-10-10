_Any modification to the training recipe that is intended to reduce test error, but not the training error._

# Parameter norm penalties
Implicitly adding a term to the loss, in order to prefer a "simpler" model (lower the capacity).
![[Pasted image 20231002140526.png]]
Even if we have a high capacity model by construction (e.g a linear regression with high degree), the $L_2$ regularization makes it behave as it has a lower one (e.g. lower degree), providing a better fit for the test set.
### Weight decay
$L_2$ regularization in SGD lowers the weights, since when applying the parameter update formula, we get that
$$\theta^{(i+1)}=\theta^{i}-lr\cdot\nabla_{\theta}[L(\theta^{i}; D^{train})=(1-lr\lambda)+\frac{\lambda}{2}||\theta^{i}||_{2}^{2}]=$$
$$=(1.lr\lambda)\theta^{i}-lr\nabla_{\theta}L(\theta^{i};D^{train})$$
This only applies to SGD. In the case of [[Learning Rate#ADAM]], we have to adapt it in a different way. This variant goes by the name of **AdamW**.
## Early stopping
Also the number of epochs is a hyperparameter:
By stopping the model after n epochs of plateau and keeping the best performing one, we're doing regularization
## Label smoothing
Cross-entropy, a common loss used in [[Image classification]], can never reach the true target label, since its arguments would have to tend to infinity. This can lead to overfitting. We can reduce this issue by allowing the model to fail by a small, uniform noise $\epsilon$.

# Dropout
In each forward pass, randomly drop some activations to zero following a probability p (between 0.2 and 0.5).
A dropout mask is buikt at each minibatch of example and applied to the network. In this way, hidden units need to perform well regardless of which ones are in the model, making the whole net more general, and to rely less on specific features.
It will behave like a special **ensemble** network, where weights are shared.
![[Pasted image 20231002161838.png]]
Scores at train time are computed as:
$$scores=f(x;\theta;m)$$
Where m is the mask.
This is a stochastic process (since m is random). Since we want the test to be deterministic, we have to make a mean of all masked scores:
$$scores=E_m[f(x;\theta;m)]=\sum\limits_{m}=p(m)f(x;\theta;m)$$
This sum greatly slows down the computation.
To approximate, we could sample only a small amount of masks, or doing **weight scaling**, aka **inverted dropout**.

Dropout is usually applied in the fully connected layers, since there are many activations.
## Stochastic depth
Drop probability increases with network depth.
![[Pasted image 20231002163730.png]]
At test time the network is unmodified.

# Data augmentation
Artificially enrich the train set by applying transformations (like rotations, scaling, flipping, ...)  
### Multi-scale training
Random sampling multiple scales by cropping the images, sampling random crops and scales.
1) pick a scale S randomly from a range $[S_{min},S_{max}]$
2) resize image soo that short size=S
3) sample a random small square patch (smaller than the image)
4) Random horizontal flip
5) Random **color augmentation** (aka jittering)
Randomly change the instensity of all pixels by a multiplicative factor
