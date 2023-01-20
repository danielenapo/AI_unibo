_[[Ensamble methods]] where base models are [[Decision Trees]]._
![[Pasted image 20230120154227.png]]
Each decision tree is built using a different random subset of the data (samble with replacement -> boost) and a subset of the features (random or by domain knowledge), which makes the trees different and independent from each other.

The final prediction of the tree is the mean of all the base decisions (or majority voting)


## Bias-Variance tradeoff
-   The [_bias_](https://en.wikipedia.org/wiki/Bias_of_an_estimator "Bias of an estimator") error is an error from erroneous assumptions in the learning [algorithm](https://en.wikipedia.org/wiki/Algorithm "Algorithm"). High bias can cause an algorithm to miss the relevant relations between features and target outputs (underfitting).
-   The _[variance](https://en.wikipedia.org/wiki/Variance "Variance")_ is an error from sensitivity to small fluctuations in the training set. High variance may result from an algorithm modeling the random [noise](https://en.wikipedia.org/wiki/Noise_(signal_processing) "Noise (signal processing)") in the training data ([overfitting](https://en.wikipedia.org/wiki/Overfitting "Overfitting")).

The **bias–variance decomposition** is a way of analyzing a learning algorithm's [expected](https://en.wikipedia.org/wiki/Expected_value "Expected value") [generalization error](https://en.wikipedia.org/wiki/Generalization_error "Generalization error") with respect to a particular problem as a sum of three terms, the bias, variance, and a quantity called the _irreducible error_, resulting from noise in the problem itself.