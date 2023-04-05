# Using Redo to Manage R Data Analysis Workflow

## Metadata

* Author: *karolis.koncevicius.lt*
* Full Title: Using Redo to Manage R Data Analysis Workflow
* Category: #Type/Highlight/Article
* URL: http://karolis.koncevicius.lt/posts/using_redo_to_manage_r_data_analysis_workflow/

## Highlights

* Real world data analysis projects are often complicated. They can involve multi-gigabyte input files, complex data cleaning procedures, week-long computations, and elaborate reports. Making changes and then tracking down the parts that need to be recomputed becomes close to impossible. In this article I describe my approach for dealing with this problem, which is based on a lesser known build automation tool - redo ([View Highlight](https://instapaper.com/read/1353717734/14361631))
  * Note: “Rebuilding target files when source files have changed” on D. J. Bernstein's homepage
* Redo ([View Highlight](https://instapaper.com/read/1353717734/14361632))
* Data science projects typically have complex pipelines involving input files, code, results, and reports. Analyses can be computationally intensive and take hours if not days or weeks to complete. Hence, data science practitioners need to be able to make changes without restarting the whole pipeline from scratch. Workflow management becomes essential and many projects turn to build automation tools like Make ([View Highlight](https://instapaper.com/read/1353717734/14361633))
* Redo is a recursive build automation system that promises to be simpler and more powerful than Make. Unlike Make or its derivatives redo is tiny, recursive, and has no special syntax of its own. It allows declaring dependencies straight from within the code being executed, which enables writing scripts that “know” they will need to rerun themselves whenever their input data changes all without maintaining a separate dependency configuration file. ([View Highlight](https://instapaper.com/read/1353717734/14361635))
* Standard redo workflow has several '.do' files that hold the instructions for producing every output file saved during the analysis. Computation of each target is requested with a 'redo' command which is called straight from the command line. ([View Highlight](https://instapaper.com/read/1353717734/14361637))
* Some explanation is necessary. The redo command simply takes an argument and tries to produce a file of the same name. In this case the argument was 'rawdata.rds' and, given the command, redo starts looking for instructions about how to produce it. The rule for storing instructions is quite simple - they are stored in a separate file with a name constructed by adding a '.do' suffix to the original argument. In other words - redo looks for instructions about producing 'rawdata.rds' file in a file named 'rawdata.rds.do'. ([View Highlight](https://instapaper.com/read/1353717734/14361644))
