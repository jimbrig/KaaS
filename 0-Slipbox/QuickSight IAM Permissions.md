# QuickSight IAM Permissions

## Contents

* [Passing IAM Roles to QuickSight](QuickSight%20IAM%20Permissions.md#passing-iam-roles-to-quicksight)
* [Attaching Additional Policies](QuickSight%20IAM%20Permissions.md#attaching-additional-policies)
* [Appendix: Links](QuickSight%20IAM%20Permissions.md#appendix-links)

## Passing IAM Roles to QuickSight

When your IAM users sign up for Amazon QuickSight, they can choose to use the QuickSight-managed role (this is the default role). Or they can pass an existing IAM role to QuickSight.

For your users to pass IAM roles to QuickSight, your IAM administrator needs to complete the following tasks:

* **Create an IAM role**. For more information about creating IAM roles, see [Creating IAM roles](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_create.html) in the *IAM User Guide*.

* **Attach a trust policy to your IAM role that allows QuickSight to assume the role**. Use the following example to create a trust policy for the role. The following example trust policy allows the Amazon QuickSight principal to assume the IAM role that it's attached to.
  
  For more information about creating IAM trust policies and attaching them to roles, see [Modifying a Role (Console)](https://docs.aws.amazon.com/IAM/latest/UserGuide/roles-managingrole-editing-console.html#roles-managingrole_edit-trust-policy.html) in the *IAM User Guide*.

````json
{  
  "Version": "2012-10-17",  
  "Statement": [  
    {  
      "Effect": "Allow",  
      "Principal": {  
        "Service": "quicksight.amazonaws.com"  
      },  
      "Action": "sts:AssumeRole"  
    }  
  ]  
}
````

**Assign the following IAM permissions to your IAM administrator (IAM users or roles)**:

* `quicksight:UpdateResourcePermissions` – This grants IAM users who are QuickSight administrators the permission to update resource-level permissions in QuickSight. For more information about resource types defined by QuickSight, see [Actions, resources, and condition keys for Amazon QuickSight](https://docs.aws.amazon.com/IAM/latest/UserGuide/list_amazonquicksight.html) in the *IAM User Guide*.

* `iam:PassRole` – This grants users permission to pass roles to QuickSight. For more information, see [Granting a user permissions to pass a role to an AWS service](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_use_passrole.html) in the *IAM User Guide*.

* `iam:ListRoles` – (Optional) This grants users permission to see a list of existing roles in QuickSight. If this permission is not provided, they can use an ARN to use existing IAM roles.

Following is an example IAM permissions policy that enables managing resource-level permissions, listing IAM roles, and passing IAM roles in Amazon QuickSight.

````json
{  
    "Version": "2012-10-17",  
    "Statement": [  
        {  
            "Effect": "Allow",  
            "Action": "iam:ListRoles",  
            "Resource": "arn:aws:iam::account-id:role:*"  
        },  
        {  
            "Effect": "Allow",  
            "Action": "iam:PassRole",  
            "Resource": "arn:aws:iam::account-id:role/path/role-name",  
            "Condition": {  
                "StringEquals": {  
                    "iam:PassedToService": [  
                        "quicksight.amazonaws.com"  
                    ]  
                }  
            }  
        },  
        {  
            "Effect": "Allow",  
            "Action": "quicksight:UpdateResourcePermissions",  
            "Resource": "*"  
        }  
    ]  
}
````

After your IAM administrator completes the prerequisites, your IAM users can pass IAM roles to QuickSight. They do so by choosing an IAM role when they [sign up for QuickSight](https://docs.aws.amazon.com/quicksight/latest/user/signing-up.html), or by [switching to an IAM role](https://docs.aws.amazon.com/quicksight/latest/user/security_iam_service-with-iam.html#use-iam) on their QuickSight Security and Permissions page. To learn how to switch to an existing IAM role in QuickSight, see the following section.

## Attaching Additional Policies

If you're using another AWS service, such as Amazon Athena or Amazon S3, you can create a permissions policy that grants QuickSight permission to perform specific actions. You can then attach the policy to the IAM roles that you later pass to QuickSight. The following are examples of how you can set up and attach additional permissions policies to your IAM roles.

For an example managed policy for QuickSight in Athena, see [AWSQuicksightAthenaAccess Managed Policy](https://docs.aws.amazon.com/athena/latest/ug/awsquicksightathenaaccess-managed-policy.html) in the *Amazon Athena User Guide*. IAM users can access this role in QuickSight using the following ARN: `arn:aws:iam::aws:policy/service-role/AWSQuicksightAthenaAccess`.

The following is an example of a permissions policy for QuickSight in Amazon S3. For more information about using IAM with Amazon S3, see [Identity and access management in Amazon S3](https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-access-control.html) in the *Amazon S3 User Guide*.

````json
{  
    "Version": "2012-10-17",  
    "Statement": [  
        {  
            "Effect": "Allow",  
            "Action": "s3:ListAllMyBuckets",  
            "Resource": "arn:aws:s3:::*"  
        },  
        {  
            "Action": [  
                "s3:ListBucket"  
            ],  
            "Effect": "Allow",  
            "Resource": [  
                "arn:aws:s3:::aws-athena-query-results-us-west-2-123456789"  
            ]  
        },  
        {  
            "Action": [  
                "s3:GetObject",  
                "s3:GetObjectVersion"  
            ],  
            "Effect": "Allow",  
            "Resource": [  
                "arn:aws:s3:::aws-athena-query-results-us-west-2-123456789/*"  
            ]  
        },  
        {  
            "Action": [  
                "s3:ListBucketMultipartUploads",  
                "s3:GetBucketLocation"  
            ],  
            "Effect": "Allow",  
            "Resource": [  
                "arn:aws:s3:::aws-athena-query-results-us-west-2-123456789"  
            ]  
        },  
        {  
            "Effect": "Allow",  
            "Action": [  
                "s3:PutObject",  
                "s3:AbortMultipartUpload",  
                "s3:ListMultipartUploadParts"  
            ],  
            "Resource": [  
                "arn:aws:s3:::aws-athena-query-results-us-west-2-123456789/*"  
            ]  
        }  
    ]  
}
````

**To use an existing IAM role in QuickSight**

1. In QuickSight, choose your account name in the navigation bar at top right and choose **Manage QuickSight**.

1. On the **Manage QuickSight** page that opens, choose **Security & Permissions** in the menu at left.

1. In the **Security & Permissions** page that opens, under **QuickSight access to AWS services**, choose **Manage**.

1. For **IAM role**, choose **Use an existing role**, and then do one of the following:
   
   * Choose the role that you want to use from the list.
   
   * Or, if you don't see a list of existing IAM roles, you can enter the IAM ARN for the role in the following format: `arn:aws:iam::account-id:role/path/role-name`.

1. Choose **Save**.

**Data Source Access:**

When you connect to a data source that requires a user name, the user name must have SELECT permissions on some system tables. These permissions allow Amazon QuickSight to do things such as discover table schemas and estimate table size.

The following table identifies the tables that the user account must have SELECT permissions for, depending on the type of database you are connecting to. These requirements apply for all database instances you connect to, regardless of their environment. In other words, they apply whether your database instances are on-premises, in Amazon RDS, in Amazon EC2, or elsewhere.

**Access to AWS Resources:**

The following example for Amazon QuickSight Enterprise and Standard editions shows a policy that you can use to enable a user to manage access to AWS resources. This is an optional step during setup, and the user only needs this access while they are configuring access.

````json
{  
            "Effect": "Allow",  
            "Action": [  
                "iam:AttachRolePolicy",  
                "iam:DetachRolePolicy",  
                "iam:ListAttachedRolePolicies",  
                "iam:GetPolicy",  
                "iam:CreatePolicyVersion",  
                "iam:DeletePolicyVersion",  
                "iam:GetPolicyVersion",  
                "iam:ListPolicyVersions",  
                "iam:DeleteRole",  
                "iam:CreateRole",  
                "iam:GetRole",  
                "iam:ListRoles",  
                "iam:CreatePolicy",  
                "iam:ListEntitiesForPolicy",  
                "s3:ListAllMyBuckets",  
                "athena:ListDataCatalogs",  
                "athena:GetDataCatalog"  
            ],  
            "Resource": "*"  
}
````

---

## Appendix: Links

* [Development](../2-Areas/MOCs/Development.md)
* [Cloud Computing](Cloud%20Computing.md)
* [AWS QuickSight](../3-Resources/Tools/Developer%20Tools/Cloud%20Services/AWS/AWS%20QuickSight.md)
* *AWS*

*Backlinks:*

````dataview
list from [[QuickSight IAM Permissions]] AND -"Changelog"
````
