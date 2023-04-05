# AWS - Authentication and Configuration

*Source: https://dynobase.dev/dynamodb-errors/aws-dynamodb-error-missing-credentials-in-config/*

First, ensure you have installed and authenticated [AWS CLI](../../../../3-Resources/Tools/Developer%20Tools/Cloud%20Services/AWS/AWS%20CLI.md):

````powershell
# test version
aws --version

# test and install if not present
If (!(Get-Command aws)) {
	winget install Amazon.AWSCLI
}
````

See Also: [AWS - Validate and Verify Credential Setup](AWS%20-%20Validate%20and%20Verify%20Credential%20Setup.md):

````powershell
aws sts get-caller-identity
````

### Important Environment Variables

What if you have multiple AWS profiles set up, and your tables are provisioned in multiple, non-default regions? You can use special environment variables to prefix the commands with them and tell the CLI to use different profiles, regions, and adjust its behavior. Here's the list of them:

* `AWS_DEFAULT_REGION` - e.g. \`us-east-1, changes the region used for operation
* `AWS_PROFILE` - changes the profile used for the operation
* `AWS_DEFAULT_OUTPUT` - changes the format of the response. One of the following: `json`, `yaml`, `text`, `table`
* `AWS_CA_BUNDLE` - specifies the path to a certificate bundle to use for HTTPS certificate validation.
* `AWS_SHARED_CREDENTIALS_FILE` - specify the path to the location of the file where profiles information is contained, by default it's `~/.aws/credentials`

---

## Appendix: Links

* [Code](../../Code.md)
* [Development](../../../MOCs/Development.md)

*Backlinks:*

````dataview
list from [[AWS - Authentication and Configuration]] AND -"Changelog"
````
