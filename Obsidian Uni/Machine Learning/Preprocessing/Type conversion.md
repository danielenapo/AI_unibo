_Changing [[Data]] type can be useful depending on the algorithm_
- Many algos require numeric data types -> convert categorical to numeric
- [[Classification]] requires a target with nominal values -> numerical (continuous) values needs to be **discretized**.

## Binarization
_Transform different types of data (numerical, discrete, ...) into binary (boolean) type._
- **One-Hot-Encoding** -> a feature with v possible values is substituted by v binary features (each one corresponding to one of the unique values, and all mutually exclusive).
	`sklearn.preprocessing.OneHotEncoder`
- **Ordinal Encoder** -> Ordinal sequences are transformed into consecutive integers (keeping order)
	`sklearn.preprocessing.OrdinalEncoder`
- **Binarizer** -> uses a threshold to transform numeric data to binary: >threshold=1, <threshold=0
	`sklearn.preprocessing.Binarizer`

## Discretization
Transform continue data into discrete.
- Use lots of thresholds
- **K-bins discretizer** ->[[Unsupervised Learning]] techniques to cluster data into K discrete groups (from 0 to K-1)
	![[Pasted image 20230121155913.png]]
	`sklearn.preprocessing.KBinsDiscretizer`
	several strategies could be used (uniform, quantile, means)