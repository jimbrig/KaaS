# A Better Way to Manage Your Github Personal Access Tokens

## Metadata

* Author: 
* Full Title: A Better Way to Manage Your Github Personal Access Tokens
* Category: #Type/Highlight/Article
* URL: https://ropensci.org/technotes/2020/07/07/github-pat/?utm_campaign=Feed%3A+rweekly-live+%28R+Weekly+Live%29&utm_medium=feed&utm_source=feedburner

## Highlights

* The credentials package provides a function that will set this environment variable:# Tries to set the GITHUB_PAT environment variable
  
  credentials::set_github_pat()## TRUE

* The set_github_pat() function returns TRUE when it succeeds in setting the GITHUB_PAT environment variable, and FALSE if not. Packages that call set_github_pat() to let the user authenticate, can check the return value to determine if authentication was successful.
* Once a working PAT has been stored in the git credential store, it can automatically be loaded in another R session by calling set_github_pat() again. The token is automatically validated, and if it still works, the GITHUB_PAT environment variable is set without the user having to do anything.
  And here is the best part: because the token is stored under the github.com domain in the credential store, both gert and command line git will automatically attempt to authenticate with this token when fetching/pushing Github HTTPS remotes.
* Workflow
  We still need to figure out how this will affect the recommended workflow. Currently many users hardcode the GITHUB_PAT in the ~/.Renviron file, so that it is automatically set in every R session. You could accomplish the same with the credentials package by adding this to your ~/.Rprofile file:# Load the GITHUB_PAT in the R session
  
  credentials::set_github_pat()
  However perhaps it is actually undesired to always have your GITHUB_PAT exposed in R. The nice thing about the credentials package is that it becomes easy to load your access token on demand. Hence, instead of setting the PAT on the start of each R session, a user or 3rd party package could call set_github_pat() whenever it needs access to the Github API.
