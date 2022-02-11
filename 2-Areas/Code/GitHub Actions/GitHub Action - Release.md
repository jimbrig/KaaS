---
Date: 2022-02-11
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/GHA", "#Topic/Dev"]
Alias: ["GitHub Action - Release"]
---

# GitHub Action - Release

*Source: [r.pkg.template/release.yaml at main · insightsengineering/r.pkg.template (github.com)](https://github.com/insightsengineering/r.pkg.template/blob/main/.github/workflows/release.yaml)*

```yaml
---
name: Release 🚀

on:
  push:
    tags:
      - "v*"
  workflow_call:

jobs:
  release:
    name: Release 🚀
    runs-on: ubuntu-latest
    if: "! contains(github.event.commits[0].message, '[skip release]')"
    permissions:
      contents: write
    steps:
      - name: Checkout repo 🛎
        uses: actions/checkout@v2

      - name: Generate Changelog 📜
        run: |
          RELEASE_VERSION=$(awk -F: '/Version:/{gsub(/[ ]+/,"") ; print $2}' DESCRIPTION)
          REPOSITORY_NAME="${{ github.event.repository.name }}"
          (awk "/^#+.*${REPOSITORY_NAME//./\.}.*${RELEASE_VERSION//./\.}$/{flag=1;next}/^#+.*${REPOSITORY_NAME//./\.}.*/{flag=0}flag" NEWS.md | grep -v "^$" || echo "* ${RELEASE_VERSION}") > RELEASE_BODY.txt
      - name: Create release 🌟
        uses: softprops/action-gh-release@v1
        with:
          body_path: RELEASE_BODY.txt
          token: ${{ secrets.GITHUB_TOKEN }}
```


***

## Appendix: Links

- [[Code]]
- [[Development]]

*Backlinks:*

```dataview
list from [[GitHub Action - Release]] AND -"Changelog"
```