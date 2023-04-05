# Getting started with R on Amazon Web Services | Amazon Web Services

## Metadata

* Author: [aws.amazon.com]()
* Title: Getting started with R on Amazon Web Services | Amazon Web Services
* Reference: https://aws.amazon.com/blogs/opensource/getting-started-with-r-on-amazon-web-services/
* Category: #Type/Highlight/Article

## Highlights

* R is a programming language popular with statisticians, scientists, and data analysts. Its large user community has developed thousands of freely available packages, including packages for data manipulation, data visualization, specialized statistical estimation procedures, machine learning, accessing public data APIs like US Census data or Spotify, easily making data-based web apps, and many, many other areas. There are also high-quality free online books and other documentation explaining how to use R effectively. — [Updated on 2021-11-24 19:05:11](https://hyp.is/W71Uuk2DEeyhMFua7sn1QQ/aws.amazon.com/blogs/opensource/getting-started-with-r-on-amazon-web-services/)  — Group: #Type/Highlight/Hypothesis/Public

* Use cases for R on AWS — [Updated on 2021-11-24 19:05:26](https://hyp.is/ZOf-FE2DEeyo6V-9BaXjiQ/aws.amazon.com/blogs/opensource/getting-started-with-r-on-amazon-web-services/)  — Group: #Type/Highlight/Hypothesis/Public

* Big data processing 
  As data analysis trends towards larger datasets, R users—who may be used to running analyses locally on a laptop—often will hit barriers as the result of computing, memory, and cost constraints. By moving workflows to AWS, R users can overcome these barriers. R is often used to estimate complex statistical models that require significant computing power and time (hours or even days) to construct. Using Amazon Elastic Compute Cloud (Amazon EC2) instances tailored to the workload, or containers running on Amazon Elastic Kubernetes Service (Amazon EKS), Amazon Elastic Container Service (Amazon ECS), AWS Fargate, or AWS Batch, AWS-managed compute services can help speed up model development. — [Updated on 2021-11-24 19:05:31](https://hyp.is/Z3O7Hk2DEeyKYUfnx9herA/aws.amazon.com/blogs/opensource/getting-started-with-r-on-amazon-web-services/)  — Group: #Type/Highlight/Hypothesis/Public

* Often, data scientists deal with these big problems only part of the time, and running permanent Amazon EC2 instances or containers would not be cost effective. For these types of workloads, AWS Batch is a good fit—it takes care of starting up the instance, running the job, and then shutting the instance down when the job is finished. Because you only pay while the instance is running, you’re not stuck paying for a powerful machine while you’re not actively using it, and you’re not limited by a fixed, static quantity of processing power. — [Updated on 2021-11-24 19:06:25](https://hyp.is/h6xqIE2DEeyx6sfS2ZHHIg/aws.amazon.com/blogs/opensource/getting-started-with-r-on-amazon-web-services/)  — Group: #Type/Highlight/Hypothesis/Public

* Databases 
  Databases are a valuable resource for data science teams; they provide a single source of truth for datasets and offer performant reads and writes. We can take advantage of popular databases like PostgreSQL through Amazon Relational Database Service (Amazon RDS), while letting AWS take care of underlying instance and database maintenance. In many cases, R can interact with these services with only small modifications; the Tidyverse packages within R allow you to write your code irrespective of where it’s going to run, and allow you to retarget the code to perform operations on data sourced from the database. — [Updated on 2021-11-24 19:06:30](https://hyp.is/isshnE2DEeyM_ltebz6Gtg/aws.amazon.com/blogs/opensource/getting-started-with-r-on-amazon-web-services/)  — Group: #Type/Highlight/Hypothesis/Public

* File storage 
  Lastly, Amazon Simple Storage Service (Amazon S3) allows developers to store raw input files, results, reports, artifacts, and anything else that we wouldn’t want to store directly in a database. Items stored in S3 are accessible online, making sharing resources with collaborators easy, but it also offers fine-grained resource permissions so that access is limited to only those who should have it. — [Updated on 2021-11-24 19:06:35](https://hyp.is/jaiUTk2DEey9pVshr74rlA/aws.amazon.com/blogs/opensource/getting-started-with-r-on-amazon-web-services/)  — Group: #Type/Highlight/Hypothesis/Public

* To use AWS in R, you can use the Paws AWS software development kit, an R package developed by my colleague Adam Banker and me. Paws is an unofficial SDK, but it covers most of the same functionality as the official SDKs for other languages. You can also use the official Python SDK, boto3, through the botor and reticulate packages, but you also will need to ensure Python is installed on your machine before using them. — [Updated on 2021-11-24 19:06:55](https://hyp.is/mcmc-k2DEeyW4pPAm_PFKA/aws.amazon.com/blogs/opensource/getting-started-with-r-on-amazon-web-services/)  — Group: #Type/Highlight/Hypothesis/Public

* When accessing AWS APIs, you must provide credentials and region. Paws will search for credentials and region using the AWS authentication chain: 
  
  ````
    Explicitly provided access key, secret key, session token, profile, and/or region 
    R environment variables 
    Operating system environment variables 
    AWS shared credentials and configuration files in .aws/credentials and .aws/config 
    Container AWS Identity and Access Management (IAM) role 
    Instance IAM role — [Updated on 2021-11-24 19:13:35](https://hyp.is/iEkxdE2EEey9-CdJIr0VUQ/aws.amazon.com/blogs/opensource/getting-started-with-r-on-amazon-web-services/)  — Group: #Public
  ````

* If you are using a suitably configured RDS database, you can authenticate using a token generated by the Paws build_auth_token function in the RDS service; this is another feature developed with the support of the AWS Open Source program. Using an IAM authentication token allows you to avoid having to store passwords. Once connected, you can then use this database connection as before. — [Updated on 2021-11-24 19:46:41](https://hyp.is/KBIxUk2JEeyR4TPkfrbTTg/aws.amazon.com/blogs/opensource/getting-started-with-r-on-amazon-web-services/)  — Group: #Type/Highlight/Hypothesis/Public
