# DataOps Implementation Guidelines

## Metadata

* Author: *Kiran Mainali*
* Full Title: DataOps Implementation Guidelines
* Category: #Type/Highlight/Article
* URL: https://medium.com/p/33b3206654fa

## Highlights

* Start DataOps by identifying people and culture in an organization. Then, establish management control, communication process, and project management to align with the process and tools.
* Use automation and orchestration tools to reduce manual work. Collaboration between team members to execute data analytics projects tries to automate tasks as much as possible. With orchestration, integrating tools and technology will be easier to automate the data analytics projects.
* Versioning is essential for data, documents, and code tracking. Data governance, data provenance, and data lineage can depend on version control tools to some extent. Also, with version control, different team members can create their version of work and be merged for implementation.
* Do not waste time redoing the same thing if it is possible to reuse it. Furthermore, containerized applications and pipelines help to reduce the risk of failure due to external circumstances.
* Setup a separate environment for production and development gives the flexibility of innovation and change management without risking ongoing pipeline execution. Within the development environment, each data worker should have their work environment to work independently without affecting other performance.
* Without testing, we cannot assure data pipeline quality. Create test cases to cover every possible pipeline corner (data, code, system, and output). Do an extensive test before releasing the data pipeline or changes in the data pipeline into the production environment.
* To assemble work of various data workers and put into a test environment, use continuous integration. After passing all the test cases, use continuous deployment to release work into the production environment.
* Regularly monitor the production and development environment to track overall data pipeline performance, the pipeline’s input and output quality, and used tools and technology performance. Also, always crosscheck the results of two environments. With continuous monitoring, system performance and quality statistics can be recorded. Scope of further improvement always exists with test results analysis.
* Continuously communicate with customers, stakeholders, and team members. Try to minimize the communication loop to a minimum so that messages can travel faster. If required, create a collaborative workspace between tools and people and tools for the task to provide better results.
