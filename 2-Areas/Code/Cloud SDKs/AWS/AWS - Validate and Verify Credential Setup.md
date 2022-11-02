---
Date: 2022-11-02
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Code", "#Topic/Dev"]
Alias: ["AWS - Validate and Verify Credential Setup"]
---

# AWS - Validate and Verify Credential Setup

To validate that you are correctly authenticated and connected to [[AWS]] via the [[AWS CLI]] run the following:

```powershell
aws sts get-caller-identity
```

which should return your current [[AWS IAM]] identity used for communicating with the [[AWS]] services.

```json
{
    "UserId": "AIDAZXIHWE25TLP2PF7MC",
    "Account": "668420417211",
    "Arn": "arn:aws:iam::668420417211:user/jimmy.briggs@jimbrig.com"
}
```

***

## Appendix: Links

- [[Code]]
- [[Development]]
- [[AWS]]
- [[AWS CLI]]
- [[AWS IAM]]
- [[3-Resources/Tools/Developer Tools/Cloud Services/_README|Cloud Services]]
- [[CMD - Retrieve Windows Credential Manager Saved Secrets]]

*Backlinks:*

```dataview
list from [[AWS - Validate and Verify Credential Setup]] AND -"Changelog"
```