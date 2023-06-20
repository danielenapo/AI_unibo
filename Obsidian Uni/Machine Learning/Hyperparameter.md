_Every [[Machine Learning]] algorithm has one or more parameters that influence its behaviors, that needs to be **tuned**._

Several train/test loops are necessary to find the best combination of hyperparameters.
Those loops can be too much computationally expensive.

## Tuning
Data has to be split in
- Train data
- Test data
- Validation data (parameters tuning)

but data is limited, so we need a way to balance the splits:
- ### Holdout 
	simple split in test and train sets, divide with a certain ratio (ex 60/40), data should be assigned as randomly as possible (each subset should be representative of the real world)
	- **Holdout with validation**
		splits in test, train and validation sets. Useful for testing hyperparams.
		Iterate for each hyperparam combination to test, and use validation set to test accuracy. Take the best combination at the end, and perform final test on the test set
- ### Cross-validation (**K-FOLD**)
	_It's a technique to obtain a good estimation of the performance in [[Classification]] when it will be used with data different from the training set._
	Training set divided into K subsets ("folds" or "chunks"), perform k iterations of train where the k-th chunk is the test set, and the other are for train.
	==at each iteration, hyperparameters can be changed==
	At the end, combine all the test results (ex average), then use the whole training set to train the final model.

	![[Pasted image 20230118124201.png]]
	It's better to leave one chunk aside, which will be used for the testing of the final model.

K-fold is the best way to go (for best model quality), but it's also very computational expensive

Here is a brief visual comparison of different splitting methods (ordered by increasing complexity)
![[Pasted image 20230120181442.png]]