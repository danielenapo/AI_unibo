_Any modification to the training recipe that is intended to reduce test error, but not the training error._

# Parameter norm penalties
Implicitly adding a term to the loss, in order to prefer a "simpler" model (lower the capacity).
![[Pasted image 20231002140526.png]]
Even if we have a high capacity model by construction (e.g. a linear regression with high degree), the $L_2$ regularization makes it behave as it has a lower one (e.g. lower degree), providing a better fit for the test set.
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
A dropout mask is built at each minibatch of example and applied to the network. In this way, hidden units need to perform well regardless of which ones are in the model, making the whole net more general, and to rely less on specific features.
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
Randomly change the intensity of all pixels by a multiplicative factor

### Multi-scale testing (enable)
Only at test scale: rescale at fixed scales and average results
1) pick an array of scale values Q
2) resize a test image in all those scales (short side)
3) compute scores over classes for each scale
4) average predictions
This is actually an [[Ensemble]], since it does not affect train, but benefits the final prediction.
### FixRes
Different resolutions between test set and train set improve performance. More precisely, a higher resolution train set is better (but costly)

### Cutout
Remove a random square region from an input of trainset.
It's like [[#Dropout]], but for images (since dropping random pixels has no effect, we need to drop contiguous regions).
Allows the CNN to disentangle information and make predictions based on multiple features (improving generalization).
![[Pasted image 20231006110622.png]]
### Mixup
Randomly blending some images of different classes together with a linear interpolation, with a random coefficient based on a PDF $\beta$.
![[Pasted image 20231006110743.png]]
Also the labels are blended following the coefficient.
In this way, the network learns smoother boundaries between classes, looking at data in the image space that could not exist in reality, but that benefit classification.
### CutMix
blends together [[#Cutout]] and [[#Mixup]], by randomly putting small patches of an image on another one (different classes).
![[Pasted image 20231006110953.png]]
Improves generalization.

# Ensembles
[[Ensemble]]s are proven to be effective in [[Machine Learning]], since adding many similar models together and averaging their results, the single small errors get averaged out.
1) Train multiple (randomly initialized) models on the same dataset
2) Run each model over a test image and average the results
This approach is very costly though, and can only bring 1/2% improvements. There are ways to approximate this process:
### Snapshot ensembling
using a cyclic [[Learning Rate]] schedule, we can simulate M trainings in the span of one.
![[Pasted image 20231006111421.png]]
### Distillation or Teacher-student
Instead of training multiple full-sized networks, we can train only one and "distill" its knowledge into a smaller model.
![[Pasted image 20231006111612.png]]
### Exponential moving average (EMA)
Snapshot in weight space: storing a vector of parameters to use at test time, with an exponential moving average at each step:
$\theta^{test}=(1-\rho)\theta^{(i+1)}+\rho \theta^{test}$, where $\rho \in [0,1]$
# Double descent
![[Pasted image 20231006112628.png]]

