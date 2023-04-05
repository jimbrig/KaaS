# Actuarial Data Science and Financial Modeling with Microsoft Azure

*Source: [Guide to Moving Actuarial Risk Analysis to Azure | Microsoft Docs](https://docs.microsoft.com/en-us/previous-versions/azure/industry-marketing/financial/actuarial-risk-analysis-and-financial-modeling-solution-guide?toc=https%3A%2F%2Fdocs.microsoft.com%2Fen-us%2Fazure%2Farchitecture%2Ftoc.json&bc=https%3A%2F%2Fdocs.microsoft.com%2Fen-us%2Fazure%2Farchitecture%2Fbread%2Ftoc.json)*

Actuaries move to the cloud to get more time to review, evaluate, and validate results. When regulators audit insurers, the actuaries need to be able to explain their results. The move to the cloud gives access to the computing resources to run 20000 hours of analysis in 24-120 hours of clock time through the power of parallelization. To assist with this need for scale, many of the companies that create actuarial software provide solutions that allow calculations to run in Azure. Some of these solutions are built on technologies that run on premises and Azure like [HPC Pack](https://docs.microsoft.com/en-us/powershell/high-performance-computing/overview?view=hpc16-ps&WT.mc_id=riskmodel-docs-scseely). Others are Azure native and use [Azure Batch](https://docs.microsoft.com/en-us/azure/batch?WT.mc_id=riskmodel-docs-scseely), [Virtual Machine Scale Sets](https://docs.microsoft.com/en-us/azure/virtual-machine-scale-sets?WT.mc_id=riskmodel-docs-scseely), or a custom scaling solution.

This document explores how actuarial developers can use Azure, coupled with modeling packages, to analyze risk. It examines the following:

* Running larger models in less time, in Azure.
* Reporting on the results.
* Managing data retention.

Whether you are servicing life, property and casualty, health, or other insurance, you need to create financial and risk models of your assets and liabilities to adjust your investments and premiums so that you stay solvent as an insurer. IFRS 17 reporting adds changes to the models the actuaries create, like calculating the contractual service margin (CSM), which change how insurers manage their profit through time.

## Running more in less time, in Azure

You believe in the promise of the cloud: it can run your financial and risk models faster and easier. For many insurers, a back of the envelope calculation shows the problem: they need years, or even decades, of sequential time to run these calculations from start to finish. You need technology to solve the runtime problem. Your strategies are:

* Data preparation: Some data changes slowly. Once a policy or service contract is in force, claims move at a predictable pace. You can prepare the data needed for model runs as it arrives, eliminating a need to plan much time for data cleansing and preparation. You may also use clustering to create stand-ins for seriatim data through weighted representations. Fewer records usually results in reduced computation time.
* Parallelization: If you need to do the same analysis to two or more items, you may be able to perform the analysis simultaneously.

---

* [Actuarial Science](../2-Areas/MOCs/Actuarial%20Science.md)
* [Cloud Computing](Cloud%20Computing.md)
* [Microsoft Azure](../3-Resources/Tools/Developer%20Tools/Cloud%20Services/Azure/Microsoft%20Azure.md)
* [Machine Learning](Machine%20Learning.md)
* [Azure Machine Learning](../3-Resources/Tools/Developer%20Tools/Cloud%20Services/Azure/Azure%20Machine%20Learning.md)

*Backlinks:*

````dataview
list from [[Actuarial Data Science and Financial Modeling with Microsoft Azure]] AND -"Changelog"
````
