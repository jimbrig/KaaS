---
Date: 2021-11-12
Author: Jimmy Briggs <jimmy.briggs@pwc.com>
Tags: ["#Type/Tool/Python", "#Topic/Dev/Python/Utility"]
Alias: "Python Package - tryangle"
---

# Python Package - tryangle

*Source: [casact/tryangle](https://github.com/casact/tryangle)*

## Tryangle: Machine Learning Techniques for Chainladder Methods

*Tryangle* is an automatic chainladder reserving framework. It provides scoring and optimisation methods based
on machine learning techniques to automatically select optimal parameters to minimise reserve prediction error.

Tryangle is built on top of the [chainladder](https://chainladder-python.readthedocs.io/en/latest/index.html) reserving package.

### Key Features


Tryangle is flexible and modular in how it can be applied:

- Optimizing loss development factors

  - Use [sklearn's scikit](https://scikit-learn.org/) `GridSearchCV` or `RandomizedSearchCV` to
    find the optimal method to calculate loss development factors

- Choosing between multiple reserving methods

  - Not sure if you should go with a basic chainladder, Bornhuetter-Ferguson, or Cape-Cod
    method? Let Tryangle decide.

- Finding the optimal blend of reserving methods

  - Or why not combine all three, and let Tryangle find the optimal blend.

- Using advanced optimization methods

  - Not satisfied with an exhaustive grid search? Tryangle can be used with
    any optimization framework, but we recommend [Optuna](https://optuna.org/)

### Basic Example

```python
from sklearn.model_selection import GridSearchCV
from sklearn.pipeline import Pipeline
from tryangle import Development, CapeCod
from tryangle.metrics import neg_cdr_scorer
from tryangle.model_selection import TriangleSplit
from tryangle.utils.datasets import load_sample

X = load_sample("swiss")
tscv = TriangleSplit(n_splits=5)

param_grid = {
	"dev__n_periods": range(15, 20),
    "dev__drop_high": [True, False],
    "dev__drop_low": [True, False],
    "cc__decay": [0.25, 0.5, 0.75, 0.95],
}

pipe = Pipeline([("dev", Development()), ("cc", CapeCod())])

model = GridSearchCV(
	pipe, param_grid=param_grid, scoring=neg_cdr_scorer, cv=tscv, verbose=1, n_jobs=-1
)

model.fit(X, X)
```

### Installation

Tryangle is available at [the Python Package Index](https://pypi.org/project/tryangle/).

```bash
pip install tryangle
```

Tryangle supports Python 3.8 and 3.9.

### Reference

Caesar Balona, Ronald Richman. 2021.
The Actuary and IBNR Techniques: A Machine Learning Approach (SSRN <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=3697256>).

***

#### Related

- [[Development]]
- [[Python]]
- [[Actuarial Science]]
- [[CAS - Casualty Actuarial Society]]


*Backlinks:*

```dataview
list from [[Python Package - tryangle]] AND -"Changelog"
```