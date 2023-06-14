_It's the tendency of visual processing to be confined to stimuli that are relevant to behavior_.
Our capacity to process the entire visual input is limited, so we only focus on small amount of information coming from the [[Retina]].

Objects in visual input compete for representation.
==Attention **biases competition** towards information that is currently relevant to behavior.==

Attention is useful for:
- selecting inputs to enter the working memory
- move eyes (gaze) for detail foveal analysis
- direct actions at the selected object
## Functional components
- Salience filters -> recognizing salient stimuli
- Competitive selection -> selects the important salient stimulus to enter the working memory
- Cognitive control -> regulates signal strengths of neural representation based on current goal 
![[Pasted image 20230606111424.png]]
# Types of Selective Attention
Different types of SA can be classified based on:
- How the stimulus catches attention
	- **top-down** -> consciously looking for it (_voluntary_)
	- **bottom-up** -> not looking for it, but "comes to eye" (_automatic_), due to physical properties of the stimuli (e.g movement, brightness, color) that are intrinsically salient (due to evolutionary reasons or learning).
- Properties of the stimulus
	- **space-based** -> based on spatial location or direction
	- **object-based** -> e.g. shape, color, form, properties of the stimulus.
- Eye movement
	- **covert orienting** -> moving attention and gaze together (looking at), evident
	- **overt orienting** -> move attention but not gaze (not looking at), not evident
## Salience and relevance map
![[Pasted image 20230606125144.png]]
- salience map is for bottom-up -> relevant for physical properties
- relevance map is for top-down -> relevant for behavior
# Attentional template
Competitive selection can be influenced by top-down mechanisms: the **attentional template** is a representation of relevant objects in the working memory, and it can be used to give competitive advantage to objects that match that description in the visual scene input.
## Cuing paradigm
**space-based** experiment:
An arrow cue indicates where the target is more likely to appear (not always true tho). Target detection is faster in the valid cue trials, and slower for the invalid
![[Pasted image 20230606164055.png]]
## Visual search paradigm
**object-based** experiment:
many shapes are presented but only one has to be searched. All the others are distractors. Efficiency decreases as the similarity between target and distractors increases.
![[Pasted image 20230606165517.png]]
In the left case, the target is bottom-up salient.
# Neural correlates
It has been shown that visual attention increases firing rates of neurons encoding the attended stimulus in every layer of the visual system (including [[Lateral geniculate nucleus (LGN)]]).
![[Pasted image 20230606171948.png]]
the right side RF (red circle) was monitored with electrodes. monkey had to alternatively pay attention to left or right.
V4 is much more active when stimulus is attended, also V1, but it's less evident
![[Pasted image 20230606173327.png]]
The same exact curve shows for **motion direction** (_non-spatial attention_) in the middle temporal area (MT).
### Gain models
Two mathematical models of the attention based neuronal activity enhancement were proposed:
1) Response gain -> attention has a multiplicative effect on response (constant factor)
2) **Contrast gain** -> attention increases sensitivity to constrast (sigmoid shape, maximum steepness in the center)
![[Pasted image 20230606175554.png]]
After experimenting with monkeys, it was evident that the contrast gain model is more correct: as stimulus contrast increased, attention effects decreased.
# Altered Receptive Fields
A monkey had to look at two stimulus (one effective, one ineffective), both in a single V4 neuron's receptive field measured by electrode. It had to pay attention to only one of them. 
In the first trial, it didn't have to pay attention.
- When the preferred stimulus (effective) was shown alone, response was high
- When the other (ineffective) was shown alone, response was low
- When both stimuli were presented, the response was an average 
![[Pasted image 20230607121509.png]]
In the second trial, it had to attend to one of them.
When both were present, and the monkey was asked to pay attention to the ineffective (green) stimulus, the response was like if the red one was not in the RF at all, even though it was there!
![[Pasted image 20230607155017.png]]
It's like if attention filters out unattended stimuli from the RF, or it shrinks the RF.

## Feed forward model
Given two input neurons, x1 and x1, one for an effective stimulus, another ineffective, are connected with neuron Y in v4.
One of them is attended (a1 for x1, a2 for x2), and attention has a multiplicative effect on the strength (excitatory or inhibitory).
![[Pasted image 20230607203018.png]]
Consequently, with attention the response of the cell is driven towards response that would be elicit if the attended stimulus were presented alone (as experiments show) -> ==Selective attention reduces inter neuronal correlations==.
### Population of neurons
By using an array of electrodes, it's possible to track together a cluster of V4 neurons. Responses of sensory neurons are variable
Through attention based experiments. attention reduced variability of single neurons, and ==decreased noise correlation== (amount of noise of a neuron cluster). This reduction can improve the signal-to-noise ratio of the population and make it easier to read out the relevant information.

# Bottom-up attention
Early low level layers of the visual field process the whole visual input in a parallel way, and then decompose it through an ensamble of feature filtering processes.
The various feature maps then feed into a **saliency map**, whose activity represents visual saliency, which can bias attention on the basis on the most salient bottom-up cues.
![[Pasted image 20230613111002.png]]
- **Popout** stimuli draw attention in a bottom-up manner
- **Conjunction** features are more difficult to locate, requires time and effort
![[Pasted image 20230613111220.png]]
V4 neurons show enhanced respone to popout stimuli.
Also, when recording signal in a single receptive field changing texture alignment, V4 activity got enhanced even if what changed was only the background outside the RF:
![[Pasted image 20230613112011.png]]

# Overt vs Covert
- **Overt attention** -> gaze and focus spatially aligned
- **Covert attention** -> changing attention without moving the eyes
![[Pasted image 20230613112643.png]]
## Premotor theory
The same neural mechanisms involved in directing spatial attention also guides saccade programming
### Frontal Eye Field (FEF)
![[Pasted image 20230613113253.png]]
FEF neurons receive input from visual areas and outputs to parts involved in saccade movement, but also returns feedback projections to much of the visual cortex.
### Presaccadic enhancement
Visual activity in brain regions is enhanced before an animal targets a RF stimulus wit eye movement (attention is shifted before saccade).
We can see that response in the RF is enhanced when preparing a saccade, compared to fixation.
![[Pasted image 20230613114839.png]]
It has experimentally proved that microstimulating electricallyt the FEF area changes both the attention and saccade behaviors, confirming premotor theory and the role of FEF. 
