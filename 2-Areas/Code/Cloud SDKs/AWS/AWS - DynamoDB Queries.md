---
Date: 2022-11-02
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Code/AWS", "#Topic/Dev/Cloud/AWS"]
Alias: ["AWS - DynamoDB Queries"]
---

# AWS - DynamoDB Queries

*Source: https://dynobase.dev/dynamodb-cli-query-examples*

See Also [[PowerShell - Install AWS CLI]], [[PowerShell - AWS Wrapper Functions]]

## Overview

First, ensure you have installed and authenticated [[AWS CLI]]:

```powershell
# test version
aws --version

# test and install if not present
If (!(Get-Command aws)) {
	winget install Amazon.AWSCLI
}
```

See Also: [[AWS - Validate and Verify Credential Setup]]:

```powershell
aws sts get-caller-identity
```

***

## Appendix: Links

- [[Code]]
- [[Development]]

*Backlinks:*

```dataview
list from [[AWS - DynamoDB Queries]] AND -"Changelog"
```