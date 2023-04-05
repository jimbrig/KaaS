# Bioconductor - Package Guidelines

## Metadata

* Author: 
* Full Title: Bioconductor - Package Guidelines
* Category: #Type/Highlight/Article
* URL: https://bioconductor.org/developers/package-guidelines/

## Highlights

* promotes high-quality, well documented, and interoperable software
  * Note: interoperable ==> vocab list
* Do not use filenames that differ only in case, as not all file systems are case sensitive
* package should require less than 10 minutes to run R CMD check --no-build-vignettes. Using the --no-build-vignettes option ensures that the vignette is built only once.
* The raw package directory should not contain unnecessary files, system files, or hidden files such as .DS_Store, .project, .git, cache file, log files, .Rproj, .so, etc.. These files may be present in your local directory but should not be commited to git (see ).
* set through environment variable R_CHECK_ENVIRON with a command similar to
  export R_CHECK_ENVIRON = <path to downloaded file>

  * Tags: [2-Areas/MOCs/R](../../../../2-Areas/MOCs/R.md) *favorite* 
* use an x.y.z version scheme
* x is usually 0 for packages that have not yet been released
* y is even for packages in release, and odd for packages in devel.
* z is incremented whenever committing changes to a package
* “Authors@R or Author/Maintainer:” fields: Use either Authors@R field or Author: and Maintainer: fields, not both. A maintainer designation (cre for Authors@R ) is required with an actively maintained email.
* “LazyData:” field: For packages that include data, we recommend not including LazyData: TRUE. This rarely proves to be a good thing. In our experience it only slows down the loading of packages with large data.
  * Tags: *favorite* 
  * Note: interesting - wonder why tidyverse does this then?
* Imports: is for packages that provide functions, methods, or classes that are used inside your package name space. Most packages are listed here.
* Depends: is for packages that provide essential functionality for users of your package
* Suggests: is for packages used in vignettes, examples, and in conditional code.
* external package availability can be checked via if (!requireNamespace('extraPKG')) stop(...).
* Enhances: is for packages such as Rmpi or parallel that enhance the performance of your package, but are not strictly needed for its functionality.
* “SystemRequirements:” field: This field is for listing any external software which is required, but not automatically installed by the normal package installation process. If the installation process is non-trivial, a top-level README file should be included to document the process.
* “biocViews:” field: REQUIRED! Specify at least two biocViews categories. Multiple terms are encouraged but terms must come from the same package type (Software, AnnotationData, ExperimentData, Workflow).
  * Note: is there a cranviews?
* “Video:” field: This field displays links to instructional videos.
  * Note: Cool
* “Collates:” field: This may be necessary to order class and method definitions appropriately during package installation.
  * Tags: *favorite* 
* Exported functions should use camel case or underscoring and not include “.” indicate S3 dispatch.
* Generally importFrom() is encouraged over importing an entire package, however if there are many functions from a single package, import() is okay.
* Exporting all functions with exportPattern("^*:alpha:*+") is strongly discouraged.
* A NEWS file should be included to keep track of changes to the code from one version to the next. It can be a top level file or in the inst/ directory. Only one NEWS file should exist. The following are acceptable formats and locations:
  1. ./inst/NEWS.Rd latex 2. ./inst/NEWS formatted text see ?news 3. ./inst/NEWS.md mardown 4. ./NEWS.md markdown 5. ./NEWS formatted text see ?news
* It must include list elements and cannot be a plain text file. An example format:
  Changes in version 0.99.0 (2018-05-15)
  * Submitted to Bioconductor
    Changes in version 1.1.1 (2018-06-15)
  * Fixed bug. Begin indexing from 1 instead of 2
  * Made the following significant changes
    o added a subsetting method
    o added a new field to database
    After you install your package, the following can be run to see if the NEWS is properly formatted:
    utils::news(package="<name of your package>")
* Appropriate citations must be included in help pages (e.g., in the see also section) and vignettes; this aspect of documentation is no different from any scientific endeavor. The file inst/CITATION can be used to specify how a package is to be cited. If this option is utilized, a maintainer can check proper formatting of the CITATION file by running readCitationFile("inst/CITATION"); This must run without ERROR for the CITATION to be accurately displayed on the package landing pages.
* If existing data is not available or applicable, or a new smaller dataset is needed for examples in the package, data can be included either as a separate data package (for larger amounts of data) or within the package (for smaller datasets).
* Experimental data packages contain data specific to a particular analysis or experiment. They often accompany a software package for use in the examples and vignettes and in general are not updated regularly.
* Adding Data to Existing Package
  Bioconductor strongly encourages the use of existing datasets but if not available data can be included directly in the package for use in the examples found in man pages, vignettes, and tests of your package. This is a good reference by Hadley Wickham concerning data. As mentioned Bioconductor, however does not encourage using LazyData: True despite its recommendataion in this article. Some key points are summarized below.
* Exported Data and the data/ Directory
  Data in data/ is exported to the user and readily available. It is made available in an R session through the use of data(). It will require documentation concerning its creatation and source information. It is most often a .RData file created with save() but other types are acceptible as well, see ?data(). Please remember to compress the data.
  * Tags: *favorite* 
* Raw Data and the inst/extdata/ Directory
  It is often desirable to show a workflow which involves parsing or loading of raw files. Bioconductor recommends finding existing raw data already provided in another package or the hubs, however if this is not applicable, raw data files should be included in the inst/extdata. Files of these type are often accessed utilizing system.file(). Bioconductor requires documentation on these files in an inst/script/ directory.
* Internal Data
  Rarely, a package may require parsed data that is used internal but should not be exported to the user. An R/sysdata.rda is often the best place to include this type of data.
* requires a vignette with executable code that demonstrates how to use the package to accomplish a task, man pages for all exported functions with runnable examples, well documented data structures especially if not a pre-exiting class, and well documented datasets for data in data and in inst/extdata. References to the methods used as well as to other simlar or related project/packages is also expected. If data structures differ from similar packages, Bioconductor reviewers will expect some justification as to why. Keep in mind it is always possible to extend existing classes.
* A vignette demonstrates how to accomplish non-trivial tasks embodying the core functionality of your package. There are two common types of vignettes. A Sweave vignette is an .Rnw file that contains LaTeX and chunks of R code. The R code chunk starts with a line «»=, and ends with @. Each chunk is evaluated during R CMD build, prior to LaTeX compilation to a PDF document. An R markdown vignette is similar to a Sweave vignette, but uses markdown instead of LaTeX for structuring text sections and resulting in HTML output. The knitr package can process most Sweave and all R markdown vignettes, producing pleasing output. Refer to Writing package vignettes for technical details. See the BiocStyle package for a convenient way to use common macros and a standard style.
* A vignette provides reproducibility: the vignette produces the same results as copying the corresponding commands into an R session. It is therefore essential that the vignette embed executed R code. short-cuts (e.g., using a LaTeX verbatim environment, or using the Sweave eval=FALSE flag, or equivalent tricks in markdown) undermine the benefit of vignettes and are generally not allowed; exceptions can be made with proper justification and are at the Bioconductor Reviewers discretion.
  All packages are required to have at least one vignette. Vignettes go in the vignettes directory of the package. Vignettes are often used as stand-alone documents, so best practices are to include an informative title, the primary author of the vignette, the last modified date of the vignette, and a link to the package landing page. We encourage the use of BiocSytle for formatting
* Add an “Introduction” section that serves as an abstract to introduce the objective, models, unique functions, key points, etc that distinguish the package from other packages of similar type.
* Add an “Installation” section that show to users how to download and load the package from Bioconductor.
* If appropriate, we strongly encourage a table of contents
* Non-trival executable code is a must!!! Static vignettes are not acceptable.
* Include a section with the SessionInfo()
* Only the vignette file (.Rnw or .Rmd) and any necessary static images should be in the vignette directory. No intermediate files should be present.
* Remember to include any relavent references to methods.
* encourages having a package man page with an overview of the package and links to the main functions.
* Data man pages must include source information and data structure information. Man pages describing new classes must be very detailed on the structure and what type of information is stored. All man pages should have an runnable examples. donttest and dontrun are discouraged and generally not allowed;
* The scripts in this directory can vary. Most importantly if data was included in the inst/extdata/, a related script must be present in this directory documenting very clearly how the data was generated. It should include source urls and any important information regarding filtering or processing. It can be executible code, sudo code, or a text description. A user should be able to download and be able to roughly reproduce the file or object that is present as data.
* Unit tests are highly recommended. We find them indispensable for both package development and maintenance. Two of the main frameworks for testing are RUnit and testthat. Examples and explanations are provided here. There is also the opportunity to create a full testing suite more in depth than traditional testing guidelines but this will require the use of long tests. If a package developer is considering the use of long tests we highly recommend reaching out on the bioc-devel mailing list to ensure proper use and justification.
* Only contain code that can be distributed under the license specified.
* Use vapply() instead of sapply() and use the various apply functions instead of for loops.
  Use seq_len() or seq_along() instead of 1:...
  Use TRUE/FALSE instead of T/F
  Avoid class()== and class()!= instead use is()
  Use system2() instead of system
  Do not use set.seed in any internal R code.
  No browser() calls should be in code
  Avoid the use of \<\<-.
  Avoid use of direct slot access with @ or slot(). Accessor methods should be created and utilized
* Use \<- instead of = for assignment
  Function names should be camel case or utilize the underscore _ and not have a dot . which indicates S3 dispatch.
  Use dev.new() to start a graphics drive if necessary. Avoid using x11() or X11() for it can only be called on machines that have access to an X server.
* Avoid large chunks of repeated code. If code is being repeated this is generally a good indication a helper function could be implemented.
* Excessively long functions should also be avoided. Write small functions. It’s best if each function has only one job that needs to do. And it’s also best if it does that job in as few lines of code as possible. If you find yourself writing great big functions that wrap on for more than a screen then you should probably take a moment to split it up into smaller helper functions. Smaller functions are easier to read, debug and to reuse.
* Argument names to functions should be descriptive and well documented. Arguments should generally have default values. Check arguments against a validity check.
  * Tags: *pkgdevt* [2-Areas/MOCs/R](../../../../2-Areas/MOCs/R.md) *favorite* 
* Vectorize! Many R operations are performed on the whole object, not just the elements of the object (e.g., sum(x), not x\[1\] + x\[2\] + x\[2\] + ...). In particular, relatively few situations require an explicit for loop. See the Vectorize section of Robust and Efficient Code for additional detail.
* The following are files that are checked by Bioconductor and flagged as unacceptable:
  hidden_file_ext = (
  ".renviron", ".rprofile", ".rproj", ".rproj.user", ".rhistory",
  ".rapp.history", ".o", ".sl", ".so", ".dylib", ".a", ".dll",
  ".def", ".ds_store", "unsrturl.bst", ".log", ".aux", ".backups",
  ".cproject", ".directory", ".dropbox", ".exrc", ".gdb.history",
  ".gitattributes", ".gitmodules", ".hgtags", ".project", ".seed",
  ".settings", ".tm_properties"
  )
