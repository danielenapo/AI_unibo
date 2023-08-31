_Processing [[Data]] before training is essential to obtain good results, or to ease the training process (can speed up a lot)._
In Data science, the phrase _"garbage in garbage out"_ means if a model is fed with bad quality data, it will perform poorly.
AKA **cleaning** data.

## Aggregation
_Combining two or more attributes into a single one_. Useful for:
- data reduction
- Change of scale -> ex cities aggregated into regions/states
- More stable data -> aggregated data has less variability

# [[Sampling]]

# Dimensionality reduction
_With high dimensional data, sparsity increases, and using distances becomes ineffective_ (ex using KNN becomes impractical).
Dimensionality reduction solves this problem, while also providing:
- Noise reduction
- time/memory complexity reduction
- enables visualization (in 3d or 2d spaces)
### PCA (Principal Component Analysis)
Finds projections that capture most of the data variation, using the eigenvector of the covariance matrix (change of basis)
![[Pasted image 20230121125230.png]]
projecting on this new line is much better than just projecting on one axis (much less information loss).

# Feature subset selection
_Local method to reduce dimensionality_, in particular to remove redundant or irrelevant features.
Methods:
1. Brute force -> tries all possible feature subsets, measuring effectiveness
2. Embedded approach-> features selection occurs naturally from data mining algorithm (e.g. decision trees)
3. Filter approach -> feature are selected before the data mining algorithm starts (e.g. with domain knowledge).
4. Wrapper approaches -> data mining algorithms can choose best set of attributes
_[[Scikit-learn]] has methods for FSS. (module `feature_selection`, example `SelectKBest`)_ -> https://scikit-learn.org/stable/modules/feature_selection.html

## Feature creation
_Adding new features that can capture more efficiently some characteristics of the data_.
- feature extraction
- mapping to a new space -> eg signals to frequency with Fourier transforms
- new features

# [[Type conversion]]

# [[Distance methods]]

# [[Rescaling]]


# Imbalanced data
Optimized models perform poorly for minority classes.
Some estimators allow to **weight** classes, useful for [[Classifier Evaluation#Cost sensitive learning]]
Several classifiers have the parameter `class_weight`, that changes the cost function to take into account the weighs (it's equivalent to oversampling to balance the dataset)
### SMOTE (Synthetic Minority Oversampling Technique)
Synthetizes new examples from minority class (**data augmentation***), mixing the features of a random sample with one of its k nearest neighbors

