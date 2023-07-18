standard [[ResNet#Bottleneck residual block]] uses 2 1x1 conv layer: 
- the first reduces the n° of channels of 1/4
- the second augments the n° of channels by 4x
so the middle 3x3 conv operates with reduced dimensions, that might lead to information loss.

## Inverted residual blocks
MobileNet solves this issue by using **inverted residual blocks**, where 
- the first 1x1 layer expands the channels
- second compresses back again
expansion works according to an **expansion ratio t**

The inner 3x3 conv layer is implemented as a [[ResNet#Depthwise separable convolutions]].

lastly, there are no ReLUs between residual blocks
![[Pasted image 20230718183635.png | 400]]

MobileNet V2 is a stack of inverted residual blocks:
![[Pasted image 20230718225409.png]]
Has few parameters since stem layer does not have to make heavy downsampling, and channels grow slowly