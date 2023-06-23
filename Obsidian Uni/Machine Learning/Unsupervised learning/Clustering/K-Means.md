_Given an expected number of K clusters, iteratively tries to find their centers._

![[kmeans.gif]]
It's a type of **partitioning** cluster algorithm.

## Algorithms steps
1. K is given by input
2. random choice of K points as temporary centers
3. Each point will find its nearest center, and its labeled accordingly 
4. For each center, find the centroid of its temporary cluster points
5. Move center to the found centroid (encoding cluster points)
6. Repeat from 4 until there are no more changes

# Inertia and Distortion
K-means is used in data transmission to send less information (center of cluster instead of the whole cluster).
It's a **lossy encoding**, and we want to assure minimal distortion of information.
$$
Distortion = \frac{1}{n} \sum_{i=1}^n d(x_i, c_i)^2
$$
For the distortion to be minimal, it can be proved that $C_{encode}(X_{i})$ has to be the centroid of the points of the centroid.
It can also be proved that after a **finite** number of steps, the system will reach a stationary state, in fact **at each iteration step, the amount of distortion is reduced**.
**inertia** is the sum of the squared distances of samples to their closest cluster center (distortion but without mean)
$$ Inertia = \sum_{i=1}^n d(x_i, c_i)^2 $$
==It's not guaranteed that the ending state is the best possible==, so the starting point is important, and the algorithm could be performed different times in search of the best possible outcome.
![[Pasted image 20230124155911.png]]
(example of sub-optimal ending state)

Distortion and Inertia are calculated by **SSE (Sum of Squared Errors)**

## Choosing K
Also the choice of K is an important [[Hyperparameter]] to get higher performances.
Minimizing SSE (the distortion) is not a good way to find the optimal K value

### Elbow method
![[Pasted image 20230124172339.png]]
To choose the optimal value of K, train with increasing values, and the optimal one is the ==**elbow** --> maximum negative slope in the graph==.

## Outliers
KNN is very sensitive to outliers, since they influence badly the SSE (sometimes it's good to straight remove them)

## Pros and Cons
- It's **very efficient**, almost linear to data size

- requires K
- sensitive to outliers
- very sensitive to scale
- very sensitive to initial assignment of centers (several tries are needed)
- doesn't deal with noise
- not applicable to non-convex clusters (for that there's [[Density based Clustering]])