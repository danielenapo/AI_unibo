_We can condition the generation process by adding external input (prompts) in the form of class ID, image, text, and so on._
### Text conditioning
Can be implemented with Cross-attention between the flattened image and the encoded token sequence from the text prompt (using a [[Transformer]] encoder or [[CLIP]])
![[Pasted image 20240215173322.png]]
## Latent diffusion
The latent vectors of prompts are constrained to have the same dimensionality of the input/output images. 
Solution: compressor/decompressor like the Autoencoder
![[Pasted image 20240215173339.png]]
