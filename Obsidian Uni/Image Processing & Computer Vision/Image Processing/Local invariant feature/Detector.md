## Moravec Interesting Point Detector
**cornerness** of a pixel p is a measure of the likelyhood of that point being a corner:
$C(p)=min_{q\in neigh(p)} ||N(p)-N(q)||^{2}$ 
![[Pasted image 20230331121152.png]]
## Harris Corner Detector
Continuous formulation of [[#Moravec Interesting Point Detector]]:
shifting the image on infinitesimal scale ($\Delta x , \Delta y$), being able to deploy Taylor's expansion at (x,y): $f(x+\Delta x)=f(x)+f'(x)\Delta x$ 
In the end you end up with a weighted sum of derivatives:
![[Pasted image 20230331121623.png]]
This matrix M encodes the local image structure around the pixel p. If M is a diagonal matrix, it becomes the **matrix of eigenvalues**:
![[Pasted image 20230331121737.png]]
![[Pasted image 20230331121746.png]]

But M can always be diagonalized with rotations:
![[Pasted image 20230331121835.png]]

Computing eigenvalues for every pixel is very expensive though, so a better solution is using an approximation:
![[Pasted image 20230331122530.png]]
### Steps
Harris Corner Detector follow usualy 3 steps:
1. Compute C for each pixel
![[Pasted image 20230331122835.png]]

1. Select only pixels where C is higher than a threshold T
![[Pasted image 20230331122848.png]]
1. Detect as corners only those pixels that are local maxima of C, using [[Non-Maxima Suppression (NMS)]]
![[Pasted image 20230331122924.png]]
### Properties
- Rotation invariant
- NOT illumination invariant (as seen above)
- NOT scale invariant, since the neighbouring window is fixed
![[Pasted image 20230331124515.png]]

# Scale-Space
Depending on distance and focal-length, objects may appear differently in the image, and may exhibit less/more details (features).
Scaling changes the amount of features detectable
![[Pasted image 20230331131220.png]]
Solution: applying a fixed-sized tool on different scaled and blurrier versions of the same image -> "SCALE SPACE"
![[Pasted image 20230331131322.png]]
Scale space must be realized with [[Gaussian Filter]] smoothing:
$L(x,y,\sigma)=G(x,y,\sigma)*I(x,y)$, increasing the kernel size when shrinking the image.

# Scale-Normalized LOG
Useful for detecting "blob-like" circular features in images, can also identify edges and corners.
Uses the scale-normalized [[Laplacian of Gaussian (LOG)]], which uses second order derivatives.
Convolves image with LOG filter at multiple scales:
$F(x,y,\sigma)=\sigma^{2}(\nabla^{2}G(x,y,\sigma)*I(x,y*))$ 
the $\sigma^{2}$ does normalization, making the filter invariant to scale changes. 

![[Pasted image 20230331132119.png]]
The idea is to find extrema (min, max) across x, y, $\sigma$. because these points correspond to regions of the image that have **high curvature or intensity variation in multiple directions** (detected by 2nd derivative).

![[Pasted image 20230331132735.png]]

# Difference of Gaussian (DoG)
$DoG(x,y,\sigma)=L(x,y,k\sigma)-L(x, y, \sigma)$ 
Where ==**k**== is a constant [[Hyperparameter]], which controls the scale of the filter.
It is a difference of smoothed images, where $\sigma$ of the [[Gaussian Filter]] slightly changes.

It gives similar result to [[#Scale-Normalized LOG]], but it's more efficient (**approximation**)
![[Pasted image 20230331151842.png]]
![[Pasted image 20230331151937.png]]
Can also detect blob-like features.