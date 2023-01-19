Based on statistics (Bayes' theorem), and the concept of independence.
![[Pasted image 20230119114046.png]]
H is the hypotesis (uncertain), and E is the evidence.
It's called naive, because it makes the (naive) assumption that every attribute is independent (but works in some cases).

## Zero probability problem
In case a particular value never occurs in elements of class c, its probability becomes zero. But just because this isn't represented in the dataset, it doesen't mean that prob. should be zero! (common in domain with many possible values)

### Laplace smoothing
The solution is considering the *prior probabilities*.
![[Pasted image 20230119115252.png]]
note: if $\alpha=0$, we obtain the unsmoothed formula. Higher values of $\alpha$ give more importance to the priors. It's an [[Hyperparameter]] for Naive Bayes.
**smoothing can reduce overfitting**.

# Continuous values
Smoothing is not applicable, we have to use instead **Gaussian distributions** (mean and variance).