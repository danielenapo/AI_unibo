[[R-CNN]] is an example of **two stage detector**:
- **STAGE 1**: feature extractor + FPN
- **STAGE 2**: [[RoIPool]] + classification + bb correction 

In commercial environments, often speed is preferred over accuracy. Since the first stage does most of the job, we can use the [[R-CNN#Region Proposal Network (RPN)]] to predict both class and final BB.
![[Pasted image 20231109123934.png]]
We can also keep the objectness score prediction, and use it to perform [[Non-Maxima Suppression (NMS)]]

There are countless variants of one-stage detectors
- **YOLO**:
	Stands for _"You Only Look Once"_
	- Custom backbone network (**DarkNet-53**) optimized to obtain both accuracy and speed
	- [[R-CNN#Feature Pyramid Network (FPN)]] for multi-scale detection
		But concatenates activations from different stages (hallucinations) instead of summing them.
	- Anchors size and aspect ratios are **not fixed**, but **learned** using [[K-Means]].
		Distance from the centroid (ground truth BB) is defined as: $1-IoU(BB_{GT},box)$.
- **[[RetinaNet]]**
- **[[CenterNet]]**
- **EfficientDet**: 
	Applies the idea of [[EfficientNet]] to [[Object detection]], scaling the baseline detection model up.
	
![[Pasted image 20231109163000.png]]
