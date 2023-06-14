# Similarity/Dissimilarity and Proximity
- **SIMILARITY** -> Numerical measure of how alike are two data-objects, in $[0,1]$
	Computed with **simple matching coefficient (SMC)**
	$SMC=\frac{number-of-matching-attributes}{sum-of-all-attributes}$
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
- Simple Matching Coefficient: $SMC=\frac{number-of-matches}{number-of-attributes}=\frac{M_{00}+M_{11}}{M_{00}+M_{01}+M_{10}+M_{11}}$
- Jaccard Coefficient: $JC=\frac{number-of-11-matches}{number-of-non-both-zero-attributes}=\frac{M_{11}}{M_{01}+M_{10}+M_{11}}$
## Cosine similarity
Cosine of the angle between two vectors p and q
it's 0 if the're equal, 1 if perpendicular (max value)
![[Pasted image 20230121170732.png]]

## How to choose the right proximity measure
It depends on the kind of data:
- dense, continuous -> euclidean
- sparse, asymmetric -> cosine, Jaccard

# Correlation
_Numerical measures of linear relationships between two attributes_.
to compute correlation, standardize the two attributes, and consider the ordered of values in data records. compute dot product. range $[0,1]$
- correlation 0=absence of linear relationship
![[Pasted image 20230122124031.png]]
## correlation on nominal data
Using Symmetric uncertainty, entropy and **joint entropy**
![[Pasted image 20230122124830.png]]
