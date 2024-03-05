_Set of techniques that allows a system to automatically discover the representations needed for feature  detection or classification from raw data._
![[Pasted image 20240305165800.png | 500]]
Organizing the embedding space is key: having nice clusters allows us to easily compute distances, and to better separate the different identities.
OBJECTIVE: 
- Distances (in embedding space) between elements of the same class need to be small.
- Distances (in embedding space)  between elements of different classes need to be large.

# Face recognition
Given a query face, solve a **one-to-many matching problem**.
Match should be robust to changes in facial expression, hair, aging, accessories (e.g. glasses, scarf, hat).
It's an **open-world problem**: need to handle the addition/removal of an identity.
![[Pasted image 20231215171203.png]]

With a classical architecture like [[Inception]], to add/remove a face we would need to retrain the model.
This is simply unfeasible with such large networks, but we can instead get rid of the classification layers, and work in **embedding space** (or "gallery"):
![[Pasted image 20231215171326.png]]
- If we want to **remove** a face we could just remove its embeddings from the embedding space. 
- If we want to **add** a face, we run the instances on the model and store its embeddings 
![[Pasted image 20231215171905.png]]

# Face verification
Organizing the embedding space is key: having nice clusters allows us to easily compute distances, and to better separate the different identities.
OBJECTIVE: 
- Distances (in emb. space) between elements of the same class need to be small.
- Distances (in emb. space)  between elements of different classes need to be large.

We can reach this by training the model to solve the **face verification** problem:
given two images, confirm they belong to the same identity.
This allows to learn better distances and better representations (clusterings).
![[Pasted image 20231215172638.png]]
## Siamese training
Use two versions of the same model, with shared weights. 
![[Pasted image 20231215172714.png]]
Run different instances on each model. The loss will depend on both embeddings.

# DeepFace
Face recognition network by Facebook.
1. **Preprocess** the image to extract and warp frontal faces
2. Extract the **embeddings** (trained first on a classification problem)
3. embeddings are **L2-normalized**: $f(x)=\frac{\bar G(x)}{||\bar G(x)||_{2}}$ where $\bar G(x)=\frac{G(x)}{max(G(x^{1:n}), \epsilon)}$ 
![[Pasted image 20231215173010.png]]
### Locally connected layers
DeepFace uses a [[VGG]], but substitutes the last two convolutional layers with locally connected layers.
[[Convolutional Layer]]s share parameters across rows.
Locally connected layers instead don0t share weights across different locations.
(This means they are not equivariant to translations and can't adapt to varying imput sizes)
![[Pasted image 20231215174155.png]]
This kind of convolution is applied since we want to better process **details** to compute better representation for faces.
Moreover, frontalized faces have the main features (eyes, mouth, nose, ...) roughly in the same positions, so loosing those invariance properties is not much of a problem.

DeepFace is trained first to solve face verification. Uses siamese training to solve the **binary classification problem** to decide whether the two photos belong to the same identity. 
![[Pasted image 20231215174805.png]]

## DeepID2
a face recognition network trained with a combination of cross-entropy loss and **contrastive loss**, with heavy test-time augmentation and post-processing to obtain a good embedding space.
![[Pasted image 20231215175627.png]]

## Contrastive loss
Loss that aims to directly enforce a good clustered embedding.
It reaches this goal indirectly, by applying this formula for every pair of images:
![[Pasted image 20231222121726.png]]
$y^{i,j}$ tells us if i and j are the same person. We enforce a smaller loss for big distances with the minus sign.
To be less prone to overfitting, the **Hinge Loss** is applied for the case $y^{i,j}$=0:
![[Pasted image 20231222121949.png]]
It applies a margin _m_ to stop pushing away clusters of different classes, and reduce overfitting. Finally the equation is put as a single line by multiplicating y and 1-y to each term.
## Triplet loss       
Triplet loss achieves the same goal by fulfilling both requirements at once for a triplet of images:
![[Pasted image 20231222123522.png]]
Problems: 
- does not guarantee large inter-class distances 
- risks training collapse
Again, **Hinge loss with margin** can solve those problems:
$L(A,P,N)=max  \{0, ||f(P)-f(A)||_{2}^{2}-||f(N)-f(A)||_{2}^{2}+m\}$        
![[Pasted image 20231222123820.png]]
#### Semi-hard negatives mining
The most important part now is to form effective triplets, the **choice of negative examples** is key:
Since for most of the triplets the constraint of the loss is already satisfied, we want to compute the loss mostly on the **semi-hard negative** cases that contribute to learning:
$||f(P)-f(A)||_{2}^{2} \le ||f(N)-f(A)||_{2}^{2} \le ||f(P)-f(A)||_{2}^{2}+m$        
Those examples are the ones **on the margin edge** (thus they are not the hardest negatives since they would lead to poor training).


# ArcFace
Since embeddings are always normalized, they lie on a hyper-sphere
- similarity can be expressed with an anglular measure, like cosine similarity
- classification with softmax becomes a better pre-training objective
![arcface](https://www.youtube.com/watch?v=2Vc_qwkv6uE)

![[Pasted image 20231224104740.png]]
If the weights in the last FC layers are normalized column-wise, the last layer computes angular distances between templates and embedding.
By adding a constant penalty to the angle formed with the correct class template, the **embeddings cluster along those templates**.
![[Pasted image 20231224113233.png]]
## N-pairs/NT-Xent loss
It is often just referred as contrastive loss (even if it's not).
_Takes the output of the network for a positive example and calculates its distance to an example of the same class and contrasts that with the distance to negative examples. Said another way, the loss is low if positive samples are encoded to similar (closer) representations and negative examples are encoded to different (farther) representations._
$L_{angular\_triplet}(A,P,N)=max\{0,\tilde f(A)^{T}\tilde f(N) - \tilde f(A)^{T} \tilde f(P)\}$  
Where $\tilde f(A)$ is the embedding of the anchor/template, and the products are the similarities (cosine).
![[Pasted image 20231224114035.png]]
To optimize at once distance from multiple negatives, we can extend the max to include multiple of them: $L_{angular\_triplet}(A,P,N)=max\{0,\tilde f(A)^{T}\tilde f(N_{1}) - \tilde f(A)^{T} \tilde f(P),\ ..., \tilde f(A)^{T}\tilde f(N_{n}) - \tilde f(A)^{T} \tilde f(P) \}$ 
We use softmax to predict probabilities of classes. Instead of using max (not differentiable), we can swithc to its soft approximation _logsumexp_:
![[Pasted image 20231224115903.png]]
To make the loss focus on a large set of negatives, we can introduce a temperature $\tau$, obtaining the normalized temperature-scaled cross entropy loss (NT-Xent)
![[Pasted image 20231224120045.png]]


