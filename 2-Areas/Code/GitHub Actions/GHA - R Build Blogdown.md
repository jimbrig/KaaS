# GHA - R Build Blogdown

*Source: https://github.com/r-lib/actions/tree/master/examples#build-blogdown-site*

`usethis::use_github_action("blogdown")`

This example builds a [blogdown](https://bookdown.org/yihui/blogdown/) site for a repository and then deploys the book via [netlify](https://www.netlify.com/). It uses [renv](https://rstudio.github.io/renv/) to ensure the package versions remain consistent across builds. You will need to run `renv::snapshot()` locally and commit the `renv.lock` file before using this workflow, see [Using renv with Continous Integration](https://rstudio.github.io/renv/articles/ci.html) for additional information. **Note** you need to add a `NETLIFY_AUTH_TOKEN` a `NETLIFY_SITE_ID` secret to your repository for the netlify deploy (see [Managing secrets](https://github.com/r-lib/actions/tree/master/examples#managing-secrets) section for details).

````yaml
# Workflow derived from https://github.com/r-lib/actions/tree/master/examples
# Need help debugging build failures? Start at https://github.com/r-lib/actions#where-to-find-help
on:
  push:
    branches: [main, master]

name: blogdown

jobs:
  blogdown:
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

      - name: Install hugo
        run: |
          R -e 'blogdown::install_hugo()'

      - name: Build site
        run: |
          R -e 'blogdown::build_site(TRUE)'

      - name: Deploy to GitHub pages 🚀
        uses: JamesIves/github-pages-deploy-action@4.1.4
        with:
          branch: gh-pages
          folder: public
````

---

## Appendix: Links

* [Code](../Code.md)
* [Development](../../MOCs/Development.md)

*Backlinks:*

````dataview
list from [[GHA - R Build Blogdown]] AND -"Changelog"
````
