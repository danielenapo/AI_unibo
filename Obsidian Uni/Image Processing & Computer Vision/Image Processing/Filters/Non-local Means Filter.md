==**non-linear** edge preserving smoothing filter, that exploits the similarity among patches spread all over the image to achieve denoising==
![[Pasted image 20230319173045.png]]
This kernel needs to be computed at runtime, and it's much slower than a simple linear filter.

- takes a mean of all pixels in the image, weighted by how similar these pixels are to the target pixel.

It effectively removes [[Image Noise#Gaussian Noise]], preserving edges quality.
RESULTS:
![[Pasted image 20230319173052.png]]
