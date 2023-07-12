The first [[ML approach]] classifier to win the ILSVRC contest in 2012, before there were only [[Bag of words#VLAD]].
By Geoffrey Hinton, Ilya Sutskever and Alex Krizhevsky.
![[Pasted image 20230712113554.png]]
It is an evolution of LeNet, with 5 convolutional layers + ReLU, some of them followed by maxpooling. Finally 3 Fully connected layers.

Works with 2 parallel GPUs, each of them is responsible of computing half the network (blue line in the image)

## ZFNet
An improved AlexNet (won in 2013). Introduces deconvnets and gradient ascent for layer visualization. This allowed to find structural flaws like too large filter sizes and strides.

# VGG
uses a combination of:
- 3x3 conv with stride 1, P 1
- 2x2 max-poolig stride 2, P
and doubling n° of channels after each pool
finally 3 fully connected layers and a softmax activation.

pre-initialization of weight was still necessary since batchnorm was not invented yet
![[Pasted image 20230712123256.png]]
There is a repetition of "**stages**"
a stage for example is $conv+conv*2+pool$, or $conv+conv+conv+pool$.

One stage ha same receptive field of larger convolutions, but requires less parameters and computation, introduces non-linearities.
