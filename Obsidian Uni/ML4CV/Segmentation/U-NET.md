_[[Segmentation#Fully Convolutional Network (FCN)]] for image [[Segmentation]], with a symmetric **encoder/decoder** architecture_
![[Pasted image 20240105174644.png]]
- It is similar to an **Autoencoder** network, transforming the original input in a low-dimensional format, then upscaling it back to the original size using [[#Transposed convolutions]].
- Divided in **stages**. for the decoder, each one doubles the channels and halves the resolution.
- The output feature map of every encoder stage has a **skip connection** that connects with the input feature of the corresponding decoder stage.
- Obtains very precise boundaries 
![[Pasted image 20240105175530.png]]
# Transposed convolutions
When [[Convolutional Layer]]s are applied with stride > 1, the original image gets **downsampled**.
![[Pasted image 20240105164829.png]]
If we instead want to **upsample** the image, we have to invert the shape of the kernel in order to do that. Convolutions are just sparse matrix multiplications:
![[Pasted image 20240105170922.png]]
By inverting the unrolled kernel (with the **transpose**), we can get the upsampled matrix.
![[Pasted image 20240105171243.png]]
When applying stride to transposed convolutions, the overlapping kernels gets summed to get the final pixel value
![[Pasted image 20240105174305.png]]
The use of transposed convolutions (also called deconvolutions), can produce **checkerboard artifacts** in the image.

