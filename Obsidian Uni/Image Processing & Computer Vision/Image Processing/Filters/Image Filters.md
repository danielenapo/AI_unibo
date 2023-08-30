![[Convolution_arithmetic_-_Padding_strides.gif ]]
_Image processing operators that compute the new intensity of a pixel $p$ based on the intensity of its neighborhood (aka **support**)._
# Linear Translation Equivariant (LTE) Operator
[[Image Noise#Denoising over space]] technique, that uses 2D convolutions between the input raw image and a **kernel** (impulse response function).
![[Pasted image 20230830114916.png]]
- A filter is **linear** iff: $$T\{ai_1(x,y)+bi_2(x,y)\}=aT\{i_1\}+bT\{i_2\}$$
- A filter is **translation-equivariant** iff: $$T\{i(x-x_{0}, y-y_{0})\}=o(x-x_{0},y-y_{0})$$
	In general, it means that the position of an object in an image should not matter during the filtering process.
## Convolution 
**Linear and Translation equivariant** filters apply a linear operator T to an image i(x,y).
The output is given by the **convolution** between the input and the **impulse response function (KERNEL)** of the operator T.
![[Pasted image 20230311105720.png | 500]]
It is equivalent to reflect in both axis then translate the kernel.

### Properties of convolution
![[Pasted image 20230311105923.png]]
## Correlation
Similar to convolution, but there is no reflection.
![[Pasted image 20230311110618.png]]
Its properties are different (NOT commutative)
![[Pasted image 20230311110652.png]]
if h is even, then i * h=h * i =h o i, but still, h o i != i o h (==not commutative==)

## Discrete convolution
same as continuous convolution, but with summatories. The same properties still hold. 
![[Pasted image 20230311161026.png]]

# Practical Implementation
The kernel has a dimension much smaller than the image. Applying the discrete convolution formula, the kernel will slide across the whole input image to compute the convolution to each pixel.
What abut edge pixels? Two options:
- CROP (cut away 4k pixels, k is dimension of kernel)
![[Pasted image 20230313092552.png]]
- PAD (e.g. zero-padding, replicate, reflect, ...), to fill the 4k border pixels with data that will be replaced by convolution.



