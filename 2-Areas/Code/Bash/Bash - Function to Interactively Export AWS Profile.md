# Bash - Function to Interactively Export AWS Profile

## *Source: https://github.com/rothgar/mastering-zsh/blob/master/docs/helpers/functions.md#interactively-export-aws_profile*

## Date: 2022-11-11
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: \["#Type/Code", "#Topic/Dev"\]
Alias: \["Bash - Function to Show Website Certificate from Hostname"\]

# Bash - Function to Show Website Certificate from Hostname

*Source: https://github.com/rothgar/mastering-zsh/blob/master/docs/helpers/functions.md#show-website-certificate-from-hostname*

 > 
 > \[!NOTE\] Dependencies
 > 
 > * Function depends on having a configured `~/.aws/config`
 > * Function depends on the *fzf* utility

````bash
sudo apt-get -y install fzf
````

## Snippet

````bash
function awsp() {
    export AWS_PROFILE=$(grep profile ${HOME}/.aws/config \
        | awk '{print $2}' | sed 's,],,g' \
        | fzf --layout reverse --height=10% --border)
}
````

## Usage

````bash
awsp
````

will launch an interactive prompt to select the [AWS CLI](../../../3-Resources/Tools/Developer%20Tools/Cloud%20Services/AWS/AWS%20CLI.md) profile to use by settings the `AWS_PROFILE` environment variable:

````bash

````

---

## Appendix: Links

* [Code](../Code.md)
* [Development](../../MOCs/Development.md)

*Backlinks:*

````dataview
list from [[Bash - Function to Show Website Certificate from Hostname]] AND -"Changelog"
````

---

## Appendix: Links

* [Code](../Code.md)
* [Development](../../MOCs/Development.md)

*Backlinks:*

````dataview
list from [[Bash - Function to Interactively Export AWS Profile]] AND -"Changelog"
````
