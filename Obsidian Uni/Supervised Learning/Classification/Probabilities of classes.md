
there are two methods of prediction in [[Classification]]:
- **CRISP** -> output is only one label (hides probabilities)
- **SOFT/PROBABILISTIC** -> tuple of probabilities for each possible label
	can be transformed into crisp by using binary thresholds, or output the class with max probability

## Lift chart
We can build a lift chart, where x= sample size, y= num of positives in sample.
It represents graphically the performance of the classification model.
Points above the straight line represent better classifications than random choice.
![[Pasted image 20230118163853.png]]
## ROC curve
It's a way to identify the best threshold value to transform soft predictions into crisp ones.
Varying the threshold, the ratio of TP and FP changes
![[Pasted image 20230118165216.png]]
DECREASE THRESHOLD -> RECALL INCREASES, PRECISION DECREASES

The quality of the curve is summarizad by the AUC (area under curve), bigger is better.

![[Pasted image 20230118165605.png]]




