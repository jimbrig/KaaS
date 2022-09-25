---
Date: 2022-02-11
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Code/GHA", "#Type/Code/R", "#Topic/Dev/R"]
Alias: ["GitHub Action - R Package Validation"]
---

# GitHub Action - R Package Validation

*Source: [r.pkg.template/validation.yaml at main · insightsengineering/r.pkg.template (github.com)](https://github.com/insightsengineering/r.pkg.template/blob/main/.github/workflows/validation.yaml)*

```yaml
name: R Package Validation report 📃

on:
  push:
    tags:
      - "v*"
    branches:
      - main
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
        default: true
        type: boolean
    secrets:
      REPO_GITHUB_TOKEN:
        description: |
          Github token with read access to repositories, required for staged.dependencies installation
        required: false

jobs:
  r-pkg-validation:
    name: Create report 📃
    runs-on: ubuntu-latest
    if: "! contains(github.event.commits[0].message, '[skip validation]')"
    container:
      image: ghcr.io/insightsengineering/rstudio_4.1.2_bioc_3.14:latest
    env:
      GITHUB_PAT: ${{ secrets.REPO_GITHUB_TOKEN }}
    permissions:
      contents: write
      packages: write
      deployments: write
    steps:
      - name: Checkout repo 🛎
        uses: actions/checkout@v2

      - name: Run Staged dependencies 🎦
        uses: insightsengineering/staged-dependencies-action@v1
        with:
          run-system-dependencies: ${{ inputs.install-system-dependencies }}
        env:
          SD_ENABLE_CHECK: ${{ inputs.enable-staged-dependencies-check }}

      - name: Build report 🏗
        uses: insightsengineering/thevalidatoR@v1.1.2

      - name: Upload report for review ⬆
        if: github.ref != 'refs/heads/main'
        uses: actions/upload-artifact@v2
        with:
          name: validation_report.pdf
          path: validation_report.pdf

  upload-release-assets:
    name: Upload report to release 🔼
    needs: r-pkg-validation
    runs-on: ubuntu-latest
    if: startsWith(github.ref, 'refs/tags/v')
    steps:
      - name: Wait for release to succeed ⏳
        timeout-minutes: 2
        uses: lewagon/wait-on-check-action@v1.1.1
        with:
          ref: "${{ github.ref }}"
          check-name: "Release 🚀"
          repo-token: ${{ secrets.GITHUB_TOKEN }}
          wait-interval: 10

      - name: Download artifact ⏬
        uses: actions/download-artifact@v2
        with:
          name: validation_report.pdf

      - name: Upload report to release 🔼
        uses: svenstaro/upload-release-action@v2
        with:
          file: ./validation_report.pdf
          asset_name: validation-report.pdf
          repo_token: ${{ secrets.GITHUB_TOKEN }}
          tag: ${{ github.ref }}
          overwrite: false
```


***

## Appendix: Links

- [[Code]]
- [[2-Areas/MOCs/R]]
- [[Development]]

*Backlinks:*

```dataview
list from [[GitHub Action - R Package Validation]] AND -"Changelog"
```