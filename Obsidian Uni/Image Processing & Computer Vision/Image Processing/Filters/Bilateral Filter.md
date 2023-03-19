AKA "edge preserving smoothing"
==**non-linear** filter that effectively denoises [[Image Noise#Gaussian Noise]] without blurring, **preserving edges**.==
![[Pasted image 20230319171221.png]]
In order to do this, it uses **spatial and range distances**
![[Pasted image 20230319171346.png]]
- Neighbouring pixels take larger weights as they're both closer and similar to the central pixel.
- At a central pixel nearby an edge, pixels from the other side look quite different, thus will have much smaller weights
The kernel is **computed at runtime**, since it's different for each pixel. 

Below, an example of the smoothing of a noisy edge.
![[Pasted image 20230319172743.png]]
(VIDEO explanation: https://www.youtube.com/watch?v=yenye2s90BA)