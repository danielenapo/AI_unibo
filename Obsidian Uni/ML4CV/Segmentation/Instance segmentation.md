_Image [[Segmentation]] subtask that treats different occurences of same classes as distinct instances, effectively being an intersection between [[Object detection]] and [[Semantic segmentation]]._
1) detects instances of objects of interest and classifies them
2) separates them from background (excluded from the final prediction)
![[Pasted image 20240116171252.png]]
## Mask R-CNN
It's a modification of the [[R-CNN#Faster R-CNN]] that
- improves [[RoIPool]] ([[#RoI Align]])
- adds a branch to the second stage to predict the segmentation mask on each RoI, realized as a small Fully Conv Network

### RoI Align
Avoids both quantizations, 
1) divides proposals into equally sized subregions (no grid snapping)
![[Pasted image 20240116172653.png]]
1) Samples feature values at regular gruds of points with bilinear interpolation
![[Pasted image 20240116172705.png]]
![[Pasted image 20240116172739.png]]
1) Max/average pooling the sampled features on each sub-region
![[Pasted image 20240116172751.png]]

## Mask head and loss
A small flat FCN is used to **predict a binary mask for each class** with 28x28 resolution, while in FCN the output is treated as a **multi-class problem**.

![[Pasted image 20240116173738.png]]

### Flexible design
This design could be extended and applied to other problems such as human pose estimation 