*Generative Adversarial Networks (GAN) by Ian Goodfellow et al., 2014.*
*It's an [[Image generation]] model that trains two adversarial models*
- ***Generator**: the final image generator that generates synthetic images. Its goal is to fool the discriminator*
- ***Discriminator**: image classificator that aims to distinguish between synthetic and real images.*
![[Pasted image 20240213175900.png]]
# Adversarial loss
It's a **minmax game** between the two rivals:
- **DISCRIMINATOR (D):**
Solves a _binary classification task_, thus minimizes the Binary Crossentropy Loss (BCE):
$$BCE(\hat y, y)=-ylog\hat y -(1-y)log(1-\hat y)$$
Where 1=real, 0=fake, the optimal $\phi^{*}$ parameters for D are chosen as:
$$argmin_{\phi}\{
-\frac{1}{I}\sum\limits_{i=1}^{I}logD(x_{i}; \phi) 
-\frac{1}{J}\sum\limits_{j=1}^{J}log(1-D(\hat x_{j};\phi))\}$$
- **GENERATOR (G):**
Needs to fool the discriminator, thus should maximize the value function that the rival is trying to reduce:
$$\theta=argmax_{\theta}\{
min_{\theta}[-\frac{1}{I}\sum\limits_{i=1}^{I}logD(x_{i}; \phi) 
-\frac{1}{J}\sum\limits_{j=1}^{J}log(1-D(G(z_{j}; \theta);\phi))]\}$$
# Training
Need to jointly train both D and G:
1) Sample a random minibatch of latent vectors for D: $z_{1}, ..., z_{J}$
2) Generate a batch of random images from them: $\hat x_{J}$
3) Sample a batch of real images: $x_{i}$
4) Merging the minibatches of images (real and fake), optimizing the two [[#Adversarial loss]]es with SGD:
	- $L_{D}(\theta)=-\sum\limits_{i=1}^{I}logD(x_{i}; \phi) -\sum\limits_{j=1}^{J}log(1-D(\hat x_{j};\phi))$ to update D
	- $L_{G}(\phi)=\sum\limits_{j=1}^{J}log(1-D(G(z_{j}; \theta);\phi))$ to update G
The optimal generator will be achieved when $p_{real}(x)=p_{gen}(x)$ for each x.
In practice this could not happen since D and G have finite capacity

# DCGAN
_Deep Convolutional [[GAN]]_ uses a fully convolutional network in a symmetric structure similar (but inverse in dimensions) to [[U-NET]].
![[Pasted image 20240215161928.png]]
Allowed operations and interpolations in the embedding space, showing that has a well-behaved embedding space
![[Pasted image 20240215162040.png]]
# StyleGAN
Inspired from the style-transfer architectures, shows a very high level of realism and it's good in disentangling.