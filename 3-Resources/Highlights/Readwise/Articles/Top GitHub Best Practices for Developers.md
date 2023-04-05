# Top GitHub Best Practices for Developers

## Metadata

* Author: 
* Full Title: Top GitHub Best Practices for Developers
* Category: #Type/Highlight/Article
* URL: https://www.datree.io/resources/github-best-practices

## Highlights

* How we created this GitHub best practices list
  ‍
  We interviewed hundreds of software developers to understand their development workflows and how they work with GitHub. Using our own product, we also scanned thousands of GitHub repositories for our customers.
* 0 – Don’t git push straight to master
* Regardless if you use Gitflow or any other git branching model, it is always a good idea to turn on git branch protection to prevent direct commits and ensure your main branch code is deployable at all times. All commits should be pushed to master through pull requests.
* 1 – Don’t commit code as an unrecognized author
* 4 – Don’t commit dependencies into source control
* 5 – Don’t commit local config files into source control
  We strongly recommend against committing your local config files to version control. Usually, those are private configuration files you don’t want to push to remote because they are holding secrets, personal preferences, history or general information that should stay only in your local environment.
* 6 – Create a meaningful git ignore file
  A .gitignore file is a must in each repository to ignore predefined files and directories. It will help you to prevent secret keys, dependencies and many other possible discrepancies in your code. You can choose a relevant template from Gitignore.io to get started quickly.
* 7 – Archive dead repositories
* 8 – Lock package version
* 9 – Specify standard package versions
* 10 - Leverage task list
* Tasks lists provide a way for you totrack to-dos directly within comments, issues, and even MarkDownfiles (\*.MD) within your repository (users must have write access to therepository to make changes to MarkDownfiles).
  Tasks lists provide an excellent way tocapture a high-level overview of a task or issue, as well as keep othersupdated on its state. Make sure to take advantage of this powerful new feature!
* 11 - Use a branch naming convention
* 12 - Delete stale branches
  Every time one branch is merged into another, the branch that is merged in becomes stale, assuming further work isn’t being done in it.
  While it may seem useful or even necessary to keep the extra data on hand, the reality is that stale branches are abandoned 98% of the time and simply clutter up your project.
  Even if you delete a branch when you shouldn’t have, you can restore it - and if you don’t trust GitHub’s restore feature, chances are it’s safe on somebody’s computer, thanks to the magic of distributed versioning.
* 13 - Keep branches up to date
