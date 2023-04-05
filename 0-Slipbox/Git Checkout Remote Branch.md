# Git Checkout Remote Branch

*Source: [dev-notes/git-checkout-remote-branch.md at main · brotherkaif/dev-notes (github.com)](https://github.com/brotherkaif/dev-notes/blob/main/git/git-checkout-remote-branch.md)*

## Contents

* [With One Remote](Git%20Checkout%20Remote%20Branch.md#with-one-remote)
* [With Greater than One Remotes](Git%20Checkout%20Remote%20Branch.md#with-greater-than-one-remotes)
* [Appendix: Links and References](Git%20Checkout%20Remote%20Branch.md#appendix-links-and-references)

## With One Remote

With [Git](../3-Resources/Tools/Developer%20Tools/Version%20Control/Git.md) versions ≥ 1.6.6, with only one remote, you can do:

````bash
git fetch
git checkout test
````

`git checkout test` will *NOT* work in modern git if you have multiple remotes. 

In this case use:

````bash
git checkout -b test <name of remote>/test
````

Or the shorthand:

````bash
git checkout -t <name of remote>/test
````

## With Greater than One Remotes

Before you can start working locally on a remote branch, you need to fetch it.

To fetch a branch, you simply need to:

````bash
git fetch origin
````

This will fetch all of the remote branches for you. You can see the branches available for checkout with:

````bash
git branch -v -a
````

With the remote branches in hand, you now need to check out the branch you are interested in, giving you a local working copy:

````bash
git checkout -b test origin/test
````

---

## Appendix: Links and References

* [2022-09-04](../2-Areas/Daily-Notes/2022/2022-09/2022-09-04.md)
* [Git](../3-Resources/Tools/Developer%20Tools/Version%20Control/Git.md)

*Backlinks:*

````dataview
list from [[Git Checkout Remote Branch]] AND -"Changelog"
````

---

Jimmy Briggs <jimmy.briggs@jimbrig.com> | 2022
