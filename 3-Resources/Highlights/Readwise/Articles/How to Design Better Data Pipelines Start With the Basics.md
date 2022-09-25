---
Date: 2022-09-05
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Source: medium
Link: https://medium.com/p/7c4815a125dc
Tags: ["#Type/Highlight/Article"]
Aliases: ["How to Design Better Data Pipelines? Start With the Basics", "How to Design Better Data Pipelines? Start With the Basics"]
---
# How to Design Better Data Pipelines? Start With the Basics

## Metadata
- Author: [[Miquel Rius Carmona]]
- Full Title: How to Design Better Data Pipelines? Start With the Basics
- Category: #Type/Highlight/Article
- URL: https://medium.com/p/7c4815a125dc

## Highlights
- Create a doc pattern in your team: Docs are different between companies and even between teams. So first of all, try to cover a doc that your current teammates can understand. To do so, try to create a template of what should be documented in each scenario. This will make the documentation process easier and faster.
- Add context: If no context is provided related to why that documentation is useful that can be quickly dismissed by other teammates. For example: if you document your current Airflow Pools try to add which Airflow version you use, which vendor, etc... Anything that can add context. If the documentation says you use Airflow 2.2.2 and the server is at 2.3.3 you can guess that maybe some issue can arise.
- For dummies: It is tedious to write documents that go back to basics but let’s be clear. A team is composed of different members with different knowledge and expertise that add value to the company. My recommendation here is to try to create a doc for dummies. Tip: Do not assume anything.
- Keep it on date: Docs easily get out of date. Best option for me is to create a main doc explaining how the data pipeline was created and then add another doc with a changelog. The changelog docs should be updated for minor, medium and big changes this way is easy to track what changed concerning the main process doc.
- Project requirements: Add stakeholders (will get notified if there is any delay) and data consumer needs. Do not forget the data pipeline owners. Some questions can be:
  - Why do we want this data? Focus on data usage and impact to the business.
  - What do we want to track, are all data fields need it? Focus on data contract.
  - Where will be this data used? Focus on data visualization tools.
  - Who should watch this data? Focus on stakeholders.
  - When do you look at this data? Focus on time and data importance.
  - How do you want to look at this data? How we should create this dataset? Focus on methodologies.
- Data requirements:
- Decide which minimum viable product could be deployed to production, and also define future iterations.
- Specify which tools will you use and why. What pros have those tools in that scenario and what limitations can they have in the future. If we go back to the batch vs streaming scenario an MVP could be an hourly batch that with our current tools can be easily achieved. Future iterations imply adding pipeline streaming tools to reach the desired final project status.
