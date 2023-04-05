# The Best  Git Workflow for Your Software Engineering Team

## Metadata

* Author: *Denny*
* Full Title: The Best  Git Workflow for Your Software Engineering Team
* Category: #Type/Highlight/Article
* URL: https://medium.com/p/6cfec81d4d78

## Highlights

* Create master branch for production, dev branch for staging, and feature branches for individual features.
* When you have to integrate another teammate’s changes into your branch, you can use git-rebase command. But this is a bit dangerous so use it with caution.
* release branches are used to merge a bunch of changes to master branch.
* hotfix branches are used to fix issues in the production server.
* git-switch and git-restore
* This is considered to be a dangerous command. But it’s very useful in situations. This command is used to apply commits from one branch to another branch.
* Production server, the public, customer-facing server. Deployment to this server is done after testing rigorously on the staging server.
* Staging server, where testing is done by the team members before releasing it to the public.
* Feature testing servers (usually spun up for each feature), where new features are tested by individual developers before pushing it to the staging server.
* Every merge to public branches should be reviewed. Whenever you are trying to merge to dev branch or master branch, create a pull request and let your teammates know that you want to merge some of your changes. This will help them take a pull and work with the latest code
* Do not mess with the history of the branches. Git commits are immutable. But there are certain commands in git which can create commits using the previous commits, making it look like you have reverted to a previous commit. This can cause issues with the working code of other teammates. Do this only if it’s absolutely required. Also, follow tip #1 after you do this.

---

## Date: 2022-03-10
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Source: medium
Link: https://medium.com/p/6cfec81d4d78
Tags: \["#Type/Highlight/Article"\]
Aliases: \["The Best  Git Workflow for Your Software Engineering Team", "The Best  Git Workflow for Your Software Engineering Team"\]

# The Best  Git Workflow for Your Software Engineering Team

## Metadata

* Author: *Denny Sam*
* Full Title: The Best  Git Workflow for Your Software Engineering Team
* Category: #Type/Highlight/Article
* URL: https://medium.com/p/6cfec81d4d78

## Highlights

* Create master branch for production, dev branch for staging, and feature branches for individual features.
* When you have to integrate another teammate’s changes into your branch, you can use git-rebase command. But this is a bit dangerous so use it with caution.
* release branches are used to merge a bunch of changes to master branch.
* hotfix branches are used to fix issues in the production server.
* git-switch and git-restore
* This is considered to be a dangerous command. But it’s very useful in situations. This command is used to apply commits from one branch to another branch.
* Production server, the public, customer-facing server. Deployment to this server is done after testing rigorously on the staging server.
* Staging server, where testing is done by the team members before releasing it to the public.
* Feature testing servers (usually spun up for each feature), where new features are tested by individual developers before pushing it to the staging server.
* Every merge to public branches should be reviewed. Whenever you are trying to merge to dev branch or master branch, create a pull request and let your teammates know that you want to merge some of your changes. This will help them take a pull and work with the latest code
* Do not mess with the history of the branches. Git commits are immutable. But there are certain commands in git which can create commits using the previous commits, making it look like you have reverted to a previous commit. This can cause issues with the working code of other teammates. Do this only if it’s absolutely required. Also, follow tip #1 after you do this.
