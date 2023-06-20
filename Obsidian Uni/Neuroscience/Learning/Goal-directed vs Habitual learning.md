![[Pasted image 20230531171942.png]]
## Map vs response strategy
A rat solving a maze can learn (through [[Instrumental Conditioning]]) its path in 2 ways:
- By learning a cognitive map of the environment and the location of the reward -> simple training
- By learning by heart the sequence of turns that he has to make to reach the reward (forward+left+forward)  -> intensive training (overfitting basically)
![[Pasted image 20230531170816.png | 250]]
If the initial position of the rat changes, in the first case he's able to notice the difference and reach the reward anyway, in the second he turns in the wrong direction
![[Pasted image 20230531170919.png | 250]]

## Tolman's maze experiment
A special maze was built with doors and curtains that make the maze difficult to master for rats
![[Pasted image 20230531171109.png | 300]]
Three groups of rats were observed
- Group 1 recieved **no rewards** for solving
- Group 2 recieved **rewards** for solving
- Group 3 recieved **rewards only after 11 days**
Of course group 2 learned the fastest, but surprisingly group 3 learned much much faster than group 2 when presented with rewards. This suggest that they actually **latently learned** a cognitive map, but in a less efficient way since they had **no motivation**.
![[Pasted image 20230531171506.png | 650]]
==Latent learning confirmed the existence of cognitive maps.==


## Goal directed
- knowledge of relations between knowledge and consequences
- Outcome is motivationally relevant
- Complex thought process
- Very flexible to enviroment changes
- supported by the Dorsomedial Striatum
## Habitual
- Automatic behavior (because it has been rewarded in the past)
- Simple thought process, requires almost no thinking
- Not flexible to environment changes (learning by heart)
- Supported by Dorsolateral Striatum

### Testing behaviors
To test if a behavior is goal directed or habitual:
1. **Train** -> [[Instrumental Conditioning]]
2. Post-training manipulation -> reinforcer devaluation (make the reward less motivating, for example by giving a lot without reason) -> leads to **contingency degradation** (extinction)
3. **Test session** -> repeat the experiment, and check the behavior
	- If the action is performed less, the learning is goal-directed
	- If the action is performed in the same way, the learning is habitual
![[Pasted image 20230531172737.png | 400]]

## Human experiments
- In an experiment with devaluation of reward, humans have shown the same behavior expected for goal-directed learning
![[Pasted image 20230601150509.png]]
- When the volunteers were extensively trained on the same task, they instead showed signs of habitual learning
# Model based vs model free 
Recently a computational formalization was proposed 
- **model based** = goal directed-> when environment changes, the agent updates its policies (future state) values without changing them -> ==TREE SYSTEM==
- **model free** = habitual -> when environment changes, the agent has to experience the consequence of actions again many times to learn the new states -> ==CACHE SYSTEM==
![[Pasted image 20230601153103.png | 600]]
## Hybrid model in humans
Humans were tested through a 2-step Markov decision experiment, which consists in taking two consecutive binary choices, each one having different probabilities of reaching a particular state, and in the end they could get a reward
![[Pasted image 20230601153454.png]]
In a first session, some path were shown to the participants (no choices made, no rewards), and in a second one they were free to make choices to reach rewards. 
Results showed were best explained by an **hybrid model** between model based and free, both in behavior and MRI scans.
- reward Prediction Error -> model free
- state Prediction Error -> model based
![[Pasted image 20230601162150.png]]
==There is an **inter dependency** between goal directed and habitual systems in human brains, they may in fact act simultaneously and competitively==