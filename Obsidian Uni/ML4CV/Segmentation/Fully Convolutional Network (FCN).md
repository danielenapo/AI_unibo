
Processing the image pixel by pixel is very inefficient, need to look everything at once.
![[Pasted image 20231226182736.png]]
With this kind of architecture we get a small grid of predictions.
To convert this coarse spatial class scores into fine grained scores we need to **upsample**:
standard non-learned method like _Nearest Neighbor_ or _Bilinear Interpolation_ are not enough to obtain acceptable results:
![[Pasted image 20231226183348.png]]
We could upsample multiple activations at different resolutions, each at a different CNN stage, adding **skip connections** between the various upsampling outputs:
![[Pasted image 20231226183440.png]]
In this way we can combine various level of detail (different strides), obtaining a final good result.
Fine-tuning the backbone is essential to get real improvements with an increasing number of skips.

