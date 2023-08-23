Image [[Classification]] is a standard problem in [[Computer Vision]]. It requires to classify an image into a finite set of categorical classes.

- This problem is very hard if we only rely on classical [[Computer Vision]]: There are too many possible variation in images, making this task almost impossible.
- It's mandatory to rely on [[Machine Learning]], more specifically [[Supervised Learning]]: feeding lots of labelled images to train the parameters of a model, and doing [[Hyperparameter#Tuning]].
![[Pasted image 20230820200736.png]]
In this new paradigm, data becomes essential (in fact it's called **data-driven** approach)
Andrew NG said that 80% of machine learning is data preparation (in this case, it's [[Image Processing]]).
## Curse of dimensionality
But with shallow (classical) ML we will face the same problem: the task is simply too difficult since we have too many dimensions (if each pixel is a dimension, then a 32x32 image has 1024 dimensions, then grows exponentially).

For example, the [[KNN]] model is distance based, but with an exponential number of dimensions, the distances become meaningless, making it impossible to learn effective decision boundaries of the data.
![[Pasted image 20230820201215.png]]
KNN can only get up to 38% accuracy on ImageNet.

Also parametric approach like the [[Linear Regression]] classifier is a bad idea, since classes are categorical (not ordinal).

The only way to solve this problem is through [[Gradient descent]] and an [[Deep Learning computer vision]].