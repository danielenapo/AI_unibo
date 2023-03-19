Edges are local features of images that campure important **semantic information**.
edges are pixels that lie exactly in between two or more different image regions (can be phisical objects).
![[Pasted image 20230319175005.png]]

# 1D Step-Edge
Sharp chamge of a 1D signal (line).
Those changes can be detected using **derivatives**.
The simplest edge detector uses a static threshold that is compared with the absolute value of the derivative in the given point. If it's over, it's considered as an edge.
![[Pasted image 20230319175316.png]]
The absolute values is needed since in 1D the edge can have 2 **directions**:
- Low to High (positive derivative)
- High to Low (negative derivative)
![[Pasted image 20230319175259.png]]
# 2D Step-Edge
Images are in 2D, so we are interested in 2D edge detection.
In this case, there are infinite possible directions:
![[Pasted image 20230319175650.png]]
In this case, the **gradient** is used (vector of the two partial derivatives).
Gradient's direction corresponds to the edge's direction. Again, a threshold is used.
![[Pasted image 20230319175848.png]]

## Discrete gradient approximation
Since pixel values are discrete, the following approximation eases the work:
We can use both backward and forward differences (both on x or y axes):
![[Pasted image 20230319190203.png]]
![[Pasted image 20230319190125.png]]