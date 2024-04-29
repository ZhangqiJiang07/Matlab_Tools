# Preprocessing

|Notations||
|:--|:--|
|$X \in \mathbb{R}^{n \times d}$|Data matrix, each row is a sample|


## Feature Scaling
- **Min-Max Normalization**: `MinMaxNorm.m`

This function will map the values to the interval \[0, 1\], and the formulation can be written as:

$$
\hat{X} = \frac{X - X_{min}}{X_{max} - X_{min}},
$$

where $X_{max}$ and $X_{min}$ represent the column-wise (i.e., feature-wise) max value and min value, respectively.

- **Mean Normalization**: `MeanNorm.m`

This function will map the values to the interval \[-1, 1\]:

$$
\hat{X} = \frac{X - \bar{X}}{X_{max} - X_{min}},
$$

where $\bar{X}$ represents the column-wise (i.e., feature-wise) mean value.

- **Standardization (Z-score Normalization)**: `ZscoreNorm.m`

Formulation：

$$
\hat{X} = \frac{X - \mu}{\sigma},
$$

where $\mu$ and $\sigma$ represent the column-wise mean and standard deviation, respectively.

✒️The mean of standardized values will always be 0, and the standard deviation will always be 1.
