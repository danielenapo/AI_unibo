_A runtime classifier with a tree-shaped set of tests._
![[Pasted image 20230117120321.png]]
A tree-structured plan of tests on **single attributes** to forecast the target.

## Nodes
two types of nodes:
- **inner nodes** (tests) -> tests are made on **single attributes**
- **leaf nodes** (final predictions) -> a single class _should_ be associated to it (can be more since it's not perfect)


Here's their content:
![[Pasted image 20230117124006.png]]
# Tree generation

## Entropy
DTs make their decision based on entropy in information theory (Shennon)
Given a source X with v possible values, and $p_j$ the probability for the j-th value, the entropy of source X is:
$H(x)= -\sum_{j}^{v} p_{j}log_{2}(p_j)$
- high entropy=uncertainty, probabilities are similar (infinite for equiprobability)
- low entropy = low uncertainty, some symbols have much higher probabilites
 ![[Pasted image 20230117121037.png]]
DTs split the dataset according to a threshold value, thus changing the entropy for each subset (becomes the weighted sum of entropy in the two parts), **REDUCING THE ENTROPY** (aka information gain).
==The goal is finding the threshold values that maximize information gain (i.e. minimizing entropy)==

## Recursion step
each time we split the dataset, entropy is reduced. We keep splitting untl:
- Leaves have only 1 class (entropy=0).
- No more separations are possible (no more tests).
- No more separations give higher information gain.

In the last two cases, we are left with **intrinsic training error** (model is incapable of reproduce completely the ground truth). this might depend on data.

## Estimating error
By comparing the true labels with the predicted ones we can estimate accuracy (in both train and test sets).
Accuracy can be low due to **OVERFITTING**, especially if we use too many splits, due to:
- presence of noise
- lack of representative instances (umbalanced data)

# Pruning
To eliminate parts of the tree where the decision can be influenced by random effects (overfitting), the tree can be pruned (reduce number of splits), according to a sweet spot that can be found by comparing test accuracy for different values
![[Pasted image 20230117125537.png]]
Too much pruning leads to **underfitting**.
Tree depth is a [[Hyperparameter]]

# Impurity functions
looking for the split generating the maximum **purity**-> measure purity
![[Pasted image 20230117130652.png]]
- **Information gain** ->minimizing entropy
- **Gini index**
	measure of the probability of a randomly selected sample being classified incorrectly, if it were randomly labeled according to the class distribution in the region. 
	$GINI=1-\sum_{j}^{n}f_{p,j}^{2}$ (f is the frequency of class j in node p)
	Choose to split minimizing GINI index
	It should be slightly more efficient than entropy.
- **Missclassification error**

# Summary
- **Greedy but fast** (sub-optimal solution)
- **Easy to understand**, implement and use
- Robust with noise (if pruned), but prone to **overfitting**
- **impurity functions**: gini index, inf. gain, missclassification error