_Given an input image, we want to find all instances of a set of learned classes that appear in it, and for each one of them also output the **Bounding box** that surrounds the actual instance._
It's a problem much more difficult than classical [[Instance Detection]], since outputs are variable (there could be many instances), and we have to predict two kinds of information:
- categorical (class)
- spatial (bounding box)
![[Pasted image 20231024122800.png]]

Although there have been attempts to solve this task with classical methods like [[Viola Jones Detector]], the [[Deep Learning computer vision]] approaches like [[ML4CV/NN Object Detection/R-CNN]] have been proven to be much more effective.