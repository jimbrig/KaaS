---
Date: 2022-07-25
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Source: Matter
Link: https://blog.r-hub.io/2019/12/12/internal-functions/
Tags: ["#Type/Highlight/Article"]
Aliases: ["Internal functions in R packages", "Internal functions in R packages"]
---
# Internal functions in R packages

## Metadata
- Author: [[Maëlle Salmon]]
- Full Title: Internal functions in R packages
- Category: #Type/Highlight/Article
- URL: https://blog.r-hub.io/2019/12/12/internal-functions/

## Highlights
- Why not export all functions? There are at least these two reasons: * In a package you want to provide your user an API that is useful and stable. You can vouch for a few functions, that serve the package main goals, are documented enough, and that you’d only change with great care if need be. If your package users rely on an internal function that you decide to ditch when re-factoring code, they won’t be happy, so only export what you want to maintain. * If all packages exposed all their internal functions, the user environment would be flooded and the namespace conflicts would be out of control.
