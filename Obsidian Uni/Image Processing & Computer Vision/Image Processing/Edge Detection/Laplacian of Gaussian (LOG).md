# Zero Crossing
instead of using first order derivatives, another effective way to extract edges in [[Edge Detection]], is using **second order derivatives**: instead of searching the peak of the 1st derivative, we now look for the zero crossing point of the 2nd.
![[Pasted image 20230327103325.png]]
## Laplacian
As second order derivative operator, we can use the Laplacian:
![[Pasted image 20230327103455.png]]
# LOG
LOG simply consist in applying a gaussian filter BEFORE applying the laplacian kernel to find zero-crossing points. In order, the operations are:
- appplying [[Gaussian Filter]]
- applying laplacian kernel
- extracting zero crossing points (the edges)

ideally, the laplacian operator would return something like this: [-10, 0, 20], where 0 is the zero-crossing point. This does not actually happen, so we get something like [-10, 20]. In this case, the pixel closest to zero is chosen as edge candidate (-10 in the previous example).

## Example
![[Pasted image 20230327111303.png]]
note: the higher the $\sigma$ of the gaussian filter, the fewer edges are detected.
Ovesall, it's still best to apply a small sigma (just for denoising), and then apply a threshold to filter out irrelevant edges.