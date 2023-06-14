Some machine learning algorithms are sensitive to feature scaling and outliers (others don't)
E.g. gradient descent requires scaled data, and can be used for many algorithms
## Scaling methods
- map dataset to new function (log, abs, $e^{x}$, ...)
- standardization for Gaussian distributions: $\frac{x-\mu}{\sigma}$ 
- Rescaling (aka `MinMaxScaler`) $X_{1}^{scaled}=\frac{x_{1}-x_{1}^{min}}{x_{1}^{max}-x_{1}^{min}}$
Outliers are still present when scaling 
![[Pasted image 20230123152100.png]]
In this pairplot example we have a **skewed** distribution.
Applying `PowerTransformer` from [[Scikit-learn]] (makes distributions more similar to Gaussians), we can reduce the influence of outliers.
![[Pasted image 20230123152218.png]]
![[Pasted image 20230614175455.png]]

## Rescaling for [[Distance methods]]
Distance methods ([[KNN]], [[K-Means]], [[Support Vector Machines (SVM)]]) need normalized data
- **Range-based scaling**-> stretches/shrinks range, according to feature's range (good for non-Gaussian data)
- **Standardization** (for Gaussian) -> `StandardScaler` in [[Scikit-learn]]
- **Affine transformations** (linear transformations + translations) -> `MinMaxScaler` and `RobustScaler`
- **Normalization** -> `Normalizer`