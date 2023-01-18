

## Build multiple class classifiers with binary classifiers
What if we have a binary classifier (like [[Linear Perceptron]]] or [[Support Vector Machines (SVM)]]]), but we want to classify multiple classes.
- OVO (one vs one)
	Consider all possible pair of classes, generate a binary classifier for each pair.
	When predicting, a voting scheme is applied (the vlassifier with most votes wins)
- OVR (one vs rest)
	C binary problems.

# Ensemble methods
Train a set of base classifiers, the final prediction is obtaining through voting. Perform better than base classifiers.
