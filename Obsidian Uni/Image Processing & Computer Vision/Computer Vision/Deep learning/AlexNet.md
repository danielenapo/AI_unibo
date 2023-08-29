_The first [[Deep Learning computer vision]] classifier to win the ILSVRC contest in 2012, before there were only [[Bag of words#VLAD]]._
By Geoffrey Hinton, Ilya Sutskever and Alex Krizhevsky.
![[Pasted image 20230712113554.png]]
It is an evolution of LeNet, with 5 convolutional layers + ReLU, some of them followed by maxpooling. Finally 3 Fully connected layers.

Works with 2 parallel GPUs (using [[ResNet#Grouped convolutions]]), each of them is responsible of computing half the network (blue line in the image)
## Architecture breakdown
- **1st** (stem): 96x11x11 conv **s=4** + 3x3 maxpool s=2
	- Stem layer to reduce spatial size: from 227 to 55
- **2nd**: 256x5x5 conv s=1 + 3x3 pool s=2
- **3rd**: 384x3x3 conv s=1 (no maxpool)
- **4th**: 384x3x3 conv s=1 (no maxpool)
- **5th**: 256x3x3 conv s=1 + maxpool 3x3 s=2
- **6th** (dense): flatten + 4096 dense + 4096 dense + 1000 dense + softmax activation (output)

Nearly all parameters are in the fully connected layers.
The first stem layer takes the most activation memory (big convolution 11x11)
The largest number of flop is required by the conv layers
![AlexNet](https://www.youtube.com/watch?v=jvC5eP3Wdcc)
## ZFNet
An improved AlexNet (won in 2013). Introduces deconvnets and gradient ascent for layer visualization. This allowed to find structural flaws like too large filter sizes and strides (2 instead of 3).
