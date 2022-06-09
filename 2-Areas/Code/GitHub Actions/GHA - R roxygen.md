---
Date: 2022-02-11
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Code/GHA", "#Type/Code/R", "#Topic/Dev/R"]
Alias: ["GitHub Action - roxygen"]
---

# GitHub Action - `roxygen`

*Source: [r.pkg.template/roxygen.yaml at main · insightsengineering/r.pkg.template (github.com)](https://github.com/insightsengineering/r.pkg.template/blob/main/.github/workflows/roxygen.yaml)*

See Also: [[R Package - roxygen2]]

```yaml
---
name: Roxygen 🅾

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
    inputs:
      install-system-dependencies:
        description: Check for and install system dependencies
        required: false
        default: false
        type: boolean
      enable-staged-dependencies-check:
        description: Enable staged dependencies YAML check
        required: false
        default: false
        type: boolean
    secrets:
      REPO_GITHUB_TOKEN:
        description: |
          Github token with read access to repositories, required for staged.dependencies installation
        required: false

jobs:
  man-pages:
    name: Manual pages check 🏁
    runs-on: ubuntu-latest
    if: "! contains(github.event.commits[0].message, '[skip roxygen]')"
    container:
      image: ghcr.io/insightsengineering/rstudio_4.1.2_bioc_3.14:latest

    steps:
      - name: Get branch names 🌿
        id: branch-name
        uses: tj-actions/branch-names@v5

      - name: Checkout repo 🛎
        uses: actions/checkout@v2
        with:
          ref: ${{ steps.branch-name.outputs.head_ref_branch }}
          path: ${{ github.event.repository.name }}

      - name: Run Staged dependencies 🎦
        uses: insightsengineering/staged-dependencies-action@v1
        with:
          run-system-dependencies: ${{ inputs.install-system-dependencies }}
        env:
          GITHUB_PAT: ${{ secrets.REPO_GITHUB_TOKEN }}
          SD_REPO_PATH: ${{ github.event.repository.name }}
          SD_ENABLE_CHECK: ${{ inputs.enable-staged-dependencies-check }}

      - name: Generate man pages 📄
        run: |
          setwd("${{ github.event.repository.name }}")
          logfile <- "roxygen_${{ github.event.repository.name }}.log"
          con <- file(logfile)
          sink(con, append = TRUE, split = TRUE)
          sink(con, append = TRUE, type = "message")
          roxygen2::roxygenize('.', roclets = c('rd', 'collate', 'namespace'))
          sink()
          sink(type = "message")
          logs <- readLines(logfile)
          error_marker <- grep("Error:", logs)
          warnings_marker <- grep("Warning message", logs)
          if (length(warnings_marker) > 0) {
            cat("⚠ One or more warnings were generated during the roxygen build:\n")
            cat(logs[warnings_marker[[1]]:length(logs)], sep = "\n")
            stop("Please 🙏 fix the warnings shown below this message 👇")
          }
          if (length(error_marker) > 0) {
            cat("☠ One or more errors were generated during the roxygen build:\n")
            cat(logs[error_marker[[1]]:length(logs)], sep = "\n")
            stop("Please 🙏 fix the errors shown below this message 👇")
          }
        shell: Rscript {0}

      - name: Roxygen check 🅾
        run: |
          cd ${{ github.event.repository.name }}
          git status -s
          if [[ -n `git status -s | grep man` ]]
          then {
            ROXYGEN_VERSION="$(Rscript -e 'packageVersion("roxygen2")' | awk '{print $NF}')"
            echo "🙈 Manuals are not up-to-date with roxygen comments!"
            echo "🔀 The following differences were noted:"
            git diff man/*
            echo -e "\n💻 Please rerun the following command on your workstation and push your changes"
            echo "--------------------------------------------------------------------"
            echo "roxygen2::roxygenize('.', roclets = c('rd', 'collate', 'namespace'))"
            echo "--------------------------------------------------------------------"
            echo "ℹ roxygen2 version that was used in this workflow: $ROXYGEN_VERSION"
            echo "🙏 Please ensure that the 'RoxygenNote' field in the DESCRIPTION file matches this version"
            exit 1
          } else {
            echo "💚 Manuals are up-to-date with roxygen comments"
          }
          fi
        shell: bash
```

***

## Appendix: Links

- [[Code]]
- [[Development]]

*Backlinks:*

```dataview
list from [[GitHub Action - roxygen]] AND -"Changelog"
```