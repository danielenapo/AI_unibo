standard [[ResNet#Bottleneck residual block]] uses 2 1x1 conv layer: 
- the first reduces the n° of channels of 1/4
- the second augments the n° of channels by 4x
so the middle 3x3 conv operates with reduced dimensions, that might lead to information loss.

## Inverted residual blocks
MobileNet solves this issue by using **inverted residual blocks**, where 
- the first 1x1 layer expands the channels
- second compresses back again
- expansion works according to an **expansion ratio t**
- There are ==no ReLUs between residual blocks==
![[Pasted image 20230718183635.png | 400]]
![[Pasted image 20230824181133.png]]
# Depthwise separable convolution
==The inner 3x3 conv layer is implemented as a depthwise separable convolution:==
Instead of doing one big convolution, the matrix is split in 2, and we just do two smaller convolutions. The result is the same, but the complexity is **much** smaller.
Splits the computation into two steps: 
- **Depthwise convolution** is used to create a linear combination of the output of the depthwise convolution.
- **Pointwise convolution** is used to create a linear combination of the output of the depthwise convolution (1x1 conv)
![[Pasted image 20230719120010.png]]
Using this kind of convolution allows to deal with more channel, while keeping the cost down. The groups are computed in parallel, allowing a speedup up to 9x!!!
![[Pasted image 20230719120536.png]]

![Depthwise separable convolution](https://www.youtube.com/watch?v=vVaRhZXovbw)
## Architecture
MobileNet V2 is a stack of inverted residual blocks:
![[Pasted image 20230718225409.png]]
Has few parameters since stem layer does not have to make heavy downsampling, and channels grow slowly