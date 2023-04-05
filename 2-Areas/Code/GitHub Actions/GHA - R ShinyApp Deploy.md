# GHA - R ShinyApp Deploy

*Source: https://github.com/r-lib/actions/tree/master/examples#shiny-app-deployment*

`usethis::use_github_action("shiny-deploy")`

This example will deploy your Shiny application to either [shinyapps.io](https://www.shinyapps.io/) or [RStudio Connect](https://www.rstudio.com/products/connect/) using the `rsconnect` package. The `rsconnect` package requires authorization to deploy an app using your account. This action does this by using your user name (`RSCONNECT_USER`), token (`RSCONNECT_TOKEN`), and secret (`RSCONNECT_SECRET`), which are securely accessed as GitHub Secrets. **Your token and secret are private and should be kept confidential**.

This action assumes you have an `renv` lockfile in your repository that describes the `R` packages and versions required for your Shiny application.

* See here for information on how to obtain the token and secret for configuring `rsconnect`: [https://shiny.rstudio.com/articles/shinyapps.html](https://shiny.rstudio.com/articles/shinyapps.html)

* See here for information on how to store private tokens in a repository as GitHub Secrets: [https://docs.github.com/en/actions/reference/encrypted-secrets#creating-encrypted-secrets-for-a-repository](https://docs.github.com/en/actions/reference/encrypted-secrets#creating-encrypted-secrets-for-a-repository)

````yaml
# Workflow derived from https://github.com/r-lib/actions/tree/master/examples
# Need help debugging build failures? Start at https://github.com/r-lib/actions#where-to-find-help
on:
  push:
    branches: [main, master]

name: shiny-deploy

jobs:
  shiny-deploy:
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

      - name: Install rsconnect
        run: install.packages("rsconnect")
        shell: Rscript {0}

      - name: Authorize and deploy app
        run: |
          rsconnect::setAccountInfo(${{ secrets.RSCONNECT_USER }}, ${{ secrets.RSCONNECT_TOKEN }}, ${{ secrets.RSCONNECT_SECRET }})
          rsconnect::deployApp()
        shell: Rscript {0}
````

---

## Appendix: Links

* [Code](../Code.md)
* [Development](../../MOCs/Development.md)

*Backlinks:*

````dataview
list from [[GHA - R ShinyApp Deploy]] AND -"Changelog"
````
