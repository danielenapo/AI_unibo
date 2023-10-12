The **Attention mechanism** allows to selectively focus on specific parts of the input data while performing a task by assigning weights to parts of the input.
It is partially bio-inspired from the [[Selective attention]] mechanism of our brain.
## Dot-product attention
![[Pasted image 20231012094948.png]]
1) **Similarity score**: dot product between input embeddings Y (original language) and output X (target language).
2) **Softmax** to compute attention weights, and make the values more stable
3) **Linear combination** of input embeddings and attention weights (wY)

## Scaled dot-product attention
![[Pasted image 20231012101904.png]]
- **Query, Key and Value**: 2 linear layers applied after the embeddings, to transform them, allowing to use attention with embeddings of different dimensionalities (and modalities, for multi-modal models).
- **Dot product** might become too large when dealing with high dimensional embeddings, and could saturate Softmax, leading to exploding gradients. To solve this, we divide by the square root of the number of key dimensions.
## Multi-Head Self-Attention
![[Pasted image 20231012104352.png]]
- **Self-attention**: Using the same sequence (input Y, i.e. the original language) to _generate both keys and queries_ (and values).
- **Multi-head**: split the keys, queries and values into H groups (number of heads), each computing its attention values in parallel (taking advantage of _GPU parallelism_), and concatenating them at the end, along the **channel** dimension. 
Ideally, each head extracts different kinds of information (like multiple filters in CNNs, working as an ensemble).
![[Pasted image 20231012104333.png]]
