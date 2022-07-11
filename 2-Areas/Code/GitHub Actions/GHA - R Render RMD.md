---
Date: 2022-06-09
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Code/GHA", "#Type/Code/R", "#Topic/Dev/R"]
Alias: ["GHA - R Render RMD"]
---

# GHA - R Render RMD

*Source: https://github.com/r-lib/actions/tree/master/examples#render-rmarkdown*

`usethis::use_github_action("render-rmarkdown")`

This example automatically re-builds any Rmarkdown file in the repository whenever it changes and commits the results to the master branch.

```yaml
# Workflow derived from https://github.com/r-lib/actions/tree/master/examples
# Need help debugging build failures? Start at https://github.com/r-lib/actions#where-to-find-help
on:
  push:
    paths: ['**.Rmd']

name: render-rmarkdown

jobs:
  render-rmarkdown:
    runs-on: ubuntu-latest
    env:
      GITHUB_PAT: ${{ secrets.GITHUB_TOKEN }}
    steps:
      - name: Checkout repo
        uses: actions/checkout@v2
        with:
          fetch-depth: 0

      - uses: r-lib/actions/setup-pandoc@v1

      - uses: r-lib/actions/setup-r@v1

      - uses: r-lib/actions/setup-renv@v1
      
      - name: Render Rmarkdown files
        run: |
          RMD_PATH=($(git diff --name-only ${{ github.event.before }} ${{ github.sha }} | grep '[.]Rmd$'))
          Rscript -e 'for (f in commandArgs(TRUE)) if (file.exists(f)) rmarkdown::render(f)' ${RMD_PATH[*]}

      - name: Commit results
        run: |
          git config --local user.name "$GITHUB_ACTOR"
          git config --local user.email "$GITHUB_ACTOR@users.noreply.github.com"
          git commit ${RMD_PATH[*]/.Rmd/.md} -m 'Re-build Rmarkdown files' || echo "No changes to commit"
          git push origin || echo "No changes to commit"
```

***

## Appendix: Links

- [[Code]]
- [[Development]]

*Backlinks:*

```dataview
list from [[GHA - R Render RMD]] AND -"Changelog"
```