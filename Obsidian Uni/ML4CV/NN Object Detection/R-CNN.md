# Object Localization
_Simpler task than [[Object detection]], which assumes the presence of only one instance._
It only predicts:
- **One** bounding box
- The **class** of such bounding box

To solve this problem, we can simply take any standard [[Image classification]] network as **backbone network**, and add a **regression head**  that predicts the bounding box, in parallel to the **classification head**.
![[Pasted image 20231025172139.png]]

# Region Proposals
We can apply a classification CNN as a sliding window detector
1) need a background class to discard background patches (since they are much more frequent)
2) too many boxes (need to try also every scale and aspect ratio)

Thus we need to apply **region proposal** methods first to find **object candidates**.
### Selective Search
It's a classical CV algorithm that scans the image in attempt to find regions that likely contain an object
1) oversegments the image into highly uniform regions (aka _"superpixels"_)
2) iteratively aggregates them based on similarity scores of colors, texture and size
3) Stops when the whole image becomes a single region. Each aggregation is taken as region.
Aims for _high recall and low precision_, reducing the number of boxes to evaluate
![[Pasted image 20231025173921.png]]

# R-CNN
_Stands for Region-based CNN, applies [[#Selective Search]] first as a starting point for bounding boxes, then classifies them and refines their position. This is much faster than sliding windows._
![[Pasted image 20231025174546.png]]

1) [[#Selective Search]] to find ~2000 proposals
2) warp and rescale them to 224x244 windows
3) feed each one to a backbone network (i.e. [[AlexNet]])
4) Outputs:
	- Class
	- **Bounding box correction**
### Bounding box correction
given a bounding box from selective search $BB_{ss}=(x_{ss},y_{ss},w_{ss},h_{ss})$, the net predicts a correction $\hat t=(\Delta \hat x, \Delta \hat y, \Delta \hat w, \Delta \hat h)$, so the final output is:
$$BB=(x_{ss}+w_{ss}\Delta \hat x, y_{ss}+h_{ss}\Delta \hat y, w_{ss}exp\Delta \hat w, h_{ss}exp\Delta \hat h)$$
- the first two elements are translation relative to box size
- the other two are for log-space scaling

We can compute the **Loss** as such:
![[Pasted image 20231025182044.png]]
With this technique, and by using [[VGG]] instead of [[AlexNet]], the paper's authors almost doubled the mAP compared to the previous state of the art of classical CV methods (66 instead of 34.3).

# Fast R-CNN
Applying the full [[AlexNet]] to each (of the 2000) regions is a huge bottleneck, because the [[Convolutional Layer]]s of a [[Convolutional Neural Network]]  are responsible for the most number of flops required to run it.

Fast R-CNN is a variant of vanilla R-CNN that runs only once the expensive backbone network on the whole image (after [[#Selective Search]]).
![[Pasted image 20231108175859.png]]
After the backbone, it applies a [[RoIPool]] layer, that crops and wraps conv features according to proposals (while applying maxpooling). Those regions get flattened and run through small individual fully connected networks that predict the class and the box correction.
If we switch to [[ResNet]]-101,  we only keep the first 3 stages as backbone, and use stage 4 + avgpooling for the single regions (no need to flatten the windows).

### Fast R-CNN loss
Uses the same bounding box correction, but with a **smooth L1 loss** (aka Huber loss), which is **less sensitive to outliers** and **easier to optimize for larger values**.
![[Pasted image 20231108183848.png]]

# Faster R-CNN
[[#Selective Search]] is slow, Faster R-CNN finds proposals using [[Neural Network]]s.
Uses a **Region Proposal Network (RPN)**

![[Pasted image 20231108184926.png]]
As in [[#Fast R-CNN]], the backbone is run only once on the whole image, and its output features are fed to the RPN.

## Region Proposal Network (RPN)
RPN is applied to a small 3x3 window. 
Predicts:
- proposals 
- objectness score (to remove background and provide a confidence score)
![[Pasted image 20231108185229.png]]
When the objectness is lowm the bounding box will be ignored.
### Anchors
This tasks is too complicated for a single network in the pipeline (as it should almost solve object detection), thus pre-defined **anchors** are used to ease the process, and instead of predicting a bounding box, it predicts an anchor correction (easier task).
![[Pasted image 20231108185748.png]]
For each position, we apply multiple pre-defined, fixed anchors of size $[x_{a}, y_{a}, w_{a}, h_{a}]$.
The newtork will compute anchor correction similarly to [[R-CNN]].
![[Pasted image 20231108185954.png]]
It's implemented as a two-layer [[Convolutional Neural Network]]. Uses [[Inception#1x1 convolution]]s as a way of sliding fully connected layers (network in network).
Since we apply k anchors, we predict k objectness scores and k corrections.
![[Pasted image 20231108190047.png]]
### Training RPNs
Given an image, a ground truth bounding box$BB_{GT}$, and anchor $BB_{A}$ is used as positive (object) with objectness o=1 if $IoU(BB_{GT},BB_{A})\ge 0.7$, or if its IoU score is the largest (regardless of the threshold). If $IoU <0.3$ with all ground truth boxes, it is considered as **negative (background)**.
Targets (bb corrections) are computed as usual for R-CNN..
A mini-batch is formed by stacking all the positive anchors and enough negative anchors to reach a mini-batch size B. **Smooth L1 loss** is used.

## Feature Pyramid Network (FPN)
RPN only processes the last activation of the backbone. This provides high-level feature (e.g objects), but it's very coarse in spatial resolution (may miss object smaller than grid size).

To allow multi-scale detection, the classical way is to use **image pyramids** (like for [[Detector#Scale-Space]] and [[Detector#Difference of Gaussian (DoG)]]).
A naive approach would be to run a cnn at each scaled version of the image and perform detection on each activation
![[Pasted image 20231108195019.png]]
This would be too computationally heavy.
Actually, [[Convolutional Neural Network]]s use different scales for each stage, already implementing a sort of pyramid scale. The problem is that at each stage there is a different semantic quality (e.g. in earlyer, wider stages CNN look for low-level features like corners or edges).
Solution: "**hallucinating**" artificially the earlier stages with semantic information coming from later stages.
![[Pasted image 20231108195455.png]]
Since the channels and the resolution don't match, we first have to perform 2x upsampling (with nearest neighbor), and apply 1d convolution to match channels.
![[Pasted image 20231108195702.png]]
This kind of network is called **Feature Pyramid Network (FPN)**.
By applying FPN after the backbone, we get a pyramid of activations:
- one for each scale
- each with same number of channel 
- increasing size (2x)
![[Pasted image 20231108195920.png]]
