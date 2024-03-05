In classical [[Computer Vision]], depth can be estimated in a stereo setup by solving the correspondence problem with [[Pinhole Camera model#Stereo matching]] (assuming that images are perfectly aligned, which can be true if we perform [[Camera calibration]] and [[Warping]]).
$$Z=\frac{bf}{d}$$
Z is distance, b is baseline, f the focal length and d the disparity.
![[Pasted image 20240227170128.png | 500]]
# Monocular cues
In principle, it's impossible to recover depth from a single image by using just math.
Yet, we as humans can infer depth even from 2D pictures or by covering one eye (monocular), based on our experience of the 3D world. 
It is possible to train algorithms ti mimic this ability, solving the **single-view depth estimation problem**.

Using the **supervised approach**, we need
- Huge amounts of realistic synthetic data for the ground truths. Usually obtained from videogames or 3D renders where the depth map comes for free.
- Expensive hardware like lidar to provide real depth values for fine tuning, to deploy the model in the real world.

# Monodepth
Let's start first with the stereo and supervised case:
![[Pasted image 20240227171034.png]]
Having the **ground truth disparities for every pixel** is very expensive or inaccurate.
A cheaper solution that does not rely on having ground truth labels for every pixel to compute losses, is to construct a fake right image starting from the left disparity prediction ($u_{right}=u_{left} + \tilde d$)  and compute the loss as the similarity between the real and fake right images.
![[Pasted image 20240227171351.png]]
This is referred as **forward mapping**
### Problems
- The disparities $\tilde d$ are **continuous values**, how do we compute the new location $u_{left}+\tilde d$  in the discrete domain of images (pixels)?
- This causes holes in the reconstructed image
- The estimated disparity is aligned with the right (target) image, which is unavailable at test time (monocular)

## NoLR version
If we reconstruct the left image using the right one, the estimated disparity and depth  will be aligned with the left (input) image.
![[Pasted image 20240227175923.png]]
The right image is only needed at train time (to compute loss), but to generate disparity maps we only need one image (deployment phase).
# Image reconstruction Loss
Need a good distance function. 
![[Pasted image 20240227180127.png]]
### Disparity smoothness
Disparity map predictions near object boundaries are usually bad, we can artificially add a penalty term to the loss function based on the gradient of the pixels to make the boundaries more obvious.
![[Pasted image 20240227180407.png]]

![[Pasted image 20240227181049.png]]
# Architecture
- Uses an architecture based on [[U-NET]]. 
- Up convolution are implemented as bilinear upsampling + conv layer, instead of [[U-NET#Transposed convolutions]].
- Disparity maps are computed at several resolution and loss is computed for each of them.
