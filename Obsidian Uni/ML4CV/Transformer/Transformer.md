Transformers are a [[Neural Network]] architecture, originally developed for [[Natural Language Processing]] (automatic translation) by Google, in the paper "Attention is all you need" (2017).
Transformers only rely on the [[Attention mechanism]], and use an **autoregressive** prediction mechanism.
![[Pasted image 20231012093118.png]]
Originally they were thought for automatic language translation:
When translating, we don't need to pay attention to the whole sentence, rather on few subset of words: Transformers compute weights for the contribution of each original words when creating each output words 
![[Pasted image 20231012093531.png]]
In the example above, to translate "the" in "la", the networks pays attention also to "area", which is feminine.
## Autoregressive inference
Attention is not computed directly on the input space, but on **embedding vectors**: inner representations of the inputs (e.g. tokens for text, or feature maps for images).
The entire output sentence is not available in testing, since we're trying to generate it.
We start form the embedding of a special _"Start of Sequence" token (SoS)_
After one pass forward, we predict the next token in the output sequence, and add it to the input vector, and repeat the process, until the special _"End of sequence" token (EoS)_ is generated.
This allows the input and output sequences to have different lenghts.
# Architecture
The Transformer is divided in **Encoder and Decoder**.
![video](https://www.youtube.com/watch?v=4Bdc55j80l8)
## Encoder
It's a stack of L identical encoder layers.
- **INPUT**: the input sequence (i.e. original language)
- **OUTPUT**: the last layer produces an internal representation (like Autoencoders), and passes it to all decoder layers
![[Pasted image 20231013191022.png]]
### Encoder Layer
![[Pasted image 20231012103638.png]]
1) [[Batch normalization#Linear Normalization]]
2) [[Attention mechanism#Multi-Head Self-Attention]]
3) add (skip connection) + linear norm
4) Feed forward dense network (one hidden layer 4 times larger than the input)
5) add (skip connection)

## Decoder
As the encoder, it's a stack of L identical decoder layers.
- **INPUT**: the output sequence (i.e. the target language)
- **OUTPUT**: the predicted token (in the target language) with Softmax activation
![[Pasted image 20231013191232.png]]
The input of the decoder network differs from train and test time, since it makes autoregressive predictions.

### Decoder layer
![[Pasted image 20231013192037.png]]
Uses both MHSA and [[Attention mechanism#Encoder-Decoder attention]] to combine the output sequence with the output of the last encoder layer. The rest of the structure is similar.

### Decoder at Test time 
At test time, the Decoder's input is just the SoS token. Each time the network makes a token prediction, the new token gets added to the input, until the EoS is generated (or the length limit is reached).
### Decoder at Train time
At training time, the whole ground-truth output sequence is available. We put the whole sequence as decoder input (shifted right to include the SoS token).
The predictions are compared with the unshifted ground truth, with Cross-Entropy loss.

### Masked self-attention
**Problem**: the tokens on the right are ground-truth data that might leak into the output through MHSA modules. 
**The net should never attend to future tokens!**
To solve this, the scores of the future tokens are set to $-\infty$, so that their weights become 0, effectively masking them.  

# Positional Encoding
Transformers are **equivariant to position**: if we permute the input sequence, the attention weights will remain the same (but permuted), then the MHSA will just be the same but permuted!
In language (but also with images), the positional embedding is very important (e.g. "john kills a bear" != "a bear kills john"), so we need to add it to the embeddings.
![[Pasted image 20231024115041.png]]

