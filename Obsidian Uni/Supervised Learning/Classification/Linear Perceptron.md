_It's a linear combination of weighted inputs. AKA **artificial neuron**_, since it's inspired from the functioning of biologic neurons.
![[Pasted image 20230119124759.png]]

It's inherently **BINARY** -> learns an hyperplane such that all the negatives are on one side, and the positives on the other.
![[Pasted image 20230119124903.png]]

The hyperplane is a linear function described by a sum of weighted attributes, with the addition of a dummy **bias** $x_{0}=1$ (that makes the hyperplane to not pass to the origin).

$w_{0}*x_{0} + w_{1}*x_{1} +$ ... $+ w_{D}*x_{D}$  (D is number of dimensions/features, x are the datapoints, w the weights)

The model aims to learn the weights vector -> during training, it iteratively modifies weights (for each training instance x, adding or removing $x_{i}$ if it's missclassified), until the maximum separation is obtained.

==The algorithm only converges if the dataset is **linearly separable**==.
That's the biggest downside of this method.
