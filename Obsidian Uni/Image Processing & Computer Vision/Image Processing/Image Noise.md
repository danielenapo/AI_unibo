Images will have noise for different reasons. It is more noticeable on plain regions.
It can be seen as a random variable (normal distribution with zero mean):
![[Pasted image 20230309121149.png]]

# Denoising techniques
## Denoising over time
We can take multiple images of the same scene (assuming it's static), and make an average of the picels. With a sufficient high number of images, the mean of the noise will be approximately zero (by definition).
![[Pasted image 20230309121339.png]]

## Denoising over space
Using multiple images is impractical (scenes are not static, will cause motion blur):
we can take the mean over a neighborhood square of KxK pixels.
![[Pasted image 20230309121523.png]]