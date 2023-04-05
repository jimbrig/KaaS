# Git Reverting Commits

*Source: [dev-notes/git-checkout-remote-branch.md at main · brotherkaif/dev-notes (github.com)](https://github.com/brotherkaif/dev-notes/blob/main/git/git-remove-commits.md)*

## Revert and Keep Changes

 > 
 > \[!NOTE\] 
 > This solution works if the commit to be removed is the last committed one.

* Copy the commit reference you like to go back to from the log:

````bash
git log
````

* Reset git to the commit’s reference:

````bash
git reset <commit_ref>
````

* Stash/Store the local changes from the wrong commit to use later after pushing to remote:

````bash
git stash
````

* Push the changes to remote repository, (`-f` or `--force`):

````bash
git push -f
````

* Get back the stored changes to local repository:

````bash
git stash apply
````

* In case you have untracked/new files in the changes, you need to add them to git before committing:

````bash
git add .
````

* Add whatever extra changes you need, then commit the needed files, (or use a dot '.' instead of stating each file name, to commit all files in the local repository:

````bash
git commit -m "<new_commit_message>" <file1> <file2> ...
````

or,

````bash
git commit -m "<new_commit_message>" .
````

---

## Appendix: Links and References

* [2022-09-04](../2-Areas/Daily-Notes/2022/2022-09/2022-09-04.md)
* [Git](../3-Resources/Tools/Developer%20Tools/Version%20Control/Git.md)

*Backlinks:*

````dataview
list from [[Git Reverting Commits]] AND -"Changelog"
````

---

Jimmy Briggs <jimmy.briggs@jimbrig.com> | 2022
