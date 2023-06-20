_Estimates parameters of a statistical model to maximise its ability to explain the data_
![[Pasted image 20230125124553.png]]
The main technique is to use **mixture models** (mixture of different probability distributions),
usually, the **base model** is a multivariate normal.
Estimation is performed with **MLE**.

# Gaussian Mixture
## AKA Expectation Maximization
![[Pasted image 20230125124854.png]]
EXAMPLE:
![[Pasted image 20230125125016.png]]
each distributions has its own parameters
In this example we need to estimate 5 parameters: 2 for each distribution (mean and variance), and a proportion coefficient ($\alpha_{1}=1-\alpha_{2}$ )

## Gaussian Mixture vs KMeans
![[Pasted image 20230125125312.png]]
K-means doesen't take into account the distribution of data, performs worse in this case (it's non-parametric)