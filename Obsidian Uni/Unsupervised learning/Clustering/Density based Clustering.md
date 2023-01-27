_Clusters data based on density_
![[Pasted image 20230124182950.png]]
SOLUTIONS:
- **grid-based** -> splits hyperspace into regular grids (**hyper-cube**), counts number of elements inside each one
- **object-centered** -> define a radius of a **hyper-sphere**, counts elements inside it

# DBSCAN
## Density Based Spatial Clustering od Applications with Noise
![[Pasted image 20230124183325.png]]
- p is a **border point**
- q is a **core point**
### Neighborhood
Define a hypersphere radius $\epsilon$. The neighborhood of a point are all the points in the hypersphere wchic center is that point (neighborhood is symmetric)

A **core point** is one that has more than `minPoints` points in its neighborhood (minPoints is a threshold value).

### density reachability
p is **density reachable** from q iff:
- q is core
- q is in the neighborhood of p
(not symmetric)

p is **density reachable** from q iff:
- q is core
- there is a sequence of $q_{i}$ points such that $q_{i+1}$ is directly density connected to q
(not symmetric)
![[Pasted image 20230125114156.png]]
### density connection
p is **density connected** to q iff there is a point s such that p and q are density reachable from s
(SYMMETRIC)

==A cluster is a maximal set of points connected by density==, border points not connected by density by any core point are labelled as _noise_.

## [[Hyperparameter]]s
$\epsilon$ and minPoints are Hyperparameters, can be found through grid search.
- **minPoint** -> minimum numbers of neghboors
	an empirical rule states that minPoints=2*D is often good
- **$\epsilon$** -> radius of the hypersphere defining the neighborhood
	can be guessed using KNN where K=minPoints

Also, datasets with clustering tendency, exhibit also a change of slope. search $\epsilon$ using grid search in that area
![[Pasted image 20230125120100.png]]

## Pros and Cons
- finds clusters on any shape (also concavities)
- It's robust with noise
- Separates outliers from data
- Doesen't need K (number of clusters) as parameter

- Computationally expensive
- Problem if clusters have varyinfg densities
- Very sensitive to hyperparameters choice

# Kernel Density Estimation (KDE)
_describe distribution of data by a function, overall density is the sum of **Kernel functions** associated with that point_
![[Pasted image 20230125123202.png]]
## Kernel function 
aka **influence functions**, must be symmetric and monotonically decreasing
[[Hyperparameter]] for setting the decreasing rate

# DENCLUE algorithm
![[Pasted image 20230125124359.png]]