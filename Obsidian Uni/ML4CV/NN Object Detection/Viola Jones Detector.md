_Enabled real-time face detection (although it could be generalized) in 2001, and has been used on smartphones to make fast inference. It is **very fast** and requires low computational effort._
- [[#Boosting]] for fast detection
- [[#Cascade]] method to reject background patches
- [[#Integral images]] to fast compute the rectangular features
![Viola jones computerphile](https://www.youtube.com/watch?v=uEJ71VlUmMQ)

## Boosting
Uses [[AdaBoost]] to train many **weak learners** (high biased), and combines them to obtain a low-biased **strong learner** that performs better than any weak one.
It is a **summing** [[Ensemble]] method to reduce bias.
Agorithm steps:
1) given N training samples, initialize weights $w^{i}$ for each of them
2)  for j=1,...,M weak learners:
	1) fit $WL_{j}$ to the weighted training data
	2) compute weighted error rate $$\epsilon_{j}=\sum\limits_{i:x^{i}missclassified}w^{i}$$
	3) compute $\beta_{j}=\frac{1-\epsilon_{j}}{\epsilon_{j}}$ 
	4) Update weights for wrongly classified examples: $w^{i}=w^{i}\beta_{j}$   
	5) re-normalize $w^{i}$ to rum to one
3) compute strong classifier as:
$$SL(x)=\sum\limits_{j=1}^{M}ln(\beta_{j})WL_{j}(x)>0$$
![[Pasted image 20231024130837.png]]
## Haar-like features
In the case of images, weak learners are  rectangular filters, made of 2, 3 or 4 rectangles applied at a fixed position in a 24x24 patch.
![[Pasted image 20231024131448.png]]
The weak learners are defined as such:
![[Pasted image 20231024131712.png]]
Where $s_{j}$ defines the sign of the inequality, $f_{j}$ is the value returned by the filter, and $\rho_{j}$ is the threshold.

There are over 160k possible filters to apply, thus [[AdaBoost]] selects a small subset of the most effective ones. 
![[Pasted image 20231024131625.png]]
## Integral images
_To speed up the computation of rectangular features_
Creates a new matrix where the element $x_{i}^{j}$ is the sum of all the pixels before it
![[Pasted image 20231024142103.png]]
Formally:$$II(i,j)=\sum\limits_{i'\le i, j' \le j} I(i,j)$$
![[Pasted image 20231024142338.png]]

## Multi-scale sliding windows
The strong classifier (of 24x24 size) is applied to all locations of the image.
Also not all faces will appear in the same size, so **multi-scale detection is achieved by scaling the detector** and sliding it again on the image.
![[Pasted image 20231024142615.png]]
## Cascade
There are still too many windows in an image to reach real-time detection.
Most of the windows are useless, since they are background, but they could easily be detected as such and discarded by using simple and fast classifiers.
![[Pasted image 20231024142729.png]]
A cascade of gradually complex classifiers is used, and if only one of the chain classifies the window as background, it is automatically discarded, so heavier computation is likely to occur only on the patches that actually contain a face (which are very few in the whole image).

## Box overlap
since the windows slide by one pixel, the same face will be detected by multiple windows, giving rise to several overlapping detections.
We can measure the **Intersection over Union (IoU)** aka Jaccard score:
$$IoU(BB_{i}, BB_{j}) = \frac{intersection\space area}{union \space area}$$
![[Pasted image 20231024151622.png | 300]]
Usually, each box is associated with a **confidence score** (says how confident the model think it's a face).
To obtain a single detection for multiple bounding boxes of the same face, we apply [[Non-Maxima Suppression (NMS)]] for boxes:
1) Consider the highest scoring BB
2) eliminate all the other boxes with $IoU>threshold$
3) Repeat until all boxes have been tested
![[Pasted image 20231024151926.png |300]]
(Limitation: if two distinct faces very close to each other have an high IoU score, only one will be kept)

## Evaluation
IoU score is also used for evaluation, by checking how the predicted BB overlap with the real (ground truth) BB.

- If $IoU(BB_{i},BB_{j}^{GT})>\rho_{IoU}$ (threshold), the found BB is a **True Positive (TP)**
- Otherwise it's a **False Positive (FP)**

The possible metrics are Precision and Recall (standard [[Classifier Evaluation]] metric).
We could influence those numbers by changing the threshold of minimum confidence to accept a detection:
- high threshold=high precision
- low threshold=high recall
![[Pasted image 20231024152626.png]]

### Average Precision (AP)
We can actually evaluate the detector across all possible precision/recall regimes **without changing the threshold**, by sorting predictions according to their score, and obtaining a **precision-recall curve**:
![[Pasted image 20231024152939.png]]
The **Average Precision (AP)** is the area under curve.
### mAP
For multiple classes. we can compute a **mean AP (mAP)** across classes, that gives a global indication of the model's performance.
![[Pasted image 20231024153145.png]]
# Paper
![[viola-cvpr-01.pdf]]
