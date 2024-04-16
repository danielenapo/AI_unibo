_Task that aims to predicts a category **for each pixel** of the input image, from a fixed list of pre-defined classes (like in [[Image classification]])._

![[Pasted image 20231117180118.png]]
There are different variations for this task 
- [[Semantic segmentation]]
- [[Instance segmentation]]
- [[Panoptic segmentation]]
Dataset labels (masks) are hard to obtain, since human labellers need to do a harder job in selecting carefully pixel-wise is class. 
# Pixel-wise IoU
The Intersection over Union score $IoU=\frac{area \ of \ union}{area \ of \ intersection}$ typically used for bounding boxes, can be generalized to **pixel-wise** segmentation masks:
- **Area of intersection:**
	$TP_{c}=\sum\limits_{images} \# \ pixels \ where \ y_{uv}=c \ \textbf{and} \ \hat y_{uv}=c$ 
	It's pixel-wise True Prediction count, counting where prediction and GT are both true
- **Area of union:**
	$\sum\limits_{images}(\# \ pixels \ where \ \hat y_{uv}=c + \# \ pixels \ where \ y_{uv}=c)-TP_{c}$
	(the + is the logical equivalent of "or")
	It's the exclusive or, counting where prediction and GT are different
![[Pasted image 20231226175129.png]]

## Slow R-CNN
[[R-CNN]] networks have been modified to solve segmentation, applying a sliding window to all positions of the image, assigning to its center pixel the class of its window.
It works but it's very **slow and inefficient**.
![[Pasted image 20231226181702.png]]
