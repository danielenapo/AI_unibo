[[Pavlovian conditioning#Timing]] has an important role in classical, associative learning.
# Contiguity
The closest the CS and US are in time, the more effective the learning. This concept is known as **contiguity** (closeness in time/space between CS and US)
![[Pasted image 20230530161234.png]]

# Hebbian Plasticity
To understand why contiguity is important, Hebbs stated that _=="Neurons that fire together, wire together"==_, meaning that when a cell persistently activates another one nearby, the connection between them becomes stronger.

This can be seen in the case of sensitization in Aplysia: by applying US and CS at the same time to different sensory neurons, it is possible to sensitize the conditioned response by making its connection to the motor neuron stronger thanks to the US.
![[Pasted image 20230530180725.png]]
# Contingency
contiguity is not sufficient in some cases.
![[Pasted image 20230530181055.png]]
In this example, in group 2 the CS is seen as a random stimulus, even if every time it concides with the US -> it does not give informations about when the US is going to happen, since most of times it does not.
![[Pasted image 20230530181157.png]]
In this example, 40-60 probability is not enough to be percieved as informative (almost random). In the second case, the shock is more probable to appear when the bell rings, so it generates a CR.
In this case, temporal contiguity is not the key, but rather the information and the ==**causal relationship**== that is being perceived.
## Blocking
No learning occurs to a stimulus if it's combined with a previously conditioned stimulus:
![[Pasted image 20230530181700.png]]
In this case, the light is a **redundant information**, which does not add any value (does not bring surprise), and is not learned.
This is called **blocking effect**.
# Prediction error
In the above case, neither contiguity and contingency were sufficent to learn the CS. In fact, it ends up that **we only learn from surprising/unpredictable events**.
![[Pasted image 20230530182333.png]]
Error signals measures the difference between the outcome and the predictions (like loss functions in [[Neural Networks (MLP)]]), and this prediction error is necessary for associative learning
## Rescolra-Wagner model
It's a mathematical formalization of the learning theories, based on prediction error.
It states that change in value is proportional to the difference between predicted and actual outcome.
![[Pasted image 20230530184348.png]]
- $R_{t}$ is the US value: 1 if delivered, 0 if not
- $V_{t}$ is the expectancy value at time t (calculated in the last time step t-1 and will be updated in t+1)
- $\delta_{t}$ is the prediction error, which in the brain is given by [[Dopamine neurons]]
![[Pasted image 20230530184557.png]]
The curve obtained is the same experimentally induced by classical conditioning. changing the learning rate $\alpha$ changes the slopes.
![[Pasted image 20230530185847.png]]
Brains always make predictions to make sense of the world, often being fooled by them: it's important to remember that **CORRELATION IS NOT CAUSATION**.