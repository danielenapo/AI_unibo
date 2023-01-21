Procesing [[Data]] before training is essential to obtain good results, or to ease the training process (can speed up a lot).
In Data science, the phrase "garbage in garbage out" means if a model is fed with bad quality data, it will perform poorly.
AKA **cleaning** data.

## Aggregation
_Combining two or more attributes into a single one_. Useful for:
- data reduction
- Change of scale -> ex cities aggregated into regions/states
- More stable data -> aggregated data has less variability

# Sampling
_Get random samples of the entire dataset._
For both preliminary and final data analysis:
Processing the whole dataset could be too expensive, if a representative subset can be found, good results can be reached anyway.

### Types of sampling
![[Pasted image 20230121115823.png]]
A tradeoff has to be found between data reduction and precision (less data = less precision).
sampling with or without replacement are almost equivalent if sample size is much smaller than dataset size, but sampling with replacement is much easier to implement (and statistically interpreted).
![[Pasted image 20230121121817.png]]

Probaility to sample at least one element for each class (with replacement) with increasing sample size ([[Classification]])
![[Pasted image 20230121123128.png]]

# Dimensionality reduction
_With high dimensional data, sparcity increases, and using distances becomes uneffective_ (ex using KNN becomes impractical).
Dimensionality reduction solves this problem, while also prividing:
- Noise reduction
- time/memory complexity reduction
- enables visualization (in 3d or 2d spaces)

## PCA (Principal Component Analysis)
Finds projections that capture most of the data variation, using the eigenvector of the covariance matrix (change of basis)
![[Pasted image 20230121125230.png]]
projecting on this new line is much better than just projecting on one axis (much less information loss).
## Feature subset selection
_Local method to reduce dimensionality_, in particular reduntant ones or irrelevant.
Methods:
1. Brute force -> tries all possible feature subsets, measuring effectiveness
2. Embedded approach-> features selection occurs naturally from data mining algorithm (eg decision trees)
3. Filter approach -> feature are selected before the data mining algorithm starts (eg with domain knowledge).
4. Wrapper approaches -> data mining algo can choose best set of attributes
[[Scikit-learn]] has methods for FSS.
## Feature creation
_Adding new features that can capture more efficiently some characteristics of the data_.
- feature extraction
- mapping to a new space -> eg signals to frequency with fourier transforms
- new features

# Type conversion