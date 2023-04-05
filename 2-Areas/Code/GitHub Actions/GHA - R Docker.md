# GHA - R Docker

*Source: https://github.com/r-lib/actions/tree/master/examples#docker-based-workflow*

`usethis::use_github_action("docker")`

If you develop locally with docker or are used to using other docker based CI services and already have a docker container with all of your R and system dependencies you can use that in GitHub Actions by adapting the following workflow. This example workflow assumes you build some model in `fit_model.R` and then have a report in `report.Rmd`. It then uploads the rendered html from the report as a build artifact.

````yaml
# Workflow derived from https://github.com/r-lib/actions/tree/master/examples
# Need help debugging build failures? Start at https://github.com/r-lib/actions#where-to-find-help
on: [push]

name: docker

jobs:
  docker:
    runs-on: ubuntu-latest
    container: rocker/verse
    steps:
      - uses: actions/checkout@v1

      - run: Rscript fit_model.R

      - run: Rscript -e 'rmarkdown::render("report.Rmd")'

      - name: Upload results
        uses: actions/upload-artifact@main
        with:
          name: results
          path: report.html
````

---

## Appendix: Links

* [Code](../Code.md)
* [Development](../../MOCs/Development.md)

*Backlinks:*

````dataview
list from [[GHA - R Docker Deploy]] AND -"Changelog"
````
