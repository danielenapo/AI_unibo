- built on top of [[ResNet]] -> **Backbone**
- [[R-CNN#Feature Pyramid Network (FPN)]] -> **Neck**
- Classification and regression are composed of two independent stacks of 3x3 convolution (don't share weights) -> **2 Heads**
![[Pasted image 20231109125219.png]]

### Class imbalance
Object detection is an **imbalanced problem**: the number of negatives far outweight the positives, this can cause two problems:
1. easy negatives (clearly background) can overwhelm training and lead to models that can't distinguish positive and negative patches.
2. training is inefficient as m most locations are easy negatives, that have no meaningful contributions

Two stage classifiers solve this problem by only training on top-scoring proposal (similarly to cascades in [[Viola Jones Detector]]).

One stage detector randomly sample anchors, thus a mini-batch will contain mostly easy negatives.

SOLUTION: 
1) **Hard negative mining**: 
- Negative anchors are sorted by classification loss
- NMS is applied, thus only the top ones are used in the mini-batch (3:1 ratio wrt positive ones)
2) **Work at the loss level**
	A new loss based on the standard Binary Crossentropy is used, called **Focal Loss**.

## Focal loss
Standard Cross Entropy loss has a modest value even when samples are correctly classified. When summed over lots of examples of negative class, those small losses can overwhelm the hard negatives.
To **down-weight the easy negatives**, the binary focal loss is defined as:
$$BFL(p_{t})=-(1-p_{t})^{\gamma}\cdot ln(p_{t})$$
where $p_{t}$ is the probability of true class:
$p_t= p$ if y=1, $p_{t}=(1-p)$ otherwise. p is the probability assigned by the model to have label y=1.
The exponent $\gamma$ is a tunable **"focusing"** [[Hyperparameter]] (usually $\gamma=2$).
![[Pasted image 20231109160413.png]]
As we can see for BCE (which is BFC with $\gamma=0$), even when $p_t=0.8$ (very good result), the loss is >0, while for BFC with $\gamma=2$, the loss is zero. 
FL is always smaller than CE if $\gamma>0$, but the difference between easy and hard samples is magnified according to their difficulty.

We can also take into account **class weights** (in case some classes are under represented in the dataset):
In the binary case, given a weight $\alpha \in [0,1]$ for the positive class, $1-\alpha$ for the negative, we simply multiply it to the previous BFL formula:
$$WBFL(p_{t})=-\alpha_{t}\cdot(1-p_{t})^{\gamma}\cdot ln(p_{t})$$
- Class weight balances the relative importance of errors **between** the positive/negative class
- ==Focal loss lets the training focus on hard examples **within each class.**==

## RetinaNet Loss
If we have to predict multiple classes, the prediction **for each box** can have from 1 to C classes, **not assumed to be mutually exclusive**.
The label head doesn't use softmax with C outputs, rather **C independent sigmoids** (the sum of the class values is >1).

For this reason, the classification loss for the j-th box in the i-th image is a **sum of C weighted binary focal losses**:
$$L_{cls}(s^{i,j},y^{i,j})=\sum\limits_{k=1}^{C} WBFL(\sigma(s_{k}^{i,j}),y_{k}^{i,j})$$
For the final loss, it's summed with the regression loss (for bb correction), and it's computed for **all the anchors in the image**:
$$L(\theta;x^{i})=\sum\limits_{j=1}^{A} L_{cls}(s^{i,j},y^{i,j}) + \lambda I[y^{i,j}\neq0]SmoothL1(\hat t^{i,j}-t^{i,j})$$
# Limitations
1. Anchors are a **brute force approach** to detection (enumerating all possible boxes), very **inefficient**
2. Obtain a lot of duplicates for a single instance (need to apply [[Non-Maxima Suppression (NMS)]] post processing)
3. Assignment of anchors to ground truth is based on manally selected threshold and hand-crafted rules

_The natural successor of RetinaNet that solves this issue is the [[CenterNet]]._