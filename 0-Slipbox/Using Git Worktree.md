# Using Git Worktree

*Source: [Git - git-worktree Documentation (git-scm.com)](https://git-scm.com/docs/git-worktree)*

## Contents

* [YouTube Video](Using%20Git%20Worktree.md#youtube-video)
* [Description](Using%20Git%20Worktree.md#description)
* [Examples](Using%20Git%20Worktree.md#examples)

## YouTube Video

*Source: [Git's Best And Most Unknown Feature - YouTube](https://www.youtube.com/watch?v=2uEqYw-N8uE)*

<details><summary>View Video:</summary><p>
<iframe title="Git's Best And Most Unknown Feature" src="https://www.youtube.com/embed/2uEqYw-N8uE?feature=oembed" height="113" width="200" allowfullscreen="" allow="fullscreen" style="aspect-ratio: 1.76991 / 1; width: 100%; height: 100%;"></iframe>	
</p></details>

## Description

Manage multiple working trees attached to the same repository.

A git repository can support multiple working trees, allowing you to check out more than one branch at a time. With `git worktree add` a new working tree is associated with the repository, along with additional metadata that differentiates that working tree from others in the same repository. The working tree, along with this metadata, is called a "worktree".

This new worktree is called a "linked worktree" as opposed to the "main worktree" prepared by [git-init\[1\]](https://git-scm.com/docs/git-init) or [git-clone\[1\]](https://git-scm.com/docs/git-clone). A repository has one main worktree (if it’s not a bare repository) and zero or more linked worktrees. When you are done with a linked worktree, remove it with `git worktree remove`.

In its simplest form, `git worktree add <path>` automatically creates a new branch whose name is the final component of `<path>`, which is convenient if you plan to work on a new topic. For instance, `git worktree add ../hotfix` creates new branch `hotfix` and checks it out at path `../hotfix`. To instead work on an existing branch in a new worktree, use `git worktree add <path> <branch>`. On the other hand, if you just plan to make some experimental changes or do testing without disturbing existing development, it is often convenient to create a *throwaway* worktree not associated with any branch. For instance, `git worktree add -d <path>` creates a new worktree with a detached `HEAD` at the same commit as the current branch.

If a working tree is deleted without using `git worktree remove`, then its associated administrative files, which reside in the repository (see "DETAILS" below), will eventually be removed automatically (see `gc.worktreePruneExpire` in [git-config\[1\]](https://git-scm.com/docs/git-config)), or you can run `git worktree prune` in the main or any linked worktree to clean up any stale administrative files.

If the working tree for a linked worktree is stored on a portable device or network share which is not always mounted, you can prevent its administrative files from being pruned by issuing the `git worktree lock` command, optionally specifying `--reason` to explain why the worktree is locked.

## Examples

You are in the middle of a refactoring session and your boss comes in and demands that you fix something immediately. You might typically use [git-stash\[1\]](https://git-scm.com/docs/git-stash) to store your changes away temporarily, however, your working tree is in such a state of disarray (with new, moved, and removed files, and other bits and pieces strewn around) that you don’t want to risk disturbing any of it. Instead, you create a temporary linked worktree to make the emergency fix, remove it when done, and then resume your earlier refactoring session.

````bash
git worktree add -b emergency-fix ../temp master
pushd ../temp
# ... hack hack hack ...
git commit -a -m 'emergency fix for boss'
popd
git worktree remove ../temp
````

---

## Appendix: Links and References

* [2022-09-04](../2-Areas/Daily-Notes/2022/2022-09/2022-09-04.md)
* [Git](../3-Resources/Tools/Developer%20Tools/Version%20Control/Git.md)

*Backlinks:*

````dataview
list from [[Using Git Worktree]] AND -"Changelog"
````

---

Jimmy Briggs <jimmy.briggs@jimbrig.com> | 2022
