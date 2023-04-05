# State of R Packages in Your Library - R-Hub Blog

## Metadata

* Author: *blog.r-hub.io*
* Full Title: State of R Packages in Your Library - R-Hub Blog
* Category: #Type/Highlight/Article
* URL: https://blog.r-hub.io/2020/09/03/keep.source/

## Highlights

* Where do installed packages live?
  Packages are installed
  at the path you give as lib argument to install.packages() (or to any remotes::install\_ function, that will pass them on to install.packages());
  most often since you won’t give any, at the first path returned by .libPaths() that exists and for which the user has the right permissions.
* Now at library loading, the important argument is called lib.loc, not lib.
* As an user installing packages, you need to look into the keep.source.pkgs option in options() that influences the behavior of package installation, or for a specific package you’d write install.packages("rhub", INSTALL_opts = "--with-keep.source", type = "source"). If you use Windows or Mac and don’t write type = "source", binaries might be use in which case the keep.source.pkgs option is ignored.
  As a developer working interactively on a package (with e.g. devtools::load_all()), you need to make sure the source is kept as is when loading the package, and when loading it (lucky you, the relevant keep.source option is TRUE by default in interactive sessions 🎉).
* As a developer you might also encounter the case where R CMD check will tell you about another switch, in an environment variable. It is a switch related to package installation, since R CMD check will install your package for checking it . See the lines below from the R source mirror:
