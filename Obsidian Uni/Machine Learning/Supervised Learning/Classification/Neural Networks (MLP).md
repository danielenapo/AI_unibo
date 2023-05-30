_Different [[Linear Perceptron]]s linked together in a graph, solving the linear separability problem. Inspired by the [[Brain]]'s [[Neural Circuits]]_
![[Pasted image 20230119131518.png]]

A (computational) neuron is a signal processor, associated with a **threshold** value. Signal transmissions between neurons is weighted.
Signals are represented as real numbers, the threshold is a matematic function ("squashing functions")
- Sigmoid: $\frac{1}{1+e^{-x}}$ -> maps a real functiond (domain $\Re$) to $]0,1[$ 
- Arctangent

## Feed forward MLP
input feeds and input layer, that feeds hidden layers, that feeds an output layer
![[Pasted image 20230119181723.png]]
g is the **activation function** that applies the squashing function and the threshold.
After each loop of feeding information forward, **backpropagation** is performed to propagate back the errors and update weights (according to **gradient descent**).
The algorithm converges when the error function is mall enough. (but it's not guaranteed, can lead to local minimums).

![[Pasted image 20230119183453.png]]

$\lambda$ is the **learning rate**, it's a [[Hyperparameter]] for gradient descent that change the influence of the gradient when updating the weights (smaller $\lambda$ leads to smaller changes).
Multiplying factor of the connection to be applied to the connection weights

### Stop criteria
Iterations end when one of this conditions is met:
- wheight updates are small enough
- classificaition error is small enough
- timeout condition (max number of iterations)
(each of these conditions is defined by a [[Hyperparameter]])

### Learning modes
- stochastic
- batch
a learning round over all the samples is called **epoch** 

## Downsides
MLP can
- get stucked on a local minima
- Overfit

this can be avoided thanks to **regularization**:
adds a new term to the loss function (another [[Hyperparameter]] that need to be tuned), that usually is the sum of squares of the network errors. It smooths the loss function, so when gradient is performed it's less likely to the training data.