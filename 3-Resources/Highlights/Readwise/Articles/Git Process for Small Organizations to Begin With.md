# Git Process for Small Organizations to Begin With

## Metadata

* Author: *Zamil*
* Full Title: Git Process for Small Organizations to Begin With
* Category: #Type/Highlight/Article
* URL: https://medium.com/p/161189cd32b4

## Highlights

* The developer will squash all the feature branch commits into one. Then pull the master branch with rebase. This will apply all new commits from the master branch to the feature branch and your commit will be replayed on top of the branch.
* Push the featuere branch to GitHub. Now your feature branch is available in GitHub. The branch will be exactly one commit ahead of the master.
* Raise a PR against the master branch and leave it for code revie
* On successful code review, it will get merged to the master. Now your master will be at n+2 commit assuming initially master was at commit n(1 commit for code + 1 merge commit)
