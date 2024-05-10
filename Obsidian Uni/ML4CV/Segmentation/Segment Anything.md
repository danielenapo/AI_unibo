_A **Foundation Model** for image [[Segmentation]], by META AI "FAIR" research lab (2023), able to perform **Zero-Shot transfer learning**._
The paper introduces:
- [[#Promptable Segmentation]] (task)
- SAM (model)
- SA-1B (dataset)
### Promptable Segmentation
![[Pasted image 20240311111027.png | 400]]
Solves a new Task: **Promptable image segmentation**.
Given an input image and any prompt, for example:
- point -> (x,y) coords
- Bounding box -> corner coords $((x_{topl}, y_{topl}),(x_{bottomr}, y_{bottomr}))$
- text -> tokens
- dense mask 
predicts multiple masks (for disambiguation) and a confidence score for each 
# SAM 
![[Pasted image 20240311114840.png]]
## Image encoder
Uses a MAE (Masked Auto-Encoder) pre-trained [[Vision Transformer (ViT)]] for the input image's encoding.
MAE masks random patches of the image and trains the ViT to reconstruct them (**self-supervised** pre-training).
![[Pasted image 20240311114459.png | 500]]
The decoder is thrown away after pre-training, keeping only the encoder.
## Prompt encoder
Each kind of prompt uses its encoder:
- Point and Bounding box coordinates -> positional encoding
- Dense mask -> CNN 
- Text -> [[CLIP]]'s text embedding
## Lightweight mask decoder
Takes inspiration from Transformer segmentation models, and is similar to a standard [[Transformer#Decoder]].
Predicts 3 segmentation masks and IoU scores (confidence) for each of them, using token to img and img to token **cross-attention**.
![[Pasted image 20240311115358.png]]
## Loss
- **IoU head:** MSE
- **Mask head**: linear combination (20:1) of
	- **Focal Loss** ([[RetinaNet#Focal loss]])
	
	- **Dice Loss**
	measure of the dissimilarity between the predicted segmentation and the true segmentation of an image.
	$$DiceLoss(𝑦,𝑝̅ )=1−\frac{2𝑦𝑝̅ +1}{𝑦+𝑝̅+1}$$
	Which is actually the inverse of the Dice Similarity Coefficient
![[Pasted image 20240311115756.png]]
%%TODO: understand why focal loss is used for the mask head%%
%%is loss computed pixel-wise??%%
# SA-1B
They built the biggest segmentation dataset, by keeping the [[#SAM]] model itself in the loop.
![[Pasted image 20240311120301.png | 400]]
The model was iteratively trained: as it improved, the gathering process became increasingly automated.
![[Pasted image 20240311120241.png | 400]]
Dataset is diverse and well distributed, also spatially for the masks:
![[Pasted image 20240311121210.png | 400]]

# Zero-Shot transfer
_Zero-shot transfer is the ability of a model to generalize, performing well on unseen dataset or tasks._
4 different successful experiments are proposed in the paper
1) Edge detection
2) Segment everything (object proposal generation)
3) Segment pre-detected object (instance segmentation)
4) segmenting object from free-form text (i.e. unstructured, natural)
### Zero-Shot Edge detection
### Zero-Shot Text-to-Mask

# Foundation model
_Models trained on **broad data** at **scale**, adaptable to a wide range of downstram tasks (via fine-tuning)._
SAM is a first attempt of creating a foundation model for image segmentation, capable of [[#Zero-Shot transfer]] and fine-tunable on specific narrow tasks.


