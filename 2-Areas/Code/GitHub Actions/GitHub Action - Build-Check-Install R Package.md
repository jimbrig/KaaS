---
Date: 2022-02-11
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Code/GHA", "#Type/Code/R", "#Topic/Dev/R"]
Alias: ["GitHub Action - Build-Check-Install R Package"]
---

# GitHub Action - Build-Check-Install R Package

*Source: [r.pkg.template/build-check-install.yaml at main · insightsengineering/r.pkg.template (github.com)](https://github.com/insightsengineering/r.pkg.template/blob/main/.github/workflows/build-check-install.yaml)*

```yaml
name: R CMD Check 🧬

on:
  push:
    tags:
      - "v*"
    branches:
      - main
      - pre-release
  pull_request:
    branches:
      - main
      - pre-release
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
      enable-staged-dependencies-check:
        description: Enable staged dependencies YAML check
        required: false
        default: true
        type: boolean
      R_CHECK_FORCE_SUGGESTS:
        description: If true, give an error if suggested packages are not available
        required: false
        default: true
        type: boolean

jobs:
  build-install-check:
    strategy:
      fail-fast: false
      matrix:
        config:
          - image: ghcr.io/insightsengineering/rstudio_4.1.2_bioc_3.14
            tag: latest
    name: ${{ matrix.config.image }}, version ${{ matrix.config.tag }}
    runs-on: ubuntu-latest
    if: "! contains(github.event.commits[0].message, '[skip r-cmd]')"
    container:
      image: ${{ matrix.config.image }}:${{ matrix.config.tag }}

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

      - name: Show session info and installed packages ℹ
        run: |
          sessionInfo()
          as.data.frame(installed.packages()[, c("LibPath", "Version")])
        shell: Rscript {0}

      - name: Build R package 🏗
        run: |
          R CMD build ${{ github.event.repository.name }}
          echo "PKGBUILD=$(echo *.tar.gz)" >> $GITHUB_ENV
        shell: bash

      - name: Set TESTING_DEPTH ⚙
        env:
          COMMIT_NEWEST_MESSAGE: ${{ github.event.head_commit.message }}
          COMMIT_OLDEST_MESSAGE: ${{ github.event.commits[0].message }}
        run: |
          cd ${{ github.event.repository.name }}
          # set TESTING_DEPTH for PR
          if [[ ! -z "${GITHUB_HEAD_REF}" ]]; then
            TESTING_DEPTH=3
            echo "TESTING_DEPTH=3" >> $GITHUB_ENV
            COMMIT_NEWEST_MESSAGE=$(git log --format=%B -n 1 ${{ github.event.after }})
          fi
          if [[ $COMMIT_NEWEST_MESSAGE == *"[skip tests]"* ]]; then
            echo "NO_TESTS=1" >> $GITHUB_ENV
          fi
          # default TESTING_DEPTH
          if [[ -z "${TESTING_DEPTH}" ]]; then
            echo "TESTING_DEPTH=1" >> $GITHUB_ENV
          fi
        shell: bash

      - name: Run R CMD check 🏁
        run: |
          if [[ -z "${{ env.NO_TESTS }}" ]]; then
            R CMD check ${{ env.PKGBUILD }}
          else
            R CMD check --no-tests ${{ env.PKGBUILD }}
          fi
        shell: bash
        continue-on-error: true
        env:
          _R_CHECK_TESTS_NLINES_: 0
          _R_CHECK_VIGNETTES_NLINES_: 0
          _R_CHECK_FORCE_SUGGESTS_: ${{ inputs.R_CHECK_FORCE_SUGGESTS }}

      - name: Check whether JUnit XML report exists 🚦
        id: check-junit-xml
        uses: andstor/file-existence-action@v1
        with:
          files: "${{ github.event.repository.name }}.Rcheck/tests/testthat/junit-result.xml"

      - name: Publish Unit Test Summary 📑
        uses: EnricoMi/publish-unit-test-result-action@v1
        if: steps.check-junit-xml.outputs.files_exists == 'true' && github.event_name == 'pull_request'
        with:
          check_name: Unit Tests Summary
          files: "${{ github.event.repository.name }}.Rcheck/tests/testthat/junit-result.xml"

      - name: Catch warnings in R CMD check output 🗳
        id: catch-errors
        run: |
          cat("Refer to the 'Run R CMD check 🏁' step to troubleshoot failures reported in this step\n")
          cat("--------------------------------------------\n")
          x <- tail(readLines("${{ github.event.repository.name }}.Rcheck/00check.log"), 1)
          if (!grepl("^Status", x)) stop("☠ No status line found in R CMD check log")
          if (grepl("ERROR", x)) stop("❌ R CMD check has errors")
          if (grepl("WARNING", x)) stop("⚠ R CMD check has warnings")
        shell: Rscript {0}

      - name: Upload check results ⤴
        if: failure()
        uses: actions/upload-artifact@v2
        with:
          name: ${{ matrix.config.tag }}-results
          path: ${{ github.event.repository.name }}.Rcheck/00check.log

      - name: Install R package 🚧
        run: R CMD INSTALL ${{ env.PKGBUILD }}
        shell: bash

      - name: Upload package build ⤴
        if: startsWith(github.ref, 'refs/tags/v')
        uses: actions/upload-artifact@v2
        with:
          path: ${{ env.PKGBUILD }}
          name: ${{ env.PKGBUILD }}

  upload-release-assets:
    name: Upload build tar.gz
    needs: build-install-check
    runs-on: ubuntu-latest
    if: "startsWith(github.ref, 'refs/tags/v') && (! contains(github.event.commits[0].message, '[skip r-cmd]'))"
    steps:
      - name: Checkout repo 🛎
        uses: actions/checkout@v2

      - name: Wait for release to succeed ⏳
        timeout-minutes: 2
        uses: lewagon/wait-on-check-action@v1.1.1
        with:
          ref: ${{ github.ref }}
          check-name: "Release 🚀"
          repo-token: ${{ secrets.GITHUB_TOKEN }}
          wait-interval: 10

      - name: Set release version and package build filename 📐
        run: echo "RELEASE_VERSION=${GITHUB_REF#refs/*/v}" >> $GITHUB_ENV

      - name: Get package build filename 📦
        run: echo "PKGBUILD=${{ github.event.repository.name }}_${{ env.RELEASE_VERSION }}.tar.gz" >> $GITHUB_ENV

      - name: Download artifact ⏬
        uses: actions/download-artifact@v2
        with:
          name: ${{ env.PKGBUILD }}

      - name: Upload binaries to release 🔼
        uses: svenstaro/upload-release-action@v2
        with:
          repo_token: ${{ secrets.GITHUB_TOKEN }}
          file: ${{ env.PKGBUILD }}
          asset_name: ${{ env.PKGBUILD }}
          tag: ${{ github.ref }}
          overwrite: false
```


***

## Appendix: Links

- [[Code]]
- [[R]]
- [[Development]]

*Backlinks:*

```dataview
list from [[GitHub Action - Build-Check-Install R Package]] AND -"Changelog"
```