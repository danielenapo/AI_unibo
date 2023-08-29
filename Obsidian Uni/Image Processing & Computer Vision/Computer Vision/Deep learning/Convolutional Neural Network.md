_[[Convolutional Layer]]s are just constrained forms of linear layers, more useful and appropriate to deal with images or signals._

If we want to stack more layers, we still need to use non-linear activation functions.
## Padding
If we stack multiple layers, size will shrink if we don't use padding ("valid").
It's common to use zero or same padding to extend the input image and obtain the same image size after each conv layer.
![[Pasted image 20230711172455.png]]
## Receptive field
The input pixels affecting a hidden unit are called **receptive field**, and works much like the [[Visual cortex#Receptive field]].
To obtain large receptive fields with a limited number of layers, we **downsample** the activations inside the network.
![[Pasted image 20230711173342.png]]
## Strides
The stride indicates how many pixels we want to move right when we slide the kernel over the image.
The strides affects the output image (feature map) size, and for a given s, we get:
![[Pasted image 20230711173658.png]]
The size of the receptive field grows exponentially with respect to the number of layers with stride>1
![[Pasted image 20230711173817.png]]
## Pooling 
Pooling layers are able to downsample the image by aggregating pixels with a pre-specified kernel (not learned). 
It's different from convolution layers, since each input channel is aggregated independently ($C_{out}=C_{in}$).
![[Pasted image 20230711174500.png]]
The most common pooling kernel is the **MAX-POOLING**, which only takes the pixel with the biggest value in a given neighborhood 
![[Pasted image 20230711174651.png]]
# Architecture
The basic architecture used for image classification is composed of multiple conv layers with ReLU activations, Max-pooling and [[Batch normalization]] between each layer, end ends with a couple of fully connected linear layers that takes the flattened last conv layer to make the final classification (it has a global receptive field).
![[Pasted image 20230711175102.png]]
CNN became much more powerful after the introduction of [[Batch normalization]] in 2015, which solves the [[Batch normalization#Internal Covariate Shift (ICS)]] problem, allowing for better learning and deeper networks.
# Popular architectures
- [[AlexNet]]
- [[VGG]]
- [[Inception]]
- [[ResNet]]
- [[EfficientNet]]
- [[MobileNet V2]]