Stands for _Contrastive Language-Image Pre-training_, from OpenAI.
_Metric learning can be used to extend classification to open-world problems, doing **zero-shot classification**, i.e. perform well on a test dataset without having access to its training set at train time._
The most effective way is using **natural language supervision** using [[Natural Language Processing]] techniques to pair image and text embeddings.
It's much easier to scale natural language supervision compare to crowd-sourced labeling since it doesn't require one-hot encoded annotations.

### WIT dataset 
They also introduced the **WebImageText (WIT) dataset**, using 400M pairs of images with their captions, (from the ALT property of their HTML tags).
Those description can either be basic or really detailed.
![[Pasted image 20231224122443.png]]
### Architecture
The basic idea is to embed both the images and the text captions in the same embedding space, so that the representation of an image and its description (or a cluster of similar words) are spatially close together.
![[Pasted image 20231224180429.png]]
It then uses [[Metric Learning#N-pairs/NT-Xent loss]] on each column/row of the matrix:
![[Pasted image 20231224180258.png]]
- **Text embedding**: [[Transformer]] model
- **Image embedding**: they tried both [[Vision Transformer (ViT)]] and [[ResNet]], but the ViT encoder performed the best, since it is more efficient on training, thus it's more successful to scale.
### Zero-shot CLIP prediction
1)  create a dataset of possible text labels 
2) encode both the text labels list and the query image
3) use the embedding space as a lookup table, where the closest text label (embedding) that matches the image embedding is the final prediction. 
![[Pasted image 20231224181434.png]]
As a result, CLIP is also more robust to distribution shifts of a dataset than the classical models (like [[ResNet]]) specifically trained on that dataset.
![[Pasted image 20231224181635.png]]
### CLIP as loss
CLIP models can also be used as loss functions for [[Image generation]] models, to enable text conditioning.
![[Pasted image 20231224182120.png]]