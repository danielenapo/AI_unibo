We can use [[Machine Learning]] approaches for image [[Classification]], without relying too much on complicated algorithm, letting the computer do the hard work given enough training labelled data (e.g. Imagenet dataset).

## Curse of dimensionality
For example we can use the [[KNN]] to compute distance in feature space between test sample and all the training example, but this would be crazy with images, since each pixel is a different dimension, we would have hundreds of thousands of dimensions, making KNN useless (**curse of dimensionality**) -> 38%accuracy

## Loss function
Instead of directly optimizing accuracy, we often optimize a proxy measure: the loss function, that is easier to optimize, but still correlated with how good the classifier is:
- RMSE
- SOFTMAX
- CROSS-ENTROPY

## Gradient descent
To optimize the [[#Loss function]].
The model starts by using random parameter values (i.e. neuron weights)
1. **Forward pass:** make prediction and compute its loss
2. **Compute gradient** using the **backpropagation** algorithm: automatic differentiation based on the chain rule
4. **Update parameter values**


# Neural networks
Using Deep Learning and [[Neural Networks (MLP)]] has proven to be a major breakthrough in Computer Vision, for many kinds of tasks. 

Compared to the [[Bag of words]] (Shallow ML approach) for image classification for example, we can see that instead of having a fixed representation, the neural network can learn its own representation:
![[Pasted image 20230711151904.png]]
### Activation function
![[Pasted image 20230711151955.png]]
In the image above, $\phi$ represents the **Activation function**: a non-linear function applied to every element of the input tensor.
This element is essential to catch non-linear relationships in the data, and without it we would just have a simple linear classifier.
### Most common activation functions
- **Sigmoid** -> maps into [0,1] range, but has the **vanishing gradient** problem
- **ReLU** (Rctified Linear Unit) -> solves vanishing gradient, but can cause dead neurons
![[Pasted image 20230711152358.png]]
- **Leaky ReLU** -> solves ReLU's problems 
![[Pasted image 20230711152609.png]]
# Deep Neural Networks
Neural networks with just one hidden layer are **universal approximators** (can approximate any mathematical function), and NNs with >2 hidden layers are called _"**Deep** Neural Networks"_.
If we stick to only 2 layers, the width of the network needs to grow exponentially with the number of inputs (not acceptable with flattened images). If we instead increase the number of layers, the width can grow **linearly**!

## Limits of Fully Connected layers
Given an image of size HxW, the layers require a lot of memory and FLOPS, which are mostly wasted, since the network has to learn a sparse feature extractor:
![[Pasted image 20230711155442.png]]
Not only it's a very difficult process, but it's also not efficient at all.
We should use instead [[Convolutional Layer]]s.