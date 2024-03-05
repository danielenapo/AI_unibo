# Contrastive loss
Loss that aims to directly enforce a good clustered embedding.
It reaches this goal indirectly, by applying this formula for every pair of images:
![[Pasted image 20231222121726.png]]
$y^{i,j}$ tells us if i and j are the same person. We enforce a smaller loss for big distances with the minus sign.
To be less prone to overfitting, the **Hinge Loss** is applied for the case $y^{i,j}$=0:
![[Pasted image 20231222121949.png]]
It applies a margin _m_ to stop pushing away clusters of different classes, and reduce overfitting. Finally the equation is put as a single line by multiplicating y and 1-y to each term.

# Triplet loss       
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

# NT-Xent  (or N-pairs) loss
_Takes the output of the network for a positive example and calculates its distance to an example of the same class and contrasts that with the distance to negative examples. Said another way, the loss is low if positive samples are encoded to similar (closer) representations and negative examples are encoded to different (farther) representations._
It is often just referred as contrastive loss (even if it's not).
$L_{angular\_triplet}(A,P,N)=max\{0,\tilde f(A)^{T}\tilde f(N) - \tilde f(A)^{T} \tilde f(P)\}$  
Where $\tilde f(A)$ is the embedding of the anchor/template, and the products are the similarities (cosine).
![[Pasted image 20231224114035.png]]
To optimize at once distance from multiple negatives, we can extend the max to include multiple of them: $L_{angular\_triplet}(A,P,N)=max\{0,\tilde f(A)^{T}\tilde f(N_{1}) - \tilde f(A)^{T} \tilde f(P),\ ..., \tilde f(A)^{T}\tilde f(N_{n}) - \tilde f(A)^{T} \tilde f(P) \}$ 
We use softmax to predict probabilities of classes. Instead of using max (not differentiable), we can swithc to its soft approximation _logsumexp_:
![[Pasted image 20231224115903.png]]
To make the loss focus on a large set of negatives, we can introduce a temperature $\tau$, obtaining the normalized temperature-scaled cross entropy loss (NT-Xent)
![[Pasted image 20231224120045.png]]


