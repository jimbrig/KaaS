# Azure MLOps: DevOps for Machine Learning

DevOps for machine learning models, often called `MLOps`, is a process for developing models for production. 

A model's lifecycle from training to deployment must be auditable if not reproducible.

### Machine Learning Model Lifecycle

![Machine learning model lifecycle - MLOps](https://docs.microsoft.com/en-us/azure/machine-learning/media/overview-what-is-azure-machine-learning/model-lifecycle.png)

Learn more about [MLOps in Azure Machine Learning](https://docs.microsoft.com/en-us/azure/machine-learning/concept-model-management-and-deployment).

### Integrations Enabling MLOPs

Azure Machine Learning is built with the model lifecycle in mind. You can audit the model lifecycle down to a specific commit and environment.

Some key features enabling MLOps include:

* `git` integration
* MLflow integration
* Machine learning pipeline scheduling
* Azure Event Grid integration for custom triggers
* Easy to use with CI/CD tools like GitHub Actions or Azure DevOps

Also, Azure Machine Learning includes features for monitoring and auditing:

* Job artifacts, such as code snapshots, logs, and other outputs
* Lineage between jobs and assets, such as containers, data, and compute resources

*Backlinks:*

````dataview
list from [[Azure MLOps]] AND -"Changelog"
````
