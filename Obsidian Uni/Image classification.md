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

# Optimization
We need to use optimization models to solve this problem, minimizing a **loss function** which is related to the actual problem.
This objective function is much simpler to optimize, and if chosen correctly, will result in a good outcome for the original problem.
- if the loss is high, the classifier is bad -> LOW ACCURACY
- if the loss is low, the classifier is good -> HIGH ACCURACY
$$\theta^*=argmin_{\theta}L(\theta,D^{train})$$
The parameters to optimize ($\theta$) are those of the loss function, and the input of the latter is the training data (pixels of the images).
## Loss functions
The kind of loss function we want to use depends on how we want to represent the label.
### RMSE loss
Uses the **one-hot encoding** for the label representation:
$$L(\theta,(x^i,y^y)))=L(Wx^{i}+b, y^i)=||Wx^{i}+b-1hot(y^i)||_2$$
![[Pasted image 20230820202558.png | 600]]

### Softmax activation function
There are practical reason to prefer a loss that transforms the scores computed by the classifier into **probabilities**, then perform MLE of $\theta$.
Softmax is an **activation function** (NOT a loss), which represents the label as a mass probability vector
$$p_{model}(Y=j|X=x^{i};\theta)=softmax_{j}(s)=\frac{exp(s_j)}{\sum\limits_{k=1}^{C}exp(s_k)}$$
![[Pasted image 20230820202847.png | 600]]
### Cross-entropy loss
Cross-entropy loss relies on the probability mass vector given by the Softmax activation function, and performs MLE estimation to find the optimal parameters $\theta$:
$$\theta^{*}=argmax_{\theta}p_{model}(y^{1}, \dots , y^{N}|x^{1}, \dots,x^{N}, \theta)=\dots=argmin_{theta}\sum\limits_{i=1}^{N}-log(p_{model}(Y=y^{i}|X=x^{i}; \theta))$$
Given an example of predicted label, with a softmax activation:
![[Pasted image 20230820203708.png]]
- If the true class is bird (hence the model was correct), the cross-entropy loss computed is 0.1 (=-log(0.9)),
- If the true class is car, the loss is 2.4 (=-log(0.09)), which is a much higher value, that has much more impact when updating the parameters.

# Gradient descent