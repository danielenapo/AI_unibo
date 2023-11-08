Converts activations inside Region of Interests (RoI, corresponding to rescaled [[R-CNN#Selective Search]] regions) into activations with **fixed spatial dimensions**.

1) Snap region to grid (needs quantization)
![[Pasted image 20231108180654.png]]
2) Apply max pooling kernels, where **stride and size is not fixed**:
	$size = \lceil \frac{H_{r}}{H_{o}}\rceil \cdot \lceil \frac{W_{r}}{W_{o}}\rceil$     
	Since the fraction needs to be rounded (to be integer), that's another source of quantization
![[Pasted image 20231108181628.png]]