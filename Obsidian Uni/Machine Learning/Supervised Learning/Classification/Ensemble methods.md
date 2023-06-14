_Train a set of independent base classifiers, the final prediction is obtaining through voting. Perform better than base classifiers (but more computationally expensive)._

If the base classifiers are truly independent, we can apply binomial distribution and see that the ensemble model is wrong only when the majority of base models are wrong

## Methods of data sampling
- **Bagging** -> sample with replacement (puts back randomly), not really independent 
- **Boosting** -> sample without replacement (increasing at each extraction the probability to find rare points)
- **[[AdaBoost]]** -> weights importance of base classifiers depending on error rate
- **Manipulating class labels** ->for each classifier, randomly partitions class labels in subsets, then re-labels dataset. 
- **[[Random forest]]**
![[Pasted image 20230119190738.png]]
![[Pasted image 20230119191348.png]]



## Build multiple class classifiers with binary classifiers
What if we have a binary classifier (like [[Linear Perceptron]]] or [[Support Vector Machines (SVM)]]]), but we want to classify multiple classes?
There are two methods:
- **OVO (one vs one)**
	Consider all possible pair of classes, generate a binary classifier for each pair.
	C(C-1)*2 classifiers are trained. (C is num of classes)
	When predicting, a voting scheme is applied (the classifier with most votes wins)
- **OVR (one vs rest)**
	A binary model is trained for each class (C models), where the current class is considered as positive, and all the other as negative. In testing, the class with the biggest score wins.



