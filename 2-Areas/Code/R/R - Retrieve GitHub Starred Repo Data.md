---
Date: 2022-02-28
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Code/R", "#Topic/Dev/R"]
Alias: ["R - Retrieve GitHub Starred Repo Data"]
---

# R - Retrieve GitHub Starred Repo Data

*Source: [[Github Stars] Pull Github Starred Repositories using Github API and gh R Packages](https://gist.github.com/jimbrig/75fd952bad479737dc7b32b6ec203652#file-get_github_stars-r)*

## Description ℹ️

Pull Github Starred Repositories using Github API and the [[R Package - gh|gh]] R Package.

Caches data utilizing the [[R Package - qs|qs]] (quick-serialization) R package for optimal storage. 

## Snippet ✂️

```R
# https://developer.github.com/v3/activity/starring/
mystars <- gh::gh("/users/:username/starred", username = "jimbrig", .limit = Inf)

repo_names <- purrr::map_depth(mystars, 1, purrr::pluck, "full_name") %>% purrr::flatten_chr()
repo_urls <- purrr::map_depth(mystars, 1, purrr::pluck, "url") %>% purrr::flatten_chr()
creation_dates <- purrr::map_depth(mystars, 1, purrr::pluck, "created_at") %>% purrr::flatten_chr() %>% stringr::str_sub(1, 10) %>% lubridate::ymd()
last_updated_dates <- purrr::map_depth(mystars, 1, purrr::pluck, "updated_at") %>% purrr::flatten() %>% stringr::str_sub(1, 10) %>% lubridate::ymd()
stargazers_count <- purrr::map_depth(mystars, 1, purrr::pluck, "stargazers_count") %>% purrr::flatten_int()
languages <- purrr::map_depth(mystars, 1, purrr::pluck, "language") %>% purrr::map(function(x) if (is.null(x)) return("Missing") else x) %>% purrr::flatten_chr() %>% tolower()

descriptions <- purrr::map_depth(mystars, 1, purrr::pluck, "description") %>% purrr::map(function(x) if (is.null(x)) return("Missing") else x) %>% purrr::flatten_chr() %>% tolower()

out <- tibble::tibble(
  repo = repo_names,
  url = repo_urls,
  description = descriptions,
  last_updated = last_updated_dates,
  created = creation_dates,
  stargazers = stargazers_count,
  language = languages
) %>%
  dplyr::mutate(dplyr::across(c("language", "description"), dplyr::na_if, "missing")) %>%
  dplyr::arrange(
    language,
    dplyr::desc(last_updated),
    dplyr::desc(stargazers)
  )

fs::dir_create("data")

qs::qsave(out, paste0("data/", Sys.Date(), "-jimbrig-github-starred-repos.qs"))

```


***

## Appendix: Links

- [[Code]]
- [[2-Areas/MOCs/R]]
- [[Development]]

*Backlinks:*

```dataview
list from [[R - Retrieve GitHub Starred Repo Data]] AND -"Changelog"
```