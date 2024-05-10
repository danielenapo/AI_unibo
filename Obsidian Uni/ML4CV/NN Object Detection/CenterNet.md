_[[One stage detectors]] network that **represents objects as points** (instead of bounding boxes), and regress their size afterwards._
![[Pasted image 20231117161913.png]]
Detecting an object becomes the problem of **detecting a keypoint**, which is the center of the bouding box.
Finding width and height becomes a secondary task.

# Keypoint detection
The network produces a **keypoint heatmap** over the image
![[Pasted image 20231117162239.png | 200]]
Predicts:
- **Heatmap** $(x,y): \hat Y \in [0,1]$  has size $C \times \frac{H}{R} \times \frac{W}{R}$, where R is the output stride (usually R=4).
- **Offset** $(\delta x, \delta y): \hat O$ for each center point, to recover the discretization error given by the output stride R.
- **Bounding box size** $(w,h):\hat S$.

The **backbone** network is and encoder-decoder **fully** [[Convolutional Neural Network]].

# Inference
At inference time, given a spatial local maxima in the channel $\hat Y_{c}$ at point $(x^{m}, y^{m})$, the box centered at $(x^{m}+\delta x^{m}, y^{m} + \delta y^{m})$ of size $(w^{m}, h^{m})$ and class c is detected without any further pre-processing! (no need of [[Non-Maxima Suppression (NMS)]], because the local maxima already selects one BB per instance).
![[Pasted image 20231117164513.png]]


# Loss
Ground truth keypoints are the coordinate of the center of the object $p=(x_{p}, y_{p})$, they are projected in the heatmap: $\tilde p=\frac{p}{r}$  
The loss is a variant of the binary [[RetinaNet#Focal loss]].
![[Pasted image 20231117165356.png]]
The additional $(1-\hat Y_{xyc})^\beta$ reduces the loss around the ground truth locations.

# Object detection
Points can be seen as a special case of anchor, but
- based solely on location
- without manual threshold
- one box per prediction, no need to apply NMS

Its nature allows to be adapted to many other tasks:
![[Pasted image 20231117165602.png]]

![centernet lecture](https://www.youtube.com/watch?v=pDqoJNJfEZo)