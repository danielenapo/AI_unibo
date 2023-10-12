**Model capacity** indicates how complex/flexible a model is: e.g. a model with high capacity (like knn with k=1) perfectly fits all the training data, but overfits it, performing poorly with the test data.
![[Pasted image 20231002134039.png]]
An optical capacity should be found, in order to minimize test error. 

If we instead take into account linear regression, if a model with a high degree makes the assumption that the dataset can be fit by that degree, moreover a linear model makes the assumption that the dataset is linearly separable.
The best possible performance is limited due to its model **bias**
![[Pasted image 20231002134419.png]]
- **VARIANCE** varies on the training set, and it's due to the data
- **BIAS** depends on the model, and its assumptions on the data
There are also **irreducible errors** that are due to lack of information and  wrong or ambiguous labels.
![[Pasted image 20231002134645.png]]

![[Pasted image 20231002134709.png]]
The best approach in practice is to first overfit the network (reach low bias), and then apply [[Regularization]] to lower the variance (to bring down the test error).
# Learning rate
The [[Learning Rate]] itself is an [[Hyperparameter]] that deeply influences the learning process.
![[Pasted image 20231002135030.png]]
A good way is to change it during train, using a mixture of high and low values
## Step decay
Start with a high LR. After n epochs of plateau (loss is stable or worse), divide it by a factor of 10.
![[Pasted image 20231002135158.png]]
It's good to start with a high LR, since it allows to reach faster convergence, and overall allows to escape local minima.
Wide minima areas are preferable to narrow ones (even if deeper), because they allow to better generalize with unseen data.

- **Cosine rate schedule:**
Follows a cosine to decay the lr with epochs
- **Linear rate schedule:**
follows a linear function to monotically decrease the lr with epochs

## Warmup
starts with low lr (warmup), then goes to a big one and does [[#Step decay]].
![[Pasted image 20231002135626.png]]
Low LR at the start allows the parameter to reach sensible values, showing better results than standard step decay.

## One cycle
Modifies LR after each mini-batch (not epoch).
- exploration phase -> lr increases
- exploitation -> lr decreases
![[Pasted image 20231002140006.png]]

