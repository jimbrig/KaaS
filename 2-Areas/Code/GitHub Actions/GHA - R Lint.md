# GHA - Link Workflow

*Source: https://github.com/r-lib/actions/tree/master/examples#lint-workflow*

`usethis::use_github_action("lint")`

This example uses the [lintr](https://github.com/jimhester/lintr) package to lint your package and return the results as build annotations.

````yaml
# Workflow derived from https://github.com/r-lib/actions/tree/master/examples
# Need help debugging build failures? Start at https://github.com/r-lib/actions#where-to-find-help
on:
  push:
    branches: [main, master]
  pull_request:
    branches: [main, master]

name: lint

jobs:
  lint:
    runs-on: ubuntu-latest
    env:
      GITHUB_PAT: ${{ secrets.GITHUB_TOKEN }}
    steps:
      - uses: actions/checkout@v2

      - uses: r-lib/actions/setup-r@v1
        with:
          use-public-rspm: true

      - uses: r-lib/actions/setup-r-dependencies@v1
        with:
          extra-packages: lintr

      - name: Lint
        run: lintr::lint_package()
        shell: Rscript {0}
````

---

## Appendix: Links

* [Code](../Code.md)
* [Development](../../MOCs/Development.md)

*Backlinks:*

````dataview
list from [[GHA - Link Workflow]] AND -"Changelog"
````
