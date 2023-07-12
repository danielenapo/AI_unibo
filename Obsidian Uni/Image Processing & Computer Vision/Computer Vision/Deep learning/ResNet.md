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
Adds a third 1x1 conv layer before adding the skip, with 4 times the number of channels.
![[Pasted image 20230712181515.png]]
# Inception-ResNet
[[Inception]] modules with skip connections
# ResNeXt
Inc
