_Generates a nested structure of clusters_
![[Pasted image 20230124181815.png]]

### APPROACHES:
- **AGGLOMERATIVE (bottom-up)**
	start -> each datapoint is a cluster
	iteration steps -> clusters are merged based on cohesion (**DISTANCE**)
	==most used method==
- **DIVISIVE (top-down)**
	start -> whole dataset is the only cluster
	iteration steps -> cluster with lower cohesion is split

### Output
- dendogram
![[Pasted image 20230124180928.png]]
- nested cluster diagram
![[Pasted image 20230124180945.png]]

# Cluster separation 
### Graph based
distance of sets is based on distance between datapoints
![[Pasted image 20230124181323.png]]
- **single link** -> the nearest
- **Complete link** -> the furthest
- **average link** 
### Protorype based
- Distance between centroids
- Ward's method (difference between total SSE in case of merge and original SSE)

# Single linkage algorithm
Uses the **agglomerative** approach to iteratively build clusters (based on single link distance to evaluate separation), outputs a dendogram.
Computes distance between two sets of items
![[Pasted image 20230124181704.png]]
After getting the final dendogram, the desired clustering scheme is obtained by **cutting the dendogram at some level** (the higher the level, the more classes)
![[Pasted image 20230124181956.png]]
Choice of cut level is a [[Hyperparameter]].

# Pros and cons
- High complexity (which also leads to poor scaling)
- there isn't a global objective function (local decisions), greedy approach

- Dendogram is great for result interpretation and visualization
- Empirically results are often good
