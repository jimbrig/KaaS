# Python Package - ChainLadder

*Source: [casact/chainladder-python: Actuarial reserving in Python](https://github.com/casact/chainladder-python)*

Docs: [Welcome to Chainladder — Reserving in Python](https://chainladder-python.readthedocs.io/en/latest/intro.html)

## chainladder - Property and Casualty Loss Reserving in Python

This package gets inspiration from the popular [R ChainLadder package](https://github.com/mages/ChainLadder).

This package strives to be minimalistic in needing its own API. Think in [pandas](https://pandas.pydata.org/) for data manipulation and [scikit-learn](https://scikit-learn.org/latest/index.html) for model construction. 

An actuary already versed in these tools will pick up this package with ease. Save your mental energy for actuarial work.

## Documentation

Please visit the [Documentation](https://chainladder-python.readthedocs.io/en/latest/) page for examples, how-to's, and source code documentation.

## Available Estimators

|Loss Development|Tails Factors|IBNR Models|Adjustments|Workflow|
|----------------|-------------|-----------|-----------|--------|
|[Development](https://chainladder-python.readthedocs.io/en/latest/development.html#development)|[TailCurve](https://chainladder-python.readthedocs.io/en/latest/tails.html#tailcurve)|[Chainladder](https://chainladder-python.readthedocs.io/en/latest/methods.html#chainladder)|[BootstrapODPSample](https://chainladder-python.readthedocs.io/en/latest/adjustments.html#bootstrapodpsample)|[VotingChainladder](https://chainladder-python.readthedocs.io/en/latest/workflow.html#votingchainladder)|
|[DevelopmentConstant](https://chainladder-python.readthedocs.io/en/latest/development.html#developmentconstant)|[TailConstant](https://chainladder-python.readthedocs.io/en/latest/tails.html#tailconstant)|[MackChainladder](https://chainladder-python.readthedocs.io/en/latest/methods.html#mackchainladder)|[BerquistSherman](https://chainladder-python.readthedocs.io/en/latest/adjustments.html#berquistsherman)|[Pipeline](https://chainladder-python.readthedocs.io/en/latest/workflow.html#pipeline)|
|[MunichAdjustment](https://chainladder-python.readthedocs.io/en/latest/development.html#munichadjustment)|[TailBondy](https://chainladder-python.readthedocs.io/en/latest/tails.html#tailbondy)|[BornhuettterFerguson](https://chainladder-python.readthedocs.io/en/latest/methods.html#bornhuetterferguson)|[ParallelogramOLF](https://chainladder-python.readthedocs.io/en/latest/adjustments.html#parallelogramolf)|[GridSearch](https://chainladder-python.readthedocs.io/en/latest/workflow.html#gridsearch)|
|[ClarkLDF](https://chainladder-python.readthedocs.io/en/latest/development.html#clarkldf)|[TailClark](https://chainladder-python.readthedocs.io/en/latest/tails.html#tailclark)|[Benktander](https://chainladder-python.readthedocs.io/en/latest/methods.html#benktander)|[Trend](https://chainladder-python.readthedocs.io/en/latest/adjustments.html#trend)||
|[IncrementalAdditive](https://chainladder-python.readthedocs.io/en/latest/development.html#incrementaladditive)||[CapeCod](https://chainladder-python.readthedocs.io/en/latest/methods.html#capecod)|||
|[CaseOutstanding](https://chainladder-python.readthedocs.io/en/latest/development.html#caseoutstanding)|||||
|[TweedieGLM](https://chainladder-python.readthedocs.io/en/latest/development.html#tweedieglm)|||||
|[DevelopmentML](https://chainladder-python.readthedocs.io/en/latest/development.html#developmentml)|||||
|[BarnettZehnwirth](https://chainladder-python.readthedocs.io/en/latest/development.html#barnettzehnwirth)|||||

## Getting Started Tutorials

Tutorial notebooks are available for download [here](https://github.com/casact/chainladder-python/tree/latest/docs/tutorials).

* [Working with Triangles](https://chainladder-python.readthedocs.io/en/latest/tutorials/triangle-tutorial.html)
* [Selecting Development Patterns](https://chainladder-python.readthedocs.io/en/latest/tutorials/development-tutorial.html)
* [Extending Development Patterns with Tails](https://chainladder-python.readthedocs.io/en/latest/tutorials/tail-tutorial.html)
* [Applying Deterministic Methods](https://chainladder-python.readthedocs.io/en/latest/tutorials/deterministic-tutorial.html)
* [Applying Stochastic Methods](https://chainladder-python.readthedocs.io/en/latest/tutorials/stochastic-tutorial.html)
* [Large Datasets](https://chainladder-python.readthedocs.io/en/latest/tutorials/large-datasets.html)

## Installation

To install using pip: `pip install chainladder`

To install using conda: `conda install -c conda-forge chainladder`

Alternatively for pre-release functionality, install directly from github: `pip install git+https://github.com/casact/chainladder-python/`

Note: This package requires Python>=3.5 pandas 0.23.0 and later, sparse 0.9 and later, scikit-learn 0.23.0 and later.

---

#### Related

* [Development](../../../../../../2-Areas/MOCs/Development.md)
* [R Package - ChainLadder](../../R/R%20Packages/Actuarial%20R%20Packages/R%20Package%20-%20ChainLadder.md)
* [2-Areas/MOCs/Python](../../../../../../2-Areas/MOCs/Python.md)
* [Actuarial Science](../../../../../../2-Areas/MOCs/Actuarial%20Science.md)
* [CAS - Casualty Actuarial Society](../../../../../../0-Slipbox/CAS%20-%20Casualty%20Actuarial%20Society.md)

*Backlinks:*

````dataview
list from [[Python Package - ChainLadder]] AND -"Changelog"
````
