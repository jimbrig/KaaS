---
Date: 2022-02-11
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Code/GHA", "#Type/Code/R", "#Topic/Dev/R"]
Alias: ["GitHub Action - R Spelling Checks"]
---

# GitHub Action - R Spelling Checks

*Source: [r.pkg.template/spelling.yaml at main · insightsengineering/r.pkg.template (github.com)](https://github.com/insightsengineering/r.pkg.template/blob/main/.github/workflows/spelling.yaml)*

```yaml
name: Spelling 🆎

on:
  push:
    branches:
      - main
      - pre-release
  pull_request:
    branches:
      - main
      - pre-release
  workflow_call:

jobs:
  spelling:
    name: Check spelling 🔠
    runs-on: ubuntu-latest
    if: "! contains(github.event.commits[0].message, '[skip spelling]')"
    container:
      image: ghcr.io/insightsengineering/rstudio_4.1.2_bioc_3.14:latest

    steps:
      - name: Checkout Code 🛎
        uses: actions/checkout@v2

      - name: Run Spellcheck 👟
        uses: insightsengineering/r-spellcheck-action@v2
        with:
          exclude: inst/extdata/*
```


***

## Appendix: Links

- [[Code]]
- [[R]]
- [[Development]]

*Backlinks:*

```dataview
list from [[GitHub Action - R Spelling Checks]] AND -"Changelog"
```