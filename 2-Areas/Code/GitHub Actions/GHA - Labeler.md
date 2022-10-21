---
Date: 2022-10-21
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Code/GHA", "#Type/Code/YAML", "#Topic/Dev"]
Alias: ["GHA - Labeler"]
---

# GHA - Labeler

*Source: https://github.com/actions/labeler | https://github.com/actions/starter-workflows/blob/main/automation/label.yml*

## Code

```yaml
# This workflow will triage pull requests and apply a label based on the
# paths that are modified in the pull request.
#
# To use this workflow, you will need to set up a .github/labeler.yml
# file with configuration.  For more information, see:
# https://github.com/actions/labeler

name: Labeler
on: [pull_request]

jobs:
  label:

    runs-on: ubuntu-latest
    permissions:
      contents: read
      pull-requests: write

    steps:
    - uses: actions/labeler@v4
      with:
        repo-token: "${{ secrets.GITHUB_TOKEN }}"
```


***

## Appendix: Links and References

- [[Development]]
- [[Code]]
- [[GitHub Actions]]
- [[GitHub]]

***

Jimmy Briggs <jimmy.briggs@jimbrig.com> | 2022

***

*Backlinks:*

```dataview
list from [[GHA - Labeler]] AND -"Changelog"
```