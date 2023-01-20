_A weight is associated to each training instance, which will get iteratively modified according to classifier's performance (error rate)._
![[Pasted image 20230120161308.png]]
## Adaboost
Fit a sequence of weak learners, on modified versions of the data. Predictions are made by taking a **weighted majoriting vote**.
The single model weights are initially equal, then gets iteratively smaller/bigger depending on the error rate (during training).