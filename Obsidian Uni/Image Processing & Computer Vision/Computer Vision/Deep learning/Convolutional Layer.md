In traditional [[Image Processing]], for [[Image Filters]] we rely on [[Image Filters#Convolution]]s/correlations with handcrafted filters.
We could build convolutional layers that have the objective to learn the composition of such filters from data.
- Input and output are not flattened, preserving the spatial structure
- The parameters associated with connections are the same for all output units, so **parameters are shared** and the convolution learns the same detector regardless of the input position.
- A convolution only processes a small set of neighbor pixels at a time, like in the [[Visual cortex#Receptive field]].
- Image exhibit informative **local** patterns that may appear anywhere across an image, that's why convolutions are so effective with images.
![[Pasted image 20230711163000.png]]
In this case we need only 2 parameters, while before we used $H^2W^2$.

Convolution can be seen as a matrix multiplication operation if we reshape inputs and outputs. It's a linear operator which:
- shares parameters across rows
- It's sparse
- Adapts to different input sizes
- Equivariant to translations of input (not rotation and scale) -> $T(x)*K=T(x*K)$. Allows for better generalization and data efficiency, possible thanks to weights sharing.
![[Pasted image 20230711163151.png]]
## conv layer vs dense layer
We can see below that Conv layers are just dense layers which aren't fully connected. the weights of the connections are the kernel values, and are shared between neurons, as seen below.
![[Pasted image 20230712163416.png]]
# Channels
Colored images have 3 channels, corresponding to a 3D tensor $3\times H\times W$.
We need to have 3 kernels: one for each channel ($3\times K \times K$).
Each filter generates a single channel **feature map**. 
![[multiple_channels_convolution_CNN.gif]]
![[Pasted image 20230711165448.png]]
To get **more output channels**, we need to use multiple filters and stack the ouptuts.
![[Pasted image 20230711165704.png]]
In general, we can have as many input and output channels as we want, as long we use the right kernel dimensions.

