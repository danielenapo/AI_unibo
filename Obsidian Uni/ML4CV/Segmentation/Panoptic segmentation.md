_A subtask of image [[Segmentation]], which intersects [[Instance segmentation]] and [[Semantic segmentation]], by labeling each pixel with a category, and for "things" categories (i.e. persons, cars, relevant objects, ...) provides distinct IDs for each region._
![[Pasted image 20240116174633.png | 400]]
## Panoptic Feature Pyramid Network
It's a modification of the [[Instance segmentation#Mask R-CNN]], that:
- merges [[R-CNN#Feature Pyramid Network (FPN)]] feature maps to predict a segmentation mask
- Resolves inconsistencies between "things" and "stuff" masks
![[Pasted image 20240119160428.png]]
