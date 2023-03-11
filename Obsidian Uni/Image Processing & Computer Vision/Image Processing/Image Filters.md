Image processing operators that compute the new intensity of pixel p based on intensity of its neighborhood (aka **support**).
It is a  [[Image Noise#Denoising over space]] technique, that uses 2D convolutions between the input raw image and a **kernel**.

# Convolution
**Linear and Translation equivariant** filters apply a linear operator T to an image i(x,y).
The output is given by the **convolution** between the input and the **impulse response function (KERNEL)** of the operator T.
![[Pasted image 20230311105720.png]]
It is equivalent to reflect in both axis then translate the kernel.
## Properties of convolution
![[Pasted image 20230311105923.png]]
# Correlation
Similar to convolution, but there is no reflection.
![[Pasted image 20230311110618.png]]
Its properties are different (NOT commutative)
![[Pasted image 20230311110652.png]]
if h is evem then i * h=h * i =h o i, but still, h o i != i o h (not commutative)

## Discrete convolution
same as continuous convolution, but with summatorie
![[Pasted image 20230311161026.png]]