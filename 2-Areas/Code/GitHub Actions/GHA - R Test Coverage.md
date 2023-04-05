# GitHub Action - Test Coverage Workflow

*Source: https://github.com/r-lib/actions/tree/master/examples#test-coverage-workflow*

`usethis::use_github_action("test-coverage")`

This example uses the [covr](https://covr.r-lib.org) package to query the test coverage of your package and upload the result to [codecov.io](https://codecov.io)

````yaml
# Workflow derived from https://github.com/r-lib/actions/tree/master/examples
# Need help debugging build failures? Start at https://github.com/r-lib/actions#where-to-find-help
on:
  push:
    branches: [main, master]
  pull_request:
    branches: [main, master]

name: test-coverage

jobs:
  test-coverage:
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
          extra-packages: covr

      - name: Test coverage
        run: covr::codecov()
        shell: Rscript {0}
````

---

## Appendix: Links

* [Code](../Code.md)
* [Development](../../MOCs/Development.md)

*Backlinks:*

````dataview
list from [[GitHub Action - Test Coverage Workflow]] AND -"Changelog"
````
