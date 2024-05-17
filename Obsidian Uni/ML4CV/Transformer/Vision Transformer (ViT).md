_[[Transformer]]s have been brought to [[Computer Vision]] unchanged, by just adapting the input: from tokens of words to tokens of image patches (aka **"visual words"**)._
Directly using pixels would have been unfeasible for memory reasons, and also not effective, since single pixels are redundant and not as informative rich as words or sub-words tokens.

Much like [[Bag of words]], the best way is using patches of the full image, and feed them as tokens to the unchanged Transformer.
![[Pasted image 20231024115630.png]]
For [[Image classification]], one extra token ("**CLS**") has been added to represent the class prediction (similarly to how te BERT architecture works).
![[Pasted image 20231024115946.png]]
### ViT vs CNN
Compared to [[ResNet]], the ViT reach similar results when given big datasets, but performs poorly with smaller datasets (standard ImageNet).
That's because they don't use [[Convolutional Layer]]s, so they can't rely on the inductive bias. Although, Transformers can scale better than CNNs with huge datasets thanks to the [[Attention mechanism]].
![[Pasted image 20231024121307.png]]

Moreover, the feature extracted by the ViT are similar to the ones that CNNs look for.
![[Pasted image 20231024121754.png]]

The biggest advantage of ViT though, is that it is a **multimodal** network, since it is able to deal simultaneously with different modalities of data (i.e. image and text), being able to perform tasks impossible to do with CNNs alone (like image description).