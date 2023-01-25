Some machine learning algorithms are sensitive to feature scaling and outliers (others don't)
Eg gradient descent requires scaled data, and can be used for many algorithms
## Scaling methods
- map dataset to new functioln (log, abs, $e^{x}$, ...)
- standardization for gaussian distrubutions: $\frac{x-\mu}{\sigma}$ 
- rescaling (aka `MinMaxScaler`) $X_{1}^{scaled}=\frac{x_{1}-x_{1}^{min}}{x_{1}^{max}-x_{1}^{min}}$
Outliers are still present when scaling 
![[Pasted image 20230123152100.png]]
In this pairplot example we have a **skewed** distribution.
Applying `PowerTransformer` from [[Scikit-learn]], we can reduce the influence of outliers
![[Pasted image 20230123152218.png]]
## Rescaling for [[#Distance methods]]
Distance methods ([[KNN]], [[K-Means]], [[Support Vector Machines (SVM)]]) need normalized data
- **Range-based scaling**-> stretches/shrinks range, according to feature's range (good for non-gaussian data)
- **Standardization** (for gaussian) -> `StandardScaler` in [[Scikit-learn]]
- **Affine transformations** (linear transformations + translations) -> `MinMaxScaler` and `RobustScaler`
- **Normalization** -> `Normalizer`