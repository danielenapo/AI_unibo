_The goal of **Metric Learning** is to learn a representation function that maps objects into an embedded space. The distance in the embedded space should preserve the objects’ similarity — similar objects get close and dissimilar objects get far away._
![[Pasted image 20240305165800.png | 500]]
# Face recognition
One of the first applications of metric learning was for face verification and recognition:
given a query face, solve a **one-to-many matching problem**.
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

# ArcFace
Since embeddings are always normalized, they lie on a hyper-sphere
- similarity can be expressed with an anglular measure, like cosine similarity
- classification with softmax becomes a better pre-training objective
![arcface](https://www.youtube.com/watch?v=2Vc_qwkv6uE)

![[Pasted image 20231224104740.png]]
If the weights in the last FC layers are normalized column-wise, the last layer computes angular distances between templates and embedding.
By adding a constant penalty to the angle formed with the correct class template, the **embeddings cluster along those templates**.
![[Pasted image 20231224113233.png]]
