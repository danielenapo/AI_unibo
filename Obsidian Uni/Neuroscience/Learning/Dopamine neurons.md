_[[Neurons]] that release **dopamine** neurotransmitters, which gives prediction error rewards, and are responsible for [[Learning#Associative]]_
![[Pasted image 20230412135307.png]]

Dopamine neurons change their firing rate when [[Surprise#Prediction error]]s do not meed reality:
- Increase rate when error is positive
- Decrease rate when error is negative
# Dopamine
Dopamine is a **neuromodulator**: a neurotransmitter having effects other than (or in addition to) direct neural excitation or inhibition. 
## Dopaminergetic pathways
1. **Nigrostriatal pathway** -> originates in substantia nigra, critical for movement
2. **Mesolimbic pathway** -> originates in Ventral tegmental area (VTA)
3. **Mesocortical pathway** -> originates in VTA and extends in the cortex
The last 2 are essential for reinforcement learning.

## Experiments
By looking at the rat's brain, the most rewarding effect came from directly exciting dopamine pathways (via electric stimulating those areas).
![[Pasted image 20230531151857.png]]
By giving food to a monkey and registering its neuronal activity (dopamine pathway), it's evident that the biggest response is given when the monkey first acknowledges the presence of food (reward).
![[Pasted image 20230531152332.png]]
The firing rate can signal the **magnitude of the reward**: in the figure below, increasing amount of reward were given, and the firing rate increments with reward amount.
![[Pasted image 20230531152447.png]]
![[Pasted image 20230531152856.png]]
- **Before learning**: dopamine firing rate increases when (unexpected) reward is presented, remains constant during CS (uninformative).
- **After learning**: dopamine firing rate increases when CS is presented and
	- If reward is given, rate is constant (successful prediction, no prediction error update)
	- If reward is not given, rate is lower when the reward was expected (incorrect prediction, extintion begins)
![[Pasted image 20230531153357.png]]
The figure above better shows how dopamine neurons firing change when a CS is learned.
This supports the theory of [[Surprise#Blocking]]: learning is not performed if already a CS was learned
![[Pasted image 20230531153945.png]]
In general, the more likely the CS predicts a reward, the higher the firing rate after the CS.
Respectively, the less likely CS predicts a reward, the higher the firing rate after the US.

In the case of maximum uncertainty, the dopamine firing increases linearly after the CS is presented:
![[Pasted image 20230531155331.png]]

==In summary, dopamine neurons don't broadcast a reward signal, rather a prediction error one.==
- Dopamine doesn't make us feel good, but rather make us learn how to find things that make us feel good!
- Dopamine response can be described by the simple difference between obtained and predicted reward. 
- Occurs pretty much in the way used in the [[Surprise#Rescolra-Wagner model]]
- They respond only to rewards that differ from their prediction

In humans we can see the same thing.
Furthermore, pharmacological evidence shows that certain drugs have the ability to enhance or reclude dopaminergetic functions (and thus the ability to learn conditioned stimulus)
![[Pasted image 20230531162024.png]]
Initially, partecipant didn't know which stimuli gives money (50% chance).

Overtime they learn, but L-dopa partecipants learn faster. Haroperidol partecipants learn slower than those who took placebo

On the lowerpart they overlap though -> **drugs affect mostly learning through rewards, but does not affect much learning from punishment**

Using drugs effectively changed the behaviour (related to dopamine neurons)
## Actor-critic model
![[Pasted image 20230531162434.png]]
 