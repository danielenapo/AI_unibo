_Predicts a category **for each pixel** of the input image, from a fixed list of pre-defined classes (like in [[Image classification]])._

![[Pasted image 20231117180118.png]]

# Pixel-wise IoU
Intersection over Union $Iou=\frac{area \ of \ union}{area \ of \ intersection}$ can be generalized to pixel-wise segmentation masks:
- **Area of intersection:**
	$TP_{c}=\sum\limits_{images} \# \ pixels \ where \ y_{uv}=c \ \textbf{and} \ \hat y_{uv}=c$ 
- **Area of union:**
	$\sum\limits_{images}(\# \ pixels \ where \ \hat y_{uv}=c + \# \ pixels \ where \ y_{uv}=c)-TP_{c}$
	(the + is the logical equivalent of "or")

# Kinect human pose estimation
The first commercial success of semantic segmentation was human pose estimation through XBox 360's Kinect. It only used classical ml techniques to reach this goal, by:
1) capture depth image (with sensors) and remove background from the bodies
2) classify each pixel into a body part with a [[Random forest]] classifier
3) estimate joint positions
![[Pasted image 20231117181746.png]]
The use of **synthetic data** was crucial to generalize to all kinds and shapes of bodies, while only using a handful of actors to record the movements (using motion capture data).
![[Pasted image 20231117182009.png]]
