Finding Correspondance points between 2 or more images is crucial in [[Pinhole Camera model#Stereo correspondence]], to estimate depth in images, but also for many other applications in [[Computer Vision]], such as Panorama Stitching (need 4 corr. points), object detection, AR, robot navigation and odometry (SLAM), 3D reconstruction, and many more.

## Paradigm
There are 3 main steps to follow:
1. **Detection** -> finding **salient points** (aka feature points)
2. **Description** -> computation of a **descriptor**, based on neighbor pixels. It should be **invariant** to any type of transformation. 
3. **Matching** -> descriptors between images

Descriptors 