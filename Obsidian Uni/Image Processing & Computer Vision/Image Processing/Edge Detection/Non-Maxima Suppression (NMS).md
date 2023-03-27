Setting a good threshold value to find edges is difficult. An alternative is: 
- finding the local maxima of the absolute value of the derivative.
- Looking along the gradient direction
In fact the correct direction needs to be estimated locally based on gradient's direction.
But the gradient is continuous, and our domain is made of discrete pixels -> need discretization (of the direction):
![[Pasted image 20230321102158.png]]

==Applying magnitude thresholding AFTER NMS helps in filtering out irrelevant edges== (due to noise or not important details)