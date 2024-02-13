_Subtask in image [[Segmentation]] that aims to separate different classes at the pixel level, but **does not separate instances of the same class**._

# DeepLab
Network for semantic segmentation, based on a [[ResNet]] backbone with [[#Dilated convolutions]], in order to control the resolution of the output feature map.

To solve the issue of multiple object at different **scales**, it uses the [[#Atrous Spatial Pyramid Pooling (ASPP)]] module.
![[Pasted image 20240116164734.png]]
 DeepLab emulates ASSP to use this property, to capture spatial context at multiple scales, by leveraging [[#Dilated convolutions]]:
	1) 3x3 conv with increasing dilation rates
	2) outputs are concatenated and aggregated by a 1x1 conv layer to produce the output scores map
![[Pasted image 20240116165834.png]]
### DeepLab v3+
Uses a mixture of V3 and [[U-NET]] to compute the final prediction
![[Pasted image 20240116170945.png]]
## Dilated convolutions
![[Pasted image 20240116161648.png]]
- We need rich features with **large spatial resolutions**, **large receptive fields**, but **constant cost**.
- adds parameter **r** of the **dilation rate**, which adds holes between weights to dilate the convolutional process.
- r=1 is the standard convolution
![[Pasted image 20240116162116.png]]
- If we stack convolutions with exponentially increasing dilation rates: $r_{l}=2^{l}$, 
	- the **receptive field grows _exponentially_** with the number of layers 
	- the **number of parameter grows _linearly_** with the number of layers
- When using dilated convolutions, there is no need to down sample using stride
![[Pasted image 20240116163034.png]] 

## Atrous Spatial Pyramid Pooling (ASPP)
To obtain a fixed-size representation to feed the fully connected layers:
1) the variable-size convolutional feature map is **max-pooled** with a fixed number n x n of **variable-size windows**
2) the resulting fixed-size flattened vectors are concatenated.

![[Pasted image 20240116165149.png]]

- It's an extension of the [[Inception#Global Average Pooling]] to maintain spatial information.
