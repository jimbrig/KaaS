# R - Package Management Scripts

*Source: https://gist.github.com/e3ad09a4f581db5fa2702ba9823eb635#file-install-r*

````R
library(pak)
library(pkgdepends)
library(purrr)
library(dplyr)

pkgs <- pkgdepends::lib_status()
pkgs_cran <- pkgs %>% filter(repository == "CRAN", !is.na(package)) %>% pull(package)
pkgs_gh <- pkgs %>% filter(remotetype == "github", !is.na(remotepkgref)) %>% pull(remotepkgref)


purrr::walk(pkgs_cran, pak::pak, ask = FALSE, upgrade = TRUE)
purrr::walk(pkgs_gh, pak::pak, ask = FALSE, upgrade = TRUE)
````

*Source: https://gist.github.com/b9e06f700992245426bdbfe4f3c1d0c2#file-packages-r*

````R
library(pak)
library(pkgdepends)
library(purrr)
library(dplyr)
library(yaml)

libs <- .libPaths()
user_lib <- libs[1]

user_pkgs <- fs::dir_ls(user_lib, type = "directory") %>% basename() %>% setdiff("_cache")

pkgs <- pkgdepends::lib_status(user_lib, packages = user_pkgs)
pkgs_cran <- pkgs %>% filter(repository == "CRAN", !is.na(package)) %>% pull(package)
pkgs_gh <- pkgs %>% filter(remotetype == "github", !is.na(remotepkgref)) %>% pull(remotepkgref)

pkg_config_file <- fs::path(dirname(user_lib), "packages.yml")

if (file.exists(pkg_config_file)) {
  pkgs_old <- yaml::read_yaml(pkg_config_file)
  pkgs_old_cran <- pkgs_old$cran %>% setdiff(pkgs_cran)
  pkgs_old_gh <- pkgs_old$gh %>% setdiff(pkgs_gh)
  pkgs_cran <- c(pkgs_cran, pkgs_old_cran)
  pkgs_gh <- c(pkgs_gh, pkgs_old_gh)
}

purrr::walk(pkgs_cran, pak::pak, ask = FALSE, upgrade = TRUE)
purrr::walk(pkgs_gh, pak::pak, ask = FALSE, upgrade = TRUE)

yaml::write_yaml(list(cran = pkgs_cran, gh = pkgs_gh), pkg_config_file)

# upload to github
gh_gist <- gistr::gist("b9e06f700992245426bdbfe4f3c1d0c2")
gh_gist %>% gistr::update_files(pkg_config_file, file.path(dirname(pkg_config_file), "packages.R")) %>% gistr::update()

# gistr::gist_create(files = c(pkg_config_file, file.path(dirname(pkg_config_file), "packages.R")),
#                    description = "Windows R Package Library Files.",
#                    public = TRUE,
#                    browse = TRUE)
````

Output:

*Source: https://gist.github.com/b9e06f700992245426bdbfe4f3c1d0c2#file-packages-yml*

````yaml
cran:
- argparse
- argparser
- askpass
- assertthat
- attachment
- attempt
- automagic
- AzureAuth
- AzureGraph
- backports
- base64enc
- BH
- billboarder
- BiocManager
- bit
- bit64
- blob
- blogdown
- bookdown
- brew
- brio
- broom
- bslib
- cachem
- callr
- cellranger
- chameleon
- checkmate
- cli
- clipr
- clisymbols
- clue
- collections
- colorspace
- commonmark
- config
- covr
- cpp11
- crayon
- credentials
- crosstalk
- crul
- curl
- cyclocomp
- data.table
- DBI
- dbplyr
- dbx
- debugme
- desc
- devtools
- DiagrammeR
- diffobj
- digest
- distill
- dockerfiler
- docopt
- downlit
- downloader
- dplyr
- DT
- dtplyr
- ellipsis
- evaluate
- fansi
- farver
- fastmap
- filelock
- findpython
- fontawesome
- forcats
- formatR
- formattable
- fs
- futile.logger
- futile.options
- future
- gargle
- generics
- gert
- getopt
- ggplot2
- gh
- git2r
- gitcreds
- globals
- glue
- golem
- goodpractice
- googledrive
- googlesheets4
- gridExtra
- gtable
- haven
- here
- highcharter
- highr
- hms
- htmltools
- htmlwidgets
- httpcode
- httpuv
- httr
- hunspell
- ids
- igraph
- influenceR
- ini
- isoband
- janeaustenr
- janitor
- jose
- jquerylib
- jsonlite
- kableExtra
- knitr
- labeling
- lambda.r
- languageserver
- later
- lazyeval
- lifecycle
- lintr
- listenv
- listviewer
- lobstr
- lpSolve
- lubridate
- magrittr
- markdown
- matchmaker
- Matrix
- memoise
- mgcv
- mime
- miniUI
- modelr
- munsell
- openssl
- openxlsx
- optparse
- packrat
- pacman
- parallelly
- parsedate
- pbapply
- pillar
- pkgbuild
- pkgcache
- pkgconfig
- pkgdepends
- pkgdown
- pkgload
- plogr
- png
- polished
- praise
- prettyunits
- processx
- progress
- promises
- prompt
- pryr
- ps
- purrr
- qs
- quantmod
- R.cache
- R.methodsS3
- R.oo
- R.utils
- R6
- ragg
- RApiSerialize
- rappdirs
- rcmdcheck
- RColorBrewer
- Rcpp
- RcppEigen
- RcppParallel
- reactR
- readr
- readxl
- rematch
- rematch2
- remotes
- renv
- repr
- reprex
- reticulate
- rex
- rhandsontable
- rhub
- rintrojs
- rjson
- rlang
- rlist
- rmarkdown
- roxygen2
- RPostgres
- rprojroot
- rsconnect
- RSpectra
- RSQLite
- rstudioapi
- rversions
- rvest
- sass
- scales
- scrypt
- selectr
- semver
- servr
- sessioninfo
- shiny
- shiny.reglog
- shinycssloaders
- shinycustomloader
- shinydashboard
- shinyFeedback
- shinyFiles
- shinyjs
- shinymanager
- shinyToastify
- shinyvalidate
- shinyWidgets
- snakecase
- SnowballC
- sourcetools
- spelling
- stevedore
- stringfish
- stringi
- stringr
- styler
- svglite
- sys
- systemfonts
- testthat
- textdata
- textshaping
- tibble
- tidyr
- tidyselect
- tidytext
- tidyverse
- tinytex
- tokenizers
- triebeard
- TTR
- tzdb
- umap
- urltools
- usethis
- utf8
- uuid
- vctrs
- versions
- viridis
- viridisLite
- visNetwork
- vroom
- waldo
- webshot
- whisker
- whoami
- withr
- writexl
- xfun
- XML
- xml2
- xmlparsedata
- xopen
- xtable
- xts
- yaml
- zip
- zoo
gh:
- ropensci/gistr
- mkearney/googler
- Azure/Microsoft365R
- HenrikBengtsson/rcli
- stla/shinyChakraUI
- gadenbuie/shrtcts
````

---

## Appendix: Links

* [Code](../Code.md)
* [2-Areas/MOCs/R](../../MOCs/R.md)
* [Development](../../MOCs/Development.md)

*Backlinks:*

````dataview
list from [[R - Package Management Scripts]] AND -"Changelog"
````
