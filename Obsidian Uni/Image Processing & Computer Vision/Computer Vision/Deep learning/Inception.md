aka GoogLeNet 
With the aim of reducing computing resources to scale the model, exploiting "inception modules" and increasing depth and width while keeping the computational budget constant.
It can process multiple activaitons in parallel
![[Pasted image 20230712152358.png]]
## Stem layers
Have the objective of strongly downsample the input from 224 to 28, with half the flops as [[AlexNet#VGG]].
LAYERS:
- conv 7x7 stride 2
- maxpooling 3x3 stride 2
- conv 1x1 stride 1
- conv 3x3 stride 1
- maxpooling 3x3 stride 2
![[Pasted image 20230712153019.png]]
## Inception module
Due to maxpooling, which doubles the n°of channels, the total number becomes prohibitively expensive with big convolutions
![[Pasted image 20230712163802.png]]
### 1x1 convolution
Introduced in the [Network in Network](https://arxiv.org/pdf/1312.4400v3.pdf) paper in 2013.
A good solution is using **1x1 convolutions**, which allows to shrink the activation depth (n° of channels) while preserving spatial size.
It's like applying a linear fully connected layer at each spatial location (all the channels of a pixel)
![[Pasted image 20230712164050.png]]
The final inception module exploits this property by applying 1x1 convolutions **before** large convolutions and after maxpooling.
- Drastically reduces number of output channels:
	- 16 instead of 192 for the 5x5
	- 96 instead of 192 for the 3x3
	- after maxpool we end up with 32 channels instead of 192
	- **total output channel is 256, instead of 416**
- Time complexity is reduced for convolutions
- Less parameters
![[Pasted image 20230712164333.png]]
## Global Average Pooling
Instead of using expensive fully connected layers as classifiers, Inception obtains the same result by first applying average pooling (takes average of the neighborhood), requiring drastically less parameters.
In the end only **one fully connected layer** with softmax activation is applied to predict the classes.