# AWS - Validate and Verify Credential Setup

To validate that you are correctly authenticated and connected to [AWS](../../../../3-Resources/Tools/Developer%20Tools/Cloud%20Services/AWS/AWS.md) via the [AWS CLI](../../../../3-Resources/Tools/Developer%20Tools/Cloud%20Services/AWS/AWS%20CLI.md) run the following:

````powershell
aws sts get-caller-identity
````

which should return your current *AWS IAM* identity used for communicating with the [AWS](../../../../3-Resources/Tools/Developer%20Tools/Cloud%20Services/AWS/AWS.md) services.

````json
{
    "UserId": "AIDAZXIHWE25TLP2PF7MC",
    "Account": "668420417211",
    "Arn": "arn:aws:iam::668420417211:user/jimmy.briggs@jimbrig.com"
}
````

---

## Appendix: Links

* [Code](../../Code.md)
* [Development](../../../MOCs/Development.md)
* [AWS](../../../../3-Resources/Tools/Developer%20Tools/Cloud%20Services/AWS/AWS.md)
* [AWS CLI](../../../../3-Resources/Tools/Developer%20Tools/Cloud%20Services/AWS/AWS%20CLI.md)
* *AWS IAM*
* *Cloud Services*
* [CMD - Retrieve Windows Credential Manager Saved Secrets](../../CMD/CMD%20-%20Retrieve%20Windows%20Credential%20Manager%20Saved%20Secrets.md)

*Backlinks:*

````dataview
list from [[AWS - Validate and Verify Credential Setup]] AND -"Changelog"
````
