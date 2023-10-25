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

1) Selective search to find ~2000 proposals
2) warp and rescale them to 224x244 
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

### Fast R-CNN
Applying the full [[AlexNet]] to each (of the 2000) regions is a huge bottleneck, because the [[Convolutional Layer]]s of a [[Convolutional Neural Network]]  are responsible for the most number of flops required to run it.
