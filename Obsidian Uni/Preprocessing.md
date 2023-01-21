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
_Changing [[Data]] type can be useful depending on the algorithm_
- Many algos require numeric data types -> convert categorical to numeric
- [[Classification]] requires a target with nominal values -> numerical (continuous) values needs to be **discretized**.

## Binarization
_Transform different types of data (numerical, discrete, ...) into binary (boolean) type._
- **One-Hot-Encoding** -> a feature with v possible values is sobstituted by v binary features (each one corresponding to one of the unique values, and all mutually exclusive).
	`sklearn.preprocessing.OneHotEncoder`
- **Ordinal Encoder** -> Ordinal sequences are transformed into consecutive integers (keeping order)
	`sklearn.preprocessing.OneHotEncoder`
- **Binarizer** -> uses a threshold to transform numeric data to binary: >threshold=1, <threshold=0
	`sklearn.preprocessing.Binarizer`

## Discretization
Transform continue data into discrete.
- Use lots of thresholds
- **K-bins discretizer** ->[[Unsupervised Learning]] techniques to cluster data into K discrete groups (from 0 to K-1)
	![[Pasted image 20230121155913.png]]
	`sklearn.preprocessing.KBinsDiscretizer`
	several strategies could be used (uniform, quantile, means)
# Similarity/Dissimilarity and Proximity
- **SIMILARITY** -> Numerical measure of how alike are two data-objects, in $[0,1]$
- **DISSIMILARITY** -> opposite, no upper bound 
- **PROXIMITY**
# Distance methods
## Euclidean distance - $L_{2}$
It's a standard method to measure distance 
![[Pasted image 20230121163356.png]]
D is the number of dimensions (attributes), $p_{d}$ and $q_{d}$ are the d-th component of dataponts p and q (whose distance needs to be evaluated).
But this method is very sensitive to scale -> **SCALING IS NECESSARY**
$X_{1}^{scaled}=\frac{x_{1}-x_{1}^{min}}{x_{1}^{max}-x_{1}^{min}}$

## Minkowski distance - $L_{r}$
![[Pasted image 20230121164645.png]]
uses Minkowski's inequality theorem. Rescaling is necessary.
Different values of r makes different variations:
- r=1 -> manhattan norm ($L_{1}$)
- r=2 -> euclidean norm ($L_{2}$)
- r=$\infty$ ->   consider only the dimension where the difference is maximum ($L_{\infty}$)
## Mahalanobis distance
Decreases if, with the same euclidean distance, the segment connecting the points is along a direction of greater variation of data.
described by the covariance matrix
![[Pasted image 20230121165856.png]]
In the case below, the euclidean distance between AB and AC is the same, but $dist_{m}(A,B)>dist_{m}(A,C)$
![[Pasted image 20230121165922.png]]
in fact there are less datapoints between a and b (b is an outlier).
## Similarity between binary vectors
![[Pasted image 20230121170624.png]]
## Cosine similarity
Cosine of the angle between two vectors p and q
it's 0 if the're equal, 1 if perpendicular (max value)
![[Pasted image 20230121170732.png]]

## How to choose the right proximity measure
It depends on the kind of data:
- dense, continuous -> euclidean
- sparse, asymmetrix -> cosine, jaccard
# Correlation
_Numerical measures of linear relationships between two attributes_.
