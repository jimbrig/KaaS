---
Date: 2022-10-21
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Code/GHA", "#Type/Code/YAML", "#Topic/Dev"]
Alias: ["GHA - Stale Issues"]
---

# GHA - Stale Issues

*Source: https://github.com/actions/starter-workflows/blob/main/automation/stale.yml | https://github.com/actions/stale*

## Code

```yaml
# This workflow warns and then closes issues and PRs that have had no activity for a specified amount of time.
#
# You can adjust the behavior by modifying this file.
# For more information, see:
# https://github.com/actions/stale
name: Mark stale issues and pull requests

on:
  schedule:
  - cron: $cron-daily

jobs:
  stale:

    runs-on: ubuntu-latest
    permissions:
      issues: write
      pull-requests: write

    steps:
    - uses: actions/stale@v5
      with:
        repo-token: ${{ secrets.GITHUB_TOKEN }}
        stale-issue-message: 'Stale issue message'
        stale-pr-message: 'Stale pull request message'
        stale-issue-label: 'no-issue-activity'
        stale-pr-label: 'no-pr-activity'
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
list from [[GHA - Stale Issues]] AND -"Changelog"
```