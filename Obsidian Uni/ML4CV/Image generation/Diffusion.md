_[[Image generation]] model that works by iteratively denoising random latent vectors in multiple steps. _
- Easier to train and has higher resolutions
- Slower inference since takes multiple denoising steps
- No direct mapping between latent vectors and generated image 
![[Pasted image 20240215163300.png]]
Diffusing means adding noise to an image.
We want to perform the reverse process: starting from the timestep $X_{T}$ of pure noise, we generate at each step some latent vectors which represent the **noise to remove**, until $X_{0}$ is reached (original, clear image).
![[Pasted image 20240215165514.png]]
## Forward process 
_Adding random noise to images._
Noise is generated as [[Image Noise#Gaussian Noise]], and it's modelled according to:
$$x_{t}=\sqrt{1-\beta_{t}}x_{t-1} + \sqrt{\beta_{t}}\epsilon_{t}$$ where $\epsilon_{t}=N(0;I)$, and $\beta_{t}$ is an [[Hyperparameter]] that follows a **noise schedule**.

Thus $x_{t}$ can follows a normal distribution with mean $\mu=\sqrt{1-\beta_{t}}x_{t-1}$   and variance (covariance matrix) $\Sigma=\beta_{t}I$.
It's a **Markov chain** process, since $x_{t}$ only depends on its predecessor $x_{t-1}$.
## Reverse process
_Removing noise from a random image ([[Image generation]] process)._
It is performed by applying the Bayes rule iteratively to get $x_{t-1}$ given $x_{t}$:
$$q(x_{t-1}|x_{t})=q(x_{t}|x_{t-1})\frac{q(x_{t-1})}{q(x_{t})}$$
But we miss $q(x_{t-1})$ and $q(x)$.
The objective of the neural net is to learn the markov chain of probabilistic mappings from latent $x_{T}$ to the image $x_{0}$, learning the mean of the normal distribution that generated $x_{t}$: $\mu_{t}(x_{t}; \phi_{t}), ~ \forall ~ t=T,..., 1$   
# Training
to find $\theta$, we need to maximize the log likelihood of the real images $\{x_{0}^{i}\} _{i=1}^{I}$
![[Pasted image 20240215172543.png]]
### Evidence Lower Bound (ELBO)
The full marginalization is too big to compute, but we can define a **lower bound on the log likelihood**, and optimize the parameters to maximize such bound.
![[Pasted image 20240215172737.png]]
We can define the bound by means of **Jensen's inequality**:
![[Pasted image 20240215172817.png]]
![[Pasted image 20240215172837.png]]
![[Pasted image 20240215172847.png]]
# Loss

# Architecture
The neural network architecture is the [[U-NET]] with self-attention ([[Attention mechanism]]) and time conditioning
![[Pasted image 20240215173040.png]]
![[Pasted image 20240215173049.png]]


