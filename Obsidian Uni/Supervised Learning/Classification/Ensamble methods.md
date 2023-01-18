_Train a set of base classifiers, the final prediction is obtaining through voting. Perform better than base classifiers._

One example is the Random Forest, that build many [[Decision Trees]], and then combine their predictions to make a final prediction (through a voting process). Each decision tree is built using a different random subset of the data and a random subset of the features, which makes the trees different and independent from each other.

## Build multiple class classifiers with binary classifiers
What if we have a binary classifier (like [[Linear Perceptron]]] or [[Support Vector Machines (SVM)]]]), but we want to classify multiple classes?
There are two methods:
- **OVO (one vs one)**
	Consider all possible pair of classes, generate a binary classifier for each pair.
	C(C-1)*2 classifiers are trained. (C is num of classes)
	When predicting, a voting scheme is applied (the classifier with most votes wins)
- **OVR (one vs rest)**
	A binary model is trained for each class (C models), where the current class is considered as positive, and all the other as negative. In testing, the class with the biggest score wins.


