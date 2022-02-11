---
Date: 2022-02-11
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Code/GHA", "#Type/Code/R", "#Topic/Dev/R"]
Alias: ["GitHub Action - pkgdown"]
---

# GitHub Action - pkgdown

*Source: [r.pkg.template/pkgdown.yaml at main · insightsengineering/r.pkg.template (github.com)](https://github.com/insightsengineering/r.pkg.template/blob/main/.github/workflows/pkgdown.yaml)*

See Also: [[R Package - pkgdown]]

```yaml
---
name: Pkgdown Docs 📚

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
    paths:
      - inst/templates/**
      - _pkgdown.yaml
      - DESCRIPTION
      - "**.md"
      - man/**
      - LICENSE.*
      - NAMESPACE
  workflow_call:
    secrets:
      REPO_GITHUB_TOKEN:
        description: |
          Github token with read access to repositories, required for staged.dependencies installation
        required: false
    inputs:
      install-system-dependencies:
        description: Check for and install system dependencies
        required: false
        default: false
        type: boolean
      fail-pkgdown-on-warnings:
        description: Fail the pkgdown workflow if warnings are generated while generating docs
        required: false
        default: false
        type: boolean
      enable-staged-dependencies-check:
        description: Enable staged dependencies YAML check
        required: false
        default: false
        type: boolean

jobs:
  pkgdown:
    name: Generate 🐣
    runs-on: ubuntu-latest
    if: "! contains(github.event.commits[0].message, '[skip docs]')"
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

      - name: Install R package 🚧
        run: R CMD INSTALL ${{ github.event.repository.name }}
        shell: bash

      - name: Build docs 🏗
        run: |
          repo="${{ github.event.repository.name }}"
          cd $repo
          R --slave -e 'pkgdown::build_site(devel = TRUE)' 2>&1 | tee pkgdown_${repo}.log
          if [ "${{ inputs.fail-pkgdown-on-warnings }}" == "true" ]; then {
            grep "Warning message" pkgdown_${repo}.log > pkgdown_warnings_${repo}.log
            if [[ $(wc -l <pkgdown_warnings_${repo}.log) -gt 0 ]]; then {
              echo "----------------------------------------"
              echo "⚠ One or more warnings were generated during the pkgdown build."
              echo "Please 🙏 fix the warnings shown above 👆"
              exit 1
            }
            fi
          }
          fi
        shell: bash

      - name: Create documentation artifact 📂
        run: |
          pushd ${{ github.event.repository.name }}/docs/
          zip -r9 $OLDPWD/pkgdown.zip *
          popd
        shell: bash

      - name: Upload docs for review ⬆
        if: github.ref != 'refs/heads/main'
        uses: actions/upload-artifact@v2
        with:
          name: pkgdown.zip
          path: pkgdown.zip

      - name: Publish docs 📢
        if: github.ref == 'refs/heads/main'
        run: |
          cd ${{ github.event.repository.name }}
          git config --local user.email "actions@github.com"
          git config --local user.name "GitHub Actions"
          Rscript -e 'pkgdown::deploy_to_branch(new_process = FALSE)'

  upload-release-assets:
    name: Upload documentation assets 🔼
    needs: pkgdown
    runs-on: ubuntu-latest
    if: "startsWith(github.ref, 'refs/tags/v') && !contains(github.event.head_commit.message, 'avert') && !contains(github.event.head_commit.message, 'docs')"
    steps:
      - name: Checkout repo 🛎
        uses: actions/checkout@v2

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
          name: pkgdown.zip

      - name: Upload binaries to release ⤴
        uses: svenstaro/upload-release-action@v2
        with:
          repo_token: ${{ secrets.GITHUB_TOKEN }}
          file: pkgdown.zip
          asset_name: pkgdown.zip
          tag: ${{ github.ref }}
          overwrite: false

  multiversion-docs:
    name: Multi-version docs 📖
    if: "(github.event_name == 'push' && github.ref == 'refs/heads/main') || startsWith(github.ref, 'refs/tags/v') && (!contains(github.event.head_commit.message, 'avert') && !contains(github.event.head_commit.message, 'docs'))"
    runs-on: ubuntu-latest
    container:
      image: ghcr.io/insightsengineering/rstudio_4.1.2_bioc_3.14:latest
    needs: pkgdown
    steps:
      - name: Checkout GH pages branch 🛎
        uses: actions/checkout@v2
        with:
          ref: gh-pages

      - name: Build multi-version docs 📤
        uses: insightsengineering/r-pkgdown-multiversion@v1
        env:
          GITHUB_PAT: ${{ secrets.REPO_GITHUB_TOKEN }}

      - name: Setup github user 👤
        run: |
          git config --local user.email "actions@github.com"
          git config --local user.name "GitHub Actions"

      - name: Push changes, if any 📥
        uses: EndBug/add-and-commit@v7
        with:
          branch: gh-pages
```


***

## Appendix: Links

- [[Code]]
- [[Development]]

*Backlinks:*

```dataview
list from [[GitHub Action - pkgdown]] AND -"Changelog"
```