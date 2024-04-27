# Evaluation Metrics

- **Binary Average Precision (AP)**: `binary_average_precision.m`

This function calculates the `approximate' _Area Under the Precision-Recall Curve_ (AUPRC) in binary classification task.

<div  align="center">
 <img src="https://github.com/ZhangqiJiang07/Matlab_Tools/blob/main/evaluation_metrics/figs/PR_curve.png" width = "300" height = "300" alt="Precision-Recall Curve" />
</div>

Referring to [sklearn.metrics.average_precision_score](https://scikit-learn.org/stable/modules/generated/sklearn.metrics.average_precision_score.html), the numerical formulation can be written as:

$$
AP = \sum_{i} (R_{i} - R_{i-1})P_i,
$$

where $R_{0} = 0$.

✒️ This formulation is one of the numerical integration rules, called the right rectangle rule. We can use other formulations to approximate the AUPRC.


- **Mean Average Precision (mAP)**:`mean_average_precision.m`

This function calculates the _class-level mean AUPRC_ in multi-class classification task by:

$$
mAP = \frac{1}{C} \sum_{i=1}^{C} AP_i.
$$

