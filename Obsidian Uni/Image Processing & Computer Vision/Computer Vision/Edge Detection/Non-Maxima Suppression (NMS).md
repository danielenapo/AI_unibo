Setting a good threshold value to find edges is difficult. An alternative is: 
- finding the local maxima of the absolute value of the derivative.
- Looking along the gradient direction

-   The image is scanned along the image gradient direction, and if pixels are not part of the local maxima they are set to zero.
-   This has the effect of suppressing all image information that is not part of local maxima.
-   The reason is to thin out the edges and reduce noise in the image.
-   This helps to make the edges more distinct and easier to detect.

## Direction discretization
In fact the correct direction needs to be estimated locally based on gradient's direction.
But the gradient is continuous, and our domain is made of discrete pixels -> need discretization (of the direction):
![[Pasted image 20230321102158.png]]

==Applying magnitude thresholding AFTER NMS helps in filtering out irrelevant edges== (due to noise or not important details)


