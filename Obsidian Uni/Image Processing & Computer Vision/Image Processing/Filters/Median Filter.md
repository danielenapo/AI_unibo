**non-linear** filter where each pixel intensity is replaced by the **median** over a given neighborhood
![[Pasted image 20230319165559.png]]
It is **very effective** to contrast [[Image Noise#Impulse Noise]], while also preserving sharp edges (**no blurring**)
![[Pasted image 20230319165715.png]]
It cannot deal with gaussian noise: The best choice would be to combine them: first using a median and then the gaussian.

