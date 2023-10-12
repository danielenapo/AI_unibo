Transformers are a [[Neural Networks (MLP)]] architecture, originally developed for [[Natural Language Processing]] (automatic translation) by Google, in the paper "Attention is all you need" (2017).
Transformers only rely on Attention blocks, and use an **autoregressive** prediction mechanism.
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
![[Pasted image 20231012103638.png]]
1) Linear norm
2) [[Attention mechanism#Multi-Head Self-Attention]]
3) add (skip connection) + linear norm
4) Feed forward dense network (one hidden layer 4 times larger than the input)
5) add (skip connection)
### Linear Norm
Unlike [[Batch normalization]], Linear normalization normalizes each input vector (i.e. each training sample) in isolation, so that each vector has zero mean and unit variance, regardless of other batch elements.
![[Pasted image 20231012104735.png]]
![[Pasted image 20231012104936.png]]
