It has been observed that when scaling CNNs, not always the performance increases, due to training problems, since optimizing very big networks is hard.

## Residual block
The solution is changing the network, by allowing to learn identity functions thanks to **residual blocks**, implemented by adding **skip connections** between input and last activation.
A skip connection is just a concatenation:
![[Pasted image 20230712165635.png]]
Heavily uses batch norm layers.
![[Pasted image 20230712181541.png]]
# Residual Network
They are inspired by [[AlexNet#VGG]]'s regular design, stacking together fixed stages:
- stages are stacks of residual blocks
- **each residual block is a stack of two 3x3 conv with batch norm and ReLU in between**
- First block (conv layer) of each stage halves the resolution and doubles channels by using stride 2
- uses an initial stem layer to first reduce the resolution
- end with a global average pooling layer like [[Inception]]
![[Pasted image 20230712175132.png]]
## Stem layer
- convolution 7x7 stride 2 
- maxpool 3x3 stride 2
![[Pasted image 20230712175232.png]]
## Skip connections
Since the size halves and the number of channels doubles at the first conv layer of a stage, the skip input would not match with the stage output. 
To solve this, it's best to apply a 1x1 convolution with stride 2 and 2C channels (followed by batch norm).
![[Pasted image 20230712180235.png]]
## Bottleneck residual block
When designing very deep residual nets, it's best to use these kind of block, which enable faster depth increase without altering computational budget.
Adds a third 1x1 conv layer before adding the skip, with 4 times the number of channels. Also the first conv layer is 1x1.
![[Pasted image 20230712181515.png]]
# Inception-ResNet
[[Inception]] modules with skip connections
![[Pasted image 20230718180657.png]]
The whole network has the same structure of vanilla ResNet, but uses Inception-resnet blocks instead.
# ResNeXt
Decomposes [[#Bottleneck residual block]]s into G parallel branches, though the complexity remains similar to a standard ResNet block.
Only one skip connection is present for all the G branches:
![[Pasted image 20230713100243.png]]
Follow the **split-transform-merge** paradigm.
## Grouped convolutions
A technique to split the input and output channels into G groups, obtaining the same result but with less filter channels, thus reducing parameters and flops, allowing parallel computation with multiple GPUs
![[Pasted image 20230713110733.png]]
ResNext uses grouped convolutions in residual blocks, so it can have more paths while keeping the n° of parameters small.

The ResNext block is approximately an [[#Inception-ResNet]] block
![[Pasted image 20230713121418.png]]
## SENet
Uses a **squeeze and excitation** module to capture global context ant to reweight channels in each block
![[Pasted image 20230718182801.png]]
- squeeze = global average pooling
- excitation = FC+ReLU+FC+sigmoid
There are 2 skip connections: 
1) vanilla between input and last relu
2) between residual block and scale after the S-E block


