---
Date: 2022-03-25
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Code/Bash", "#Topic/Dev/Linux"]
Alias: ["Bash - GitHub Downloader"]
---

# Bash - GitHub Downloader

*Source: [How to download a project subdirectory from GitHub (Example) (coderwall.com)](https://coderwall.com/p/o2fasg/how-to-download-a-project-subdirectory-from-github)*

My customized script (requires `snv` to be installed):

```bash
#!/bin/bash

user=$1
repo=$2
path=$3
dest=$4

svn export "https://github.com/$user/$repo/trunk/$path" "$dest"
```

Invoke like so:

```bash
./github-downloader.sh "jimbrig" "dotfiles-wsl" "scripts/dev/scripts" "scripts" 
```

This will pull all the contents of the directory on GitHub at <https://github.com/jimbrig/dotfiles-wsl/scripts/dev/scripts/> into a local directory named scripts. 

Very useful!
***

## Appendix: Links

- [[Code]]
- [[Development]]

*Backlinks:*

```dataview
list from [[Bash - GitHub Downloader]] AND -"Changelog"
```