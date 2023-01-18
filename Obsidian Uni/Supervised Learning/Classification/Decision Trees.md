_A runtime classifier with a tree-shaped set of tests._
![[Pasted image 20230117120321.png]]


## Nodes
two types of nodes:
- **inner nodes** (tests) 
- **leaf nodes** (final predictions)

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
To avoid overfitting, the tree can be pruned (reduce number of splits), according to a sweet spot that can be found by comparing test accuracy for different values
![[Pasted image 20230117125537.png]]
Too much pruning leads to **underfitting**.
Tree depth is a [[Hyperparameter]]

# Impurity functions
looking for the split generating the maximum **purity**-> measure purity
![[Pasted image 20230117130652.png]]
- Information gain ->minimizing entropy
- Gini index
	find frequency of classification error looking at class frequencies in current node: GINI=$1-\sum_{j}^{n}f_{p,j}^{2}$ (f is the frequency of class j in node p)
	Choose to split minimizing GINI index
- Missclassification error

# Summary
- **Greedy but fast** (sub-optimal solution)
- **Easy to understand**, implement and use
- Robust with noise (if pruned), but prone to **overfitting**
- **impurity functions**: gini index, inf. gain, missclassification error