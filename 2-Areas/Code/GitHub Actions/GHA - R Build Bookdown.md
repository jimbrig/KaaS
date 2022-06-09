---
Date: 2022-06-09
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Code/GHA", "#Type/Code/R", "#Topic/Dev/R"]
Alias: ["GHA - R Build Bookdown"]
---

# GHA - R Build Bookdown

*Source: https://github.com/r-lib/actions/tree/master/examples#build-bookdown-site*

`usethis::use_github_action("bookdown")`

This example builds a [bookdown](https://bookdown.org) site for a repository and then deploys the site via [netlify](https://www.netlify.com/). It uses [renv](https://rstudio.github.io/renv/) to ensure the package versions remain consistent across builds. You will need to run `renv::snapshot()` locally and commit the `renv.lock` file before using this workflow, and after every time you add a new package to `DESCRIPTION`. See [Using renv with Continous Integration](https://rstudio.github.io/renv/articles/ci.html) for additional information. **Note** you need to add a `NETLIFY_AUTH_TOKEN` and a `NETLIFY_SITE_ID` secret to your repository for the netlify deploy (see [Managing secrets](https://github.com/r-lib/actions/tree/master/examples#managing-secrets) section for details).

```yaml
# Workflow derived from https://github.com/r-lib/actions/tree/master/examples
# Need help debugging build failures? Start at https://github.com/r-lib/actions#where-to-find-help
on:
  push:
    branches: [main, master]

name: bookdown

jobs:
  bookdown:
    runs-on: ubuntu-latest
    env:
      GITHUB_PAT: ${{ secrets.GITHUB_TOKEN }}
    steps:
      - uses: actions/checkout@v2

      - uses: r-lib/actions/setup-pandoc@v1

      - uses: r-lib/actions/setup-r@v1
        with:
          use-public-rspm: true

      - uses: r-lib/actions/setup-renv@v1

      - name: Cache bookdown results
        uses: actions/cache@v2
        with:
          path: _bookdown_files
          key: bookdown-${{ hashFiles('**/*Rmd') }}
          restore-keys: bookdown-

      - name: Build site
        run: Rscript -e 'bookdown::render_book("index.Rmd", quiet = TRUE)'

      - name: Deploy to GitHub pages 🚀
        uses: JamesIves/github-pages-deploy-action@4.1.4
        with:
          branch: gh-pages
          folder: _book
```

***

## Appendix: Links

- [[Code]]
- [[Development]]

*Backlinks:*

```dataview
list from [[GHA - R Build Bookdown]] AND -"Changelog"
```