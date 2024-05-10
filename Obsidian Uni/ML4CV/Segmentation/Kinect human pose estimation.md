The first commercial success of [[Segmentation]] was human pose estimation through XBox 360's Kinect. It only used classical ml techniques to reach this goal, by:
1) capture depth image (with sensors) and remove background from the bodies
2) classify each pixel into a body part with a [[Random forest]] classifier
3) estimate joint positions
![[Pasted image 20231117181746.png]]
The use of **synthetic data** was crucial to generalize to all kinds and shapes of bodies, while only using a handful of actors to record the movements (using motion capture data). This process was iterated multiple times to get a perfect dataset.
![[Pasted image 20231117182009.png]]
### Simple depth comparison features
Similar to [[Edge Detection]], but with depth.
At each pixel location p, compute **simple depth comparison features** given by Depth D and Offset $\theta$
![[Pasted image 20231226175351.png]]
![[Pasted image 20231226175449.png]]
Offsets are **depth invariant** thanks to the normalization argument.
This property is necessary to ensure the same world offset is applied to compute the same distances between different body parts at different distances (e.g. chin-nose distance should be the same even if  the subject is further away)
![[Pasted image 20231226180024.png]]

## Random forest
[[Decision Trees]] can handle missing values and diverse ranges, but that generalize poorly: they are **low bias, high variance** ([[Bias vs Variance]])
To solve this issue, using an [[Ensemble]] of multiple trees (a [[Random forest]]), averages the single results **reducing variance** (the errors of single trees will be averaged out, like noise in [[Mean Filter]]).
![[Pasted image 20240510103448.png]]
- fast to train and test
- parallelizable
- variance across trees can provide confidence on estimates
- high interpretability (explainability)
- Robust and easy to tune 
- Uses **Bagging** to improve performance

![[Pasted image 20240510103516.png]]
