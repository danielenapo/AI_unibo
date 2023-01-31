Evaluation for [[Clustering]] is crucial since it's [[Unsupervised Learning]], and we don't have a-priori informations (labels).
For high dimensional data, clusters can't be examined visually, so measures are the only tool.
![[Pasted image 20230124162733.png]]

# Measurement criteria
A good clustering should have these characteristics:

## **COHESION** 
proximity of objects in same cluster should be high
Given by the sum of proximities ([[Distance methods#Similarity/Dissimilarity and Proximity]]) between the elements of the cluster and the geometric center, which can be:
- **CENTROID** -> average of the cordinate of all cluster points (not a dataset element itself)
- **MEDOID** -> dataset element whose average dissimilarity with every other cluster point is minimal

## **SEPARATION BETWEEN CLUSTERS** 
different clusters needs to be far from each other, there are different ways to measure
- distance between nearest object in the two clusters
- distance between most distance objects in the two clusters
- distance between [[Clustering#Centroid]]s of the two cluster (or medoids)
	![[Pasted image 20230124163048.png]]
**Sum of Squares Beween Clusters (SSB)**
![[Pasted image 20230124164832.png]]
Is the squared sum between class centroids and global centroid (centroid of whole dataset)

**Total Sum of Squares (TSS)** = SSE + SSB
(SSE is sum of squared error, which is squared sum of clusterpoints to centroid)

To separate clusters, ==the goal is minimizing SSE (= maximise SSB)==.

# Silhouette score
_Clustering evaluation score that ranges from -1 (very bad) to 1 (good), takes into account **sparsity** ($a_{i}$) and **separation** ($b_{i}$)_
==the higher the better==
![[Pasted image 20230124172249.png]]
Silhouette score of a single datapoint $x_{i}$:
![[Pasted image 20230124165600.png]]
If b>>a -> good cluster (bad otherwise)
if $S_{i}<0$, it could mean that datapoint i has been badly classified (common for outliers)

Silhouette gives better results than Inertia to estimate K in [[K-Means]], using the [[K-Means#Elbow method]].
![[Pasted image 20230124172954.png]]
But silhouette is much more computationally expensive than Inertia.

# Gold standard
_A partition of the dataset similar to the data to be clustered, defined by a labelling sheme $y_{g}()$_
Obviously is applicable only if the true groupings of data are known.
It's a [[Supervised Learning]] technique to measure clustering.

By comparing the clustering algorithm's results to the gold standard, it's possible to assess how well the algorithm is able to recover the true groupings of the data.

### [[Classification]]-oriented measures
measures how the fold standard classes are distribuited among the clusters (uses [[Classifier Evaluation]] methods such as precision, recall, ...)

### Similarity-oriented measures
![[Pasted image 20230124175536.png]]
