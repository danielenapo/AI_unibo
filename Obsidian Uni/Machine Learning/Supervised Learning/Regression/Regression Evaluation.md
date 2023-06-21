## Mean Squared Error (MSE)
Could be defined in different way, but we often use the **mean squared error**:
![[Pasted image 20230120163319.png]]
![[Pasted image 20230120163340.png]]
using the **normal equation method**, if $X^{T}X$ is invertible, w can be obtained as:
![[Pasted image 20230120163536.png]]
(But it can also be found with Gradient Descent or SGD).
also if $X^{T}X$ is not invertible, it could be solved with Moore-Penrose pseudo-inverse matrix, or **Lasso** regularization.

## $R^{2}$
_indicates the proportion of variation in the y-variable that is due to variation in the x-variables._
==Shows how well the data fits the model==
Range $[0,1]$, the higher the better.
Quality of the fitting ([[Classifier Evaluation]]) can be measured by the R squared method:
![[Pasted image 20230120164111.png]]
Compares the fit of the model with a horizontal straight line (similarly on how [[Probabilities of classes#Lift chart]] works).
With perfect fitting, $R^{2}=1$. If it's bad, $R^{2}<0$.


## F-test
_The **F-test for linear regression** tests whether any of the independent variables in a multiple linear regression model are significant._

The F-test in linear regression is a statistical test that is used to determine whether the overall linear regression model is a good fit for the data. Specifically, it tests whether the explained variation in the dependent variable is greater than the unexplained variation, after accounting for the independent variables.

The F-test is used to compare two nested models: the full model which includes all the independent variables and the reduced model which only includes a subset of independent variables. The null hypothesis of the F-test is that the **reduced mode** (with a missing independent variable) fits the data as well as the full model, while the alternative hypothesis is that the full model fits the data better than the reduced model.

The F-test statistic is calculated as the ratio of the explained variation to the unexplained variation, also known as the mean square explained (MSE) and mean square error (MSE) respectively. The ratio is then compared to the F-distribution with (n-p-1) and (p-k) degrees of freedom, where n is the number of observations, p is the number of independent variables in the full model, and k is the number of independent variables in the reduced model.

The F-test can be useful in cases where you want to evaluate whether a certain variable or group of variables is important for the model. If the p-value is less than the significance level, usually 0.05, it means

## P-value
==**LOWER IS BETTER**== (<0.05 is best aka in 5% of cases we have false positives)
The p-value is a statistical measure used to assess the strength of evidence against a null hypothesis. It represents the probability of obtaining a test statistic as extreme or more extreme than the one observed, assuming that the null hypothesis is true.
In the case of the F-test, the null hypothesis is that all the independent variables in the model are not related to the dependent variable, meaning that the reduced model fits the data as well as the full model. The alternative hypothesis is that at least one independent variable is related to the dependent variable. The p-value is calculated using the F-distribution, and it represents the probability of obtaining a test statistic as extreme or more extreme than the one observed, assuming that the null hypothesis is true.