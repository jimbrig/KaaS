---
Date: 2022-03-24
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Clipping"]
Alias: "Devise an AWS tagging strategy"
---

# Devise an AWS tagging strategy

*Source: [Devise an AWS tagging strategy](https://www.pwc.com/us/en/tech-effect/cloud/aws-tagging-to-evolve-cloud-workloads.html)*

Managing multiple, large workloads in the cloud can cause headaches for IT administrators. One way to successfully manage resources in Amazon Web Services (AWS) is to utilize resource tagging — the process of adding key-value pair labels to resources. This lets administrators know who created a particular resource and the environment the resource belongs to.

AWS tags can be utilized for a variety of use cases that streamline the ability to manage resources in the cloud. Some of the most common uses of tags are for resource organization, cost allocation, automation, and security or access control. Each of these uses helps administrators realize efficiencies in administering workloads and resources in an AWS cloud environment.

For example, a company that has multiple divisions may want to understand which areas of its IT environment need to comply with regulatory requirements and who is responsible for maintaining those workloads. This company has a workload hosted on an EC2 instance that handles the processing of credit card transactions. That workload can be easily identified through the use of resource tags that take note of the fact that the EC2 instance needs to comply with PCI DSS, is owned by the e-commerce division of the company and “JohnDoe@test.com” is accountable for information for the e-commerce website and needs to comply with PCI DSS requirements.

## Sample AWS tag keys and values

Key

Value

PoC

JohnDoe@test.com

Division

e-commerce

Compliance

PCI-DSS

Ideally, devising an AWS tagging strategy would be one of the first things an organization does when they begin their cloud journey. But there are many situations where tags are little more than an afterthought and adopted only after a significant amount of workloads already have been moved to the cloud and must be applied to existing resources. AWS offers a number of services to manage and enforce policies, and visualize tagged resources to draw insights.

Use this three-phased approach to implement an AWS tagging solution for a new or an existing AWS environment:

## AWS tag policies

The AWS Organizations software provides an efficient means to evaluate AWS tagging compliance across all member accounts through the use of tag policies.

##### The three-phase process of developing an AWS tagging structure

 ![Existing AWS accounts](https://www.pwc.com/us/en/tech-effect/content/images/aws-tagging-compliance-1.svg) 

Tag policies define and standardize tags required by your organization and for generating tag-compliance reports throughout the organization, much like service control policies. Tag policies provide granular control over the types of tags allowed and can be customized for different organizational units. You can apply tag policies at three levels:

-   In AWS Organizations, tag policies applied at the organization’s root take precedence over all other policies and are applied to all member accounts. 
    
-   Organizational units (OU): Tag policies applied at the OU level are applied to all accounts within that OU. The OU will also inherit any tag policies that exist at the organizational level.
    
-   Individual accounts: Tag policies applied to individual accounts within an OU will only affect that individual account, which will continue to inherit any policies applied at its OU and the organization levels.
    

Organization-wide compliance can be determined through the use of tag policies. It’s possible to generate a tag-compliance report that lists all tagged resources in accounts across the AWS organization and whether each resource is compliant with the specific tag policy. Organizational tagging compliance reports are generated through the AWS console, CLI or API and produce a .CSV (comma separated values) file containing a rundown of tagged resources and their tag-compliance status. You can run this report whenever you’d like to check the status of your AWS tagging environment.

## Design and visualize tagging compliance

The next step in implementing an AWS tagging solution is designing controls in accordance with your organization's policies and standards. Before designing new controls, take an inventory of your organization's existing controls to identify where policies might need to be created or amended to support the policy you’re looking to create. Where gaps in existing controls are identified, new controls may be designed to either detect or prevent non-compliant tagged resources. Controls should include specific AWS resources that require tagging such as EC2 instances, Amazon Machine Images (AMI), EBS snapshots, EC2 security groups, VPCs (virtual private clouds), S3 buckets, RDS DB instances to name a few.

You can add visualization to enable a centralized view of tagging compliance that you can share with leadership and technical teams for transparency of the environment. Your company may want to rely on specific metrics to visualize how your organization is tracking in accordance with the tag policy. Such metrics might include:

-   Percent of overall tagging compliance in all accounts
    
-   Number of non-compliant tagged resources by OU 
    
-   Number of non-compliant tagged resources by account
    
-   Number of non-compliant tagged resources by resource type
    
-   Number of non-compliant tags auto-remediated
    

One way to create visualizations is by using AWS Lambda, Amazon S3 and Amazon QuickSight to generate dashboards using the .CSV output from the tag-compliance report. Tag-compliance reports are created automatically every 48 hours. Integrated it with AWS Lambda to pull the compliance reports, then drop it into a central S3 bucket where Amazon QuickSight can then use it as the data source for a centralized dashboard of tagging compliance across all accounts.

## Implement and enforce tagging in AWS

You can use detective and preventive controls to implement the appropriate tagging environment. Detective controls identify and react to non-compliance; preventive controls stop a non-compliant action from occurring. 

An effective way to implement detective controls is through AWS Config, a service that helps users assess, audit and evaluate account configurations. AWS Config lets you use managed rules like the required-tags managed rule. It lets you define the tags required by your organization and the resource types that require these tags.

When you enable an AWS Config rule with the Amazon Simple Notification Service (SNS), it invokes an alerting mechanism that can notify administrators of non-compliant tagged resources. AWS Config will detect non-compliant tags on newly deployed resources as well as resources that were in the AWS environment prior to implementation. The figure below shows how AWS Config is used to detect misconfigurations using Managed Config Rules. When it detects an issue it sends a notification via Amazon SNS.

##### AWS Config managed rule configuration for detecting misconfigurations in AWS EC2

 ![AWS Cloud](https://www.pwc.com/us/en/tech-effect/content/images/aws-tagging-compliance-2.svg) 

```
Example "Required-Tags" Managed Config Rule
{
  "AWSTemplateFormatVersion": "2010-09-09",
  "Description": "",
  "Resources": {
    "ConfigRule”: {
      "Type": "AWS::Config::ConfigRule",
      "Properties": {
        "ConfigRuleName": "required-tags",
        "Scope": {
          "ComplianceResourceTypes" [
            "AWS::EC2::Instance"
          ]
        },
        "Description": "A Config rule that checks whether resources have required tags.",
        "InputParameters": {
          "tag1Key": "Division",
          "tag1Value": "ecommerce"
        },
        "Source": {
          "Owner": "AWS",
          "Sourceldentifier": "REQUIRED_TAGS"
        }
      }
    }
  }
}
```

## Preventive controls

There are two approaches that should be followed for implementing preventative controls. The first makes use of policy-as-code to scan your Infrastructure-as-Code (IaC) templates within your AWS CodePipeline for defined configuration requirements. Policy-as-code will flag non-compliant configurations before resources have been deployed into AWS. This method identifies non-compliant resources early in the life cycle, reducing any cost or infrastructure impacts as a result of having missed identifying errant resources until after deployment. CloudFormation Guard is an open source policy-as-code tool that can be utilized to enforce configurations in your AWS CodePipeline when utilizing CloudFormation for IaC.

##### AWS CodePipeline set up with policy-as-code to validate IaC templates

 ![AWS CodePipeline set up with policy-as-code to validate IaC templates](https://www.pwc.com/us/en/tech-effect/content/images/aws-tagging-compliance-3.svg) 

The second way to implement preventive controls for tagging is by using tag policy within the AWS Organization to “prevent non-compliant operations” from being deployed (see the screen capture that follows). Operating similarly to service control policies for tags, this configuration helps prevent any resource that violates the tag policy from being deployed into AWS accounts associated with an AWS Organization.

Preventive controls restrict manual deployments via the console as well as IaC deployments that violate the tag policy. While using tag policy to prevent non-compliant tagging, it will only prevent those resources that violate the tag policy. So in the event a user is deploying a full stack of resources, only those resources that violate the policy will be prevented, which can cause partial stack deployments unless accounted for correctly. 

Finally, the type of account (development, test, production and so on) may also affect the preferred type of control to implement. For lower-level environments, establishing detective controls with alerts along with auto-remediation may be the best way to maintain tagging compliance that also potentially saves money. While in high-level accounts, such as production, you may want to implement only detective controls to alert and not auto-remediate non-compliant resources. Preventing a critical workload from deploying or terminating a live instance in production may have more severe consequences in your AWS environment than a non-compliant tag.

## Takeaways

The use of tagging provides an easy way to manage resources effectively in a growing AWS environment. AWS tags are used to organize, define and allocate resources, making security, cost allocation and automation of resources more manageable. A failure to maintain tags across all resources consistently can make benefits more difficult to realize. Employing this three-phase tagging approach on either new or existing AWS accounts will help to improve operations management, reduce cloud waste, maintain compliance and increase transparency of your AWS environment. It’s good to be aware of and exercise these tagging advantages of your AWS environment.

*PwC strives to provide business and technology leaders with up-to-date, informed and insightful information about AWS solutions. Amazon's highest recognition of AWS expertise is the AWS Partner Ambassador designation. PwC currently has nine AWS Ambassadors globally, including six in the US. Ambassadors enjoy access to AWS Partner Solution Architects for their region, participate in dedicated Ambassador sessions at Amazon AWS events, receive technical briefings, take part in roadmap conversations with AWS service teams and have access to betas.*

***

## Appendix: Links

- [[JavaScript - Obsidian Web Clipper Bookmarklet|Obsidian Web Clipper Bookmarklet]]
- [[3-Resources/Clippings/_README|Clippings]]
