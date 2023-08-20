AKA "edge preserving smoothing"
==**non-linear** filter that effectively denoises [[Image Noise#Gaussian Noise]] without blurring, **preserving edges**.==
- Bilateral filter is highly effective at **noise removal** while **preserving edges**.
- The operation is **slower** compared to other filters.
- **Gaussian filters** is a function of **space** alone and does not consider whether pixels have almost the same intensity value or not resulting in blurred edges.
- The **bilateral filter** also uses a **Gaussian filter** in the **space** domain, but it also uses one more (multiplicative) **Gaussian filter** component which is a function of ==**pixel intensity differences**==.
- The Gaussian function of space makes sure that only pixels are ‘spatial neighbors’ are considered for filtering, while the Gaussian component applied in the intensity domain (a Gaussian function of intensity differences) ensures that only those pixels with intensities similar to that of the central pixel (‘intensity neighbors’) are included to compute the blurred intensity value. As a result, this method preserves edges, since for pixels lying near edges, neighboring pixels placed on the other side of the edge, and therefore exhibiting large intensity variations when compared to the central pixel, will not be included for blurring.

![[Pasted image 20230319171221.png]]
In order to do this, it uses **spatial and intensity distances**
![[Pasted image 20230319171346.png]]
- Neighbouring pixels take larger weights as they're both closer and similar to the central pixel.
- At a central pixel nearby an edge, pixels from the other side look quite different, thus will have much smaller weights

The kernel is **computed at runtime**, since it's different for each pixel, thus it's much more inefficient than a simple Gaussian linear filter

Below, an example of the smoothing of a noisy edge.

![VIDEO explanation](https://www.youtube.com/watch?v=yenye2s90BA)