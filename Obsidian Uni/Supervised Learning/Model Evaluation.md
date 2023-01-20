Evaluation is driven by **performance measures.**
performance depends on the choice of [[Hyperparameter]]s.

## Empirical error frequency
empirical probability measures frequency of success measured "a posteriori". In most cases, empirical distributions have a **normal distribution** around the true probability.
![[Pasted image 20230118122252.png]]
$\alpha$ is the probability of a wrong estimate

Error frequency is the semples measure for estimating the quality of a [[Classification]] (sum of errors of any class divided by total number of test records)

# Performance measures
Using [[#Empirical error frequency]] we can calculate different types of measures a posteriori, comparing our prediction with the real labels.
The way to calculate them depends on the type of classes we're dealing with:
## Binary prediction
Binary classification can have only **two outcomes**: positive or negative.
After testing, we can build a **confusion matrix**, where errors could be false positives (FP) or false negatives (FN)
![[Pasted image 20230118130010.png]]
Accuracy is not enough, so we introduce other measures:
- PRECISION=$\frac{TP}{(TP+FP)}$
	how many of the samples that the model classified as positive are actually positive. 
	==How many retrueved elements were actually relevant ==
- RECALL=$\frac{TP}{(TP+FN)}$
	how many of the actual positive samples were correctly identified by the model. 
	==how many of the relevant samples were actually captured by the model's predictions.==
- F1-SCORE=$2\frac{prec \times rec}{(prec+rec)}$
	armonic mean between precision and recall, increases when the're balanced
![[Pasted image 20230118130854.png]]
Those metrics can be visually analyzed with [[Probabilities of classes#Lift chart]] and [[Probabilities of classes#ROC curve]].

## Multiple classes
These measures can be applied also to more than 2 classes (their definition change tho)
![[Pasted image 20230118132424.png]]
There are ways to combine the results:
- **micro**
	Calculate metrics globally by counting the total true positives, false negatives and false positives.
	precision and recall are equivalent.
	- micro=$\frac{\sum TP_{i}}{\sum TP_{i}+ \sum FP_{i}}$
	==global accuracy (for every class), every class has same weight==
- **macro**
	Calculates score separated by class and adds them together Uunweighted mean)
	- precision_macro=$\frac{\sum prec_{i}}{num of classes}$
	- recall_macro=$\frac{\sum rec_{i}}{num of classes}$
	==minority classes penalize more the evaluation if the're bad==
- **weighted**
	Calculates score separated by class, when adding them, multiplies each class by the number of true labels (weighting classes based on presence) 
	- precision_macro=$\frac{\sum prec_{i} \times T_{i}}{num of classes}$
	- recall_macro=$\frac{\sum rec_{i} \times T_{i}}{num of classes}$
	==majority class has more weight==
NOTE: if [[Data]] is balanced, those measures are equivalent.

# K-statistics
_Evaluates concordance between two classifications_ (between predicted and true one).
==how much the model is better than random guesses== (or with respect to another model)
It's an alternative measure to the previous ones.


![[Pasted image 20230118160244.png]]
- 0 -> random 
- 1 -> perfect agreement (always right, perfect model)
- -1 -> total disagreement (always wrong)

# Cost sensitive learning
In some use cases, wrong predictions imply a cost.
Similarly to the confusion matrix, we can build a **cost matrix**, that represent a cost factor for each type of error (FP or FN):
![[Pasted image 20230118161451.png]]
in the case above, false positives cost 5 times more than false negatives (ex granting a loan to a bad payer is worse than not giving it to a good one)

It can happen that some cost-sensitive classes are also less represented in the data (are unbalanced)
we can alter the proportion of classes in the training data by:
- **random oversampling** the critical classes (duplicate randomly)
	SMOTE method: duplicate with random perturbation (data generation)
- **random undersampling** less critical classes (delete randomly)

