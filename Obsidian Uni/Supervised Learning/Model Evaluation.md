Evaluation is driven by **performance measures.**
performance depends on the choice of [[Hyperparameter]]s.

## Empirical error frequency
empirical probability measures frequency of success measured "a posteriori". In most cases, empirical distributions have a **normal distribution** around the true probability.
![[Pasted image 20230118122252.png]]
$\alpha$ is the probability of a wrong estimate

Error frequency is the semples measure for estimating the quality of a [[Classification]] (sum of errors of any class divided by total number of test records)


# Binary prediction
In case our predictions can have two outcomes: positive or negative.
After testing, we can build a **confusion matrix**, where errors could be false positives (FP) or false negatives (FN)
![[Pasted image 20230118130010.png]]
Accuracy is not enough, so we introduce other measures:
- PRECISION=$\frac{TP}{(TP+FP)}$
- RECALL=$\frac{TP}{(TP+FN)}$
- F1-SCORE=$2\frac{prec \times rec}{(prec+rec)}$
	armonic mean between precision and recall, increases when the're balanced
![[Pasted image 20230118130854.png]]

## multiple classes
These measures can be applied also to more than 2 classes (their definition change tho)
![[Pasted image 20230118132424.png]]
There are ways to combine the results:
- **micro** -> uses global values of TP, FN, FP 
- **macro**
- **weighted**
NOTE: if [[Data]] is balanced, those measures are equivalent.