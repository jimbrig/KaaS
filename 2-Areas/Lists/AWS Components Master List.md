# AWS Components Master List

*Source: https://gist.github.com/jaytaph/ff8e6df0cf343237a3e1bbaa99ca41a1*

## Contents

* [Storage](AWS%20Components%20Master%20List.md#storage)
* [Database](AWS%20Components%20Master%20List.md#database)
* [Migration & Transfer](AWS%20Components%20Master%20List.md#migration-transfer)
* [Networking & Content Delivery](AWS%20Components%20Master%20List.md#networking-content-delivery)
* [Developer Tools](AWS%20Components%20Master%20List.md#developer-tools)
* [Robotics](AWS%20Components%20Master%20List.md#robotics)
* [Customer Enablement](AWS%20Components%20Master%20List.md#customer-enablement)
* [Blockchain](AWS%20Components%20Master%20List.md#blockchain)
* [Satellite](AWS%20Components%20Master%20List.md#satellite)
* [Quantum Technologies](AWS%20Components%20Master%20List.md#quantum-technologies)
* [Management & Governance](AWS%20Components%20Master%20List.md#management-governance)
* [Media Services](AWS%20Components%20Master%20List.md#media-services)
* [Machine Learning](AWS%20Components%20Master%20List.md#machine-learning)
* [Analytics](AWS%20Components%20Master%20List.md#analytics)
* [Security, Identity, & Compliance](AWS%20Components%20Master%20List.md#security-identity-compliance)
* [Mobile](AWS%20Components%20Master%20List.md#mobile)
* [Application Integration](AWS%20Components%20Master%20List.md#application-integration)
* [AWS Cost Management](AWS%20Components%20Master%20List.md#aws-cost-management)
* [Customer Engagement](AWS%20Components%20Master%20List.md#customer-engagement)
* [Business Applications](AWS%20Components%20Master%20List.md#business-applications)
* [End User Computing](AWS%20Components%20Master%20List.md#end-user-computing)
* [Internet Of Things](AWS%20Components%20Master%20List.md#internet-of-things)
* [Game Development](AWS%20Components%20Master%20List.md#game-development)
* [Containers](AWS%20Components%20Master%20List.md#containers)

### Compute

|Resource|Description|
|:------:|:---------:|
|EC2|Virtual Private Servers|
|Lightsail|Amazon's hosting provider (vps, dns, storage)|
|Lambda|Functions you can run, written in Python, NodeJS, Go etc. Can run many in parallel.|
|Batch|Run software jobs on EC2 machines|
|Elastic Beanstalk|Run software on managed virtual machines|
|Serverless Application Repository|Repository of serverless applications that you can deploy (on lambda)|
|AWS Outposts|Basically run Amazon services on your own hardware (datacenter)|
|EC2 Image Builder|Create EC2 (ami?) images automatically|

### Storage

|Resource|Description|
|:------:|:---------:|
|S3|File storage. Not directly used for mounting, but you can directly download file from HTTP|
|EFS|NFS. Mount network disks to your machines.|
|FSx|Windows / Lustre filesystems you can connect to your ec2 machines|
|S3 Glacier|Low cost storage system for backups and archives and such|
|Storage Gateway|iSCSI so you can connect s3 to your own (remote) machine.|
|AWS Backup|Automatically create backups of different AWS service (ec2, rds etc)|

### Database

|Resource|Description|
|:------:|:---------:|
|RDS|Managed mysql, postgres databases etc.|
|DynamoDB|Large & scalable non-relational database (but not really a NoSQL system)|
|ElastiCache|Managed memcache and redis machines|
|Neptune|Graph database|
|Amazon Redshift|Warehousing. Store lots of data that can be processed through streams.|
|Amazon QLDB|Database for immutable and cryptographically verifiable data (money transactions etc)|
|Amazon DocumentDB|MongoDB clone (but not really compatible anymore)|
|Amazon Keyspaces|Managed Apache Cassandra clone|

### Migration & Transfer

|Resource|Description|
|:------:|:---------:|
|AWS Migration Hub|Migrate things from your DC to AWS|
|Application Discovery Service|Discover services in your datacenter|
|Database Migration Service|Migrate databases to RDS while staying online (can convert structures as well)|
|Server Migration Service|Migrate virtual machines to amazon.|
|AWS Transfer Family|(s)FTP service with S3 backend. Upload to FTP, directly store on S3 bucket.|
|Snowball|Get a machine from AWS, plug in your DC, transfer data fast to AWS, return machine|
|DataSync|Sync data between your datacenter and AWS|

### Networking & Content Delivery

|Resource Access Manager|Description|
|:---------------------:|:---------:|
|VPC|Create your own VPCs within AWS.|
|CloudFront|Content Delivery Network.|
|Route 53|Manage domain names and records.|
|API Gateway|Create HTTP APIs and let them connect to different backends.|
|Direct Connect|Create a (physical) connection between you (or DC) to AWS.|
|AWS App Mesh|Automatically run Envoy as a sidecar for your containers (ECS or EKS).|
|AWS Cloud Map|Service discovery for your containers.|
|Global Accelerator|Run your app on edge locations so they are closer to your customers (CDN for apps).|

### Developer Tools

|Resource|Description|
|:------:|:---------:|
|CodeStar|Quickly develop applications by using template code and codecommit, codebuild etc|
|CodeCommit|Amazon source repositories (git repo's etc)|
|CodeBuild|CI service|
|CodeDeploy|Deployment service|
|CodePipeline|Code delivery with workflows|
|Cloud9|Online IDE|
|X-Ray|Allows tracing in your applications, supports Python, NodeJs, Go etc.|

### Robotics

|Resource|Description|
|:------:|:---------:|
|AWS RoboMaker|After reading it over and over again, i still have no idea what it does.|

### Customer Enablement

|Resource|Description|
|:------:|:---------:|
|AWS IQ|Job board: Hire AWS experts for whatever you need.|
|Support|AWS support center|
|Managed Services|Let AWS handle your AWS services for you.|

### Blockchain

|Resource|Description|
|:------:|:---------:|
|Amazon Managed Blockchain|Block chains|

### Satellite

|Resource|Description|
|:------:|:---------:|
|Ground Station|Satellites as a service|

### Quantum Technologies

|Resource|Description|
|:------:|:---------:|
|Amazon Braket|Some quantum thing. It's in preview so I have no idea what it is.|

### Management & Governance

|Resource|Description|
|:------:|:---------:|
|AWS Organizations|Configure (sub)organisations and accounts|
|CloudWatch|Logging from various AWS components|
|AWS Auto Scaling|Scale resources based on your custom inputs and rules|
|CloudFormation|Templates to create and configure AWS components (think terraform/sls)|
|CloudTrail|Figure out who did what in your AWS services|
|Config|Audit the configurations of your AWS resources|
|OpsWorks|Use Ansible to automate stuff|
|Service Catalog|Manage list of items/codes etc you have in the cloud|
|Systems Manager|View data from your resources grouped in ways you like (like application specific etc)|
|AWS AppConfig|Store and publish application configuration data|
|Trusted Advisor|Checks your account for issues (costs, performance, security etc)|
|Control Tower|Manage multi-accounts|
|AWS License Manager|Manage licenses|
|AWS Well-Architected Tool|Generate questionnaires about your architecture to see if you follow best practices|
|Personal Health Dashboard|StatusPage for AWS|
|AWS Chatbot|Connect AWS to slack|
|Launch Wizard|Deploy MSSQL or SAP|
|AWS Compute Optimizer|Finds your resources and advices on how to save costs|

### Media Services

|Resource|Description|
|:------:|:---------:|
|Elastic Transcoder|Encode files from S3 into different other formats and store back at S3|
|Kinesis Video Streams|Capture media streams|
|MediaConvert|Convert media into different formats|
|MediaLive|Share live video with many others|
|MediaTailor|Insert advertisements into your broadcasts|
|Elemental Appliances & Software|create videos on-premise. Basically a mix of all of the above services. Seems expensive. Probably is.|

### Machine Learning

|Resource|Description|
|:------:|:---------:|
|Amazon SageMaker|Machine learning tools|
|Amazon CodeGuru|Profile java code with machine learning|
|Amazon Comprehend|Understand and classify data like emails, tweets etc|
|Amazon Forecast|Create forecasts from data|
|Amazon Fraud Detector|in preview so no idea.|
|Amazon Kendra|Search service where you can ask questions|
|Amazon Lex|Create voice and chatbots|
|Amazon Machine Learning|Deprecated. Use SageMaker instead.|
|Amazon Personalize|Create personalized recommendations based on data (mahout??)|
|Amazon Polly|Convert text to speech in different languages|
|Amazon Rekognition|Recognize objects and people in images|
|Amazon Textract|Convert text found in images to text (OCR)|
|Amazon Transcribe|Convert audio to text|
|Amazon Translate|Translates text from one language to another|
|AWS DeepLens|A video camera that does machine learning|
|AWS DeepRacer|Some kind of game where you program a racecar to race against others.|
|Amazon Augmented AI|Let humans in the loop to make AI learn things better|
|AWS DeepComposer|Computer generated music. It's as horrible as it sounds.|

### Analytics

|Resource|Description|
|:------:|:---------:|
|Athena|Query data stored in s3 buckets.|
|EMR|Elastic Map/Reduce|
|CloudSearch|AWS version of managed document search system (like elasticsearch)|
|Elasticsearch Service|Elasticsearch as a service|
|Kinesis|Collect massive amount of data so you can do analytics (like ELK?)|
|QuickSight|Business Intelligence service|
|Data Pipeline|Move and transform data to dynamodb, rds, s3 etc.|
|AWS Data Exchange|Find APIs which data you can consume, which can be very expensive|
|AWS Glue|ETL service. Enrich, validate data.|
|AWS Lake Formation|Create data lakes|
|MSK|Kafka as a service|

### Security, Identity, & Compliance

|Resource|Description|
|:------:|:---------:|
|IAM|AWS's permission system that can control users and AWS services.|
|Resource Access Manager|Share certain AWS resources like Route53, licenses, ec2 with other accounts.|
|Cognito|User and password management system. Useful for managing users for your applications.|
|Secrets Manager|Secrets key/value store. Can automatically rotate secrets.|
|GuardDuty|Automatically scan your cloudtrail/vpc logs for threats.|
|Inspector|Automatically find (security) issues in your network and machines.|
|Amazon Macie|Analyzes data in your S3 buckets and check for PII data.|
|AWS Single Sign-On|Allow single-sign on to your applications.|
|Certificate Manager|Manage and even create (free) SSL certificates.|
|Key Management Service|Manage secret keys|
|CloudHSM|Hardware security modules. Allows you to generate and operate on cryptographic keys.|
|Directory Service|Active directory as a service|
|WAF & Shield|Web Application Firewall (for loadbalancers, cloudfront, api gateway). Can setup your own rules or use predefined ones|
|AWS Firewall Manager|Firewall manager for different accounts in your organisation|
|Artifact|Documents for cloud compliance (things like 27001 certification etc)|
|Security Hub|Overall security checker that uses guardduty, inspector, macie etc|
|Detective|Log  security issues found (from security hub etc)|

### Mobile

|Resource|Description|
|:------:|:---------:|
|AWS Amplify|Let AWS automatically generate frontend & backend apps and deploy them automatically.|
|Mobile Hub|Part of AWS Amplify now.|
|AWS AppSync|Create API backends that you can connect to. Can be created through AWS Amplify as well.|
|Device Farm|AWS BrowserStack. Automatically test apps on many different mobile devices and browsers.|

### Application Integration

|Resource|Description|
|:------:|:---------:|
|Amazon Sumerian|No idea. The dashboard crashes in my browsers|
|Step Functions|State machines written in amazon's own language|
|Amazon AppFlow|Automatically connects apps together (zapier?). For instance: slack to s3 buckets.|
|Amazon EventBridge|Some kind of eventbus system|
|Amazon MQ|ActiveMQ|
|Simple Notification Service|Notification system that can notify through email, api endpoints, sms etc.|
|Simple Queue Service|Message queue system|
|SWF|Create workflows.|

### AWS Cost Management

|Resource|Description|
|:------:|:---------:|
|AWS Cost Explorer|Gives an overview and projection of your budgets|
|AWS Budgets|Create budgets for your AWS components|
|AWS Marketplace Subscriptions|Find (and buy) AMI's with software installed|

### Customer Engagement

|Resource|Description|
|:------:|:---------:|
|Amazon Connect|AWS version of ZenDesk|
|Pinpoint|Create transactional emails based on templates.|
|Simple Email Service|Send out emails. Email provider.|

### Business Applications

|Resource|Description|
|:------:|:---------:|
|Alexa for Business|Connect Alexa to your business needs.|
|Amazon Chime|AWS version of Zoom.|
|WorkMail|AWS version of Gmail / Calendar.|

### End User Computing

|Resource|Description|
|:------:|:---------:|
|WorkSpaces|Virtual desktops from Windows or Linux.|
|AppStream 2.0|Stream applications running native onto your browser|
|WorkDocs|Store your documents and manage them online.|
|WorkLink|Connect mobile users to your intranet.|

### Internet Of Things

|Resource|Description|
|:------:|:---------:|
|IoT Core|Manage fleets of IOT devices through MQTT broker|
|FreeRTOS|RTOS operating system for microcontrollers to automatically connect to IOT-Core or greengrass.|
|IoT 1-Click|Manage 1-click buttons that can be connected to other systems like Lambda|
|IoT Analytics|Clean up and save messages from topics into a data-store for analytics|
|IoT Device Defender|Detect unwanted issues on your devices and take actions|

### Game Development

|Resource|Description|
|:------:|:---------:|
|Amazon GameLift|Deploy game servers with low latency on AWS|

### Containers

|Resource|Description|
|:------:|:---------:|
|Elastic Container Registry|Store docker images like on DockerHub|
|Elastic Container Service|Run containers, either on your own EC2 machines, or on managed machines called FarGate.|
|Elastic Kubernetes Service|Kubernetes as a service|

---

* *AWS*

*Backlinks:*

````dataview
list from [[AWS Components Master List]] AND -"Changelog"
````
