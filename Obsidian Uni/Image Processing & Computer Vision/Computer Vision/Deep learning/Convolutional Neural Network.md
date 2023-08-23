[[Convolutional Layer]]s are just constrained forms of linear layers.
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
The basic architecture used for image classification is composed of multiple conv layers with ReLU activations, Max-pooling and batch normalization between each layer, end ends with a couple of fully connected linear layers that takes the flattened last conv layer to make the final classification (it has a global receptive field).
![[Pasted image 20230711175102.png]]

### Internal Covariate Shift (ICS)
LeNet is the first CNN, made in 98. It didn't have much success because of the low computational resources of the time, and because of the Internal Covariate Shift problem: change in the distribution of network activations due to change in network parameters during training.
Even when using ReLUs, deep architecture were very slow to train for that problem.
## Batch normalization
Normalize the output of a layer **during training**, so that each dimension has **zero mean and unit variance in a batch**.
It implies to learn parameters $\gamma_{i}$ and $\beta_i$ to reintroduce flexibility.
![[Pasted image 20230711180013.png]]
Batchnorm behaves differently based on batches values. Since we want this layer to behave deterministicly during test time, we take $\mu_j$ and $\nu_j$ as constants (the average of the values computed at train time). Batch norm becomes a linear deterministic transformation, to be applied between conv layers, and has different benefits:
- allows higher learning rates
- initialization of parameters is less important
- no overhead during test
![[Pasted image 20230711180628.png]]

# Popular architectures
- [[AlexNet]]
- [[VGG]]
- [[Inception]]
- [[ResNet]]