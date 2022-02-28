---
Date: 2022-02-28
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Slipbox", "#Topic/Dev"]
Alias: "GitHub Linguist"
---

# GitHub Linguist

*Source: [linguist/how-linguist-works.md at master · github/linguist](https://github.com/github/linguist/blob/master/docs/how-linguist-works.md)*

## Contents

- [[#Linguist Documentation|Linguist Documentation]]
- [[#How GitHub Linguist Works|How GitHub Linguist Works]]
- [[#Overrides|Overrides]]
- [[#Using `.gitattributes`|Using `.gitattributes`]]
	- [[#Summary|Summary]]
	- [[#Detectable|Detectable]]
	- [[#Documentation|Documentation]]
	- [[#Generated code|Generated code]]
	- [[#Vendored code|Vendored code]]
- [[#Using Emacs or Vim modelines|Using Emacs or Vim modelines]]
	- [[#Vim|Vim]]
	- [[#Emacs|Emacs]]
- [[#How Linguist works on GitHub.com|How Linguist works on GitHub.com]]



## Linguist Documentation

-   [How Linguist works](https://github.com/github/linguist/blob/master/docs/how-linguist-works.md)
-   [Change Linguist's behaviour with overrides](https://github.com/github/linguist/blob/master/docs/overrides.md)
-   [Troubleshooting](https://github.com/github/linguist/blob/master/docs/troubleshooting.md)
-   [Contributing guidelines](https://github.com/github/linguist/blob/master/CONTRIBUTING.md)
-   [Releasing Linguist](https://github.com/github/linguist/blob/master/docs/releasing.md) (Only applicable to GitHub staff)

## How GitHub Linguist Works

Linguist takes the list of languages it knows from [`languages.yml`](/lib/linguist/languages.yml) and uses a number of methods to try and determine the language used by each file, and the overall repository breakdown.

Linguist starts by going through all the files in a repository and excludes all files that it determines to be binary data, [vendored code](https://github.com/github/linguist/blob/master/docs/overrides.md#vendored-code), [generated code](https://github.com/github/linguist/blob/master/docs/overrides.md), [documentation](https://github.com/github/linguist/blob/master/docs/overrides.md#documentation), or are defined as `data` (e.g. SQL) or `prose` (e.g. Markdown) languages, whilst taking into account any [overrides](https://github.com/github/linguist/blob/master/docs/overrides.md).

If an [explicit language override](https://github.com/github/linguist/blob/master/docs/overrides.md#using-gitattributes) has been used, that language is used for the matching files.

The language of each remaining file is then determined using the following strategies, in order, with each step either identifying the precise language or reducing the number of likely languages passed down to the next strategy:

- Vim or Emacs modeline,
- commonly used filename,
- shell shebang,
- file extension,
- XML header,
- man page section,
- heuristics,
- naïve Bayesian classification

The result of this analysis is used to produce the language stats bar which displays the languages percentages for the files in the repository.
The percentages are calculated based on the bytes of code for each language as reported by the [List Languages](https://docs.github.com/rest/reference/repos#list-repository-languages) API.

![language stats bar](https://user-images.githubusercontent.com/2346707/91533656-9768b300-e953-11ea-808d-994cd50e6273.png)

## Overrides

Linguist supports a number of different custom override strategies for language definitions and file paths.

## Using `.gitattributes`

Add [a .gitattributes file](https://git-scm.com/docs/gitattributes) to your project and use standard git-style path matchers for the files you want to override using the `linguist-documentation`, `linguist-language`, `linguist-vendored`, `linguist-generated`  and `linguist-detectable` attributes.

`.gitattributes` will be used to determine language statistics and will be used to syntax highlight files.

You can also manually set syntax highlighting using [Vim or Emacs modelines](#using-emacs-or-vim-modelines).

When testing with a local installation of Linguist, **take note that the added attributes will _not_ take effect until the `.gitattributes` file is committed to your repository.**

File and folder paths inside `.gitattributes` are calculated relative to the position of the `.gitattributes` file:

```gitattributes
# Example of a `.gitattributes` file which reclassifies `.rb` files as Java:
*.rb linguist-language=Java

# Replace any whitespace in the language name with hyphens:
*.glyphs linguist-language=OpenStep-Property-List
```

### Summary

<!------------------------------------------------------------------------------------------------------------------------------------------->
 | Git attribute                                  | Defined in            | Effect on file                                                  |
 |:-----------------------------------------------|:----------------------|:----------------------------------------------------------------|
 | `linguist-detectable`                          | [`languages.yml`]     | Included in stats, even if language's type is `data` or `prose` |
 | `linguist-documentation`                       | [`documentation.yml`] | Excluded from stats                                             |
 | `linguist-generated`                           | [`generated.rb`]      | Excluded from stats, hidden in diffs                            |
 | `linguist-language`=<var><ins>name</ins></var> | [`languages.yml`]     | Highlighted and classified as <var><ins>name</ins></var>        |
 | `linguist-vendored`                            | [`vendor.yml`]        | Excluded from stats                                             |
<!------------------------------------------------------------------------------------------------------------------------------------------->

### Detectable

By default only languages of type `programming` or `markup` in [`languages.yml`] are included in the language statistics.
Languages of a different type in [`languages.yml`] are not "detectable" by default, causing them not to be included in the language statistics,
but can be made detectable as shown below.  Languages that are not yet mentioned in [`languages.yml`] will not be included in the language
statistics, even if you specify something like `*.mycola linguist-language=MyCoolLang linguist-detectable` in the `.gitattributes` file.

Use the `linguist-detectable` attribute to mark or unmark paths as detectable:

```gitattributes
*.kicad_pcb linguist-detectable
*.sch linguist-detectable
tools/export_bom.py -linguist-detectable
```

### Documentation

Just like vendored files, Linguist excludes documentation files from your project's language stats.
[`documentation.yml`] lists common documentation paths and excludes them from the language statistics for your repository.

Use the `linguist-documentation` attribute to mark or unmark paths as documentation:

```gitattributes
# Apply override to all files in the directory
project-docs/* linguist-documentation
# Apply override to a specific file
docs/formatter.rb -linguist-documentation
# Apply override to all files and directories in the directory
ano-dir/** linguist-documentation
```

### Generated code

Not all plain text files are true source files.
Generated files like minified JavaScript and compiled CoffeeScript can be detected and excluded from language stats.
As an added bonus, unlike vendored and documentation files, these files are suppressed in diffs.
[`generated.rb`] lists common generated paths and excludes them from the language statistics of your repository.

Use the `linguist-generated` attribute to mark or unmark paths as generated.

```gitattributes
Api.elm linguist-generated
```

### Vendored code

Checking code you didn't write, such as JavaScript libraries, into your git repo is a common practice, but this often inflates your project's language stats and may even cause your project to be labeled as another language.
By default, Linguist treats all of the paths defined in [`vendor.yml`] as vendored and therefore doesn't include them in the language statistics for a repository.

Use the `linguist-vendored` attribute to vendor or un-vendor paths:

```gitattributes
# Apply override to all files in the directory
special-vendored-path/* linguist-vendored
# Apply override to a specific file
jquery.js -linguist-vendored
# Apply override to all files and directories in the directory
ano-dir/** linguist-vendored
```

## Using Emacs or Vim modelines

If you do not want to use `.gitattributes` to override the syntax highlighting used on GitHub.com, you can use Vim or Emacs style modelines to set the language for a single file.
Modelines can be placed anywhere within a file and are respected when determining how to syntax-highlight a file on GitHub.com

### Vim
```
# Some examples of various styles:
vim: syntax=java
vim: set syntax=ruby:
vim: set filetype=prolog:
vim: set ft=cpp:
```

### Emacs
```
-*- mode: php; -*-
-*- c++ -*-
```

[`documentation.yml`]: /lib/linguist/documentation.yml
[`languages.yml`]:     /lib/linguist/languages.yml
[`generated.rb`]:      /lib/linguist/generated.rb
[`vendor.yml`]:        /lib/linguist/vendor.yml

## How Linguist works on GitHub.com

When you push changes to a repository on GitHub.com, a low priority background job is enqueued to analyze your repository as explained above.
The results of this analysis are cached for the lifetime of your repository and are only updated when the repository is updated.
As this analysis is performed by a low priority background job, it can take a while, particularly during busy periods, for your language statistics bar to reflect your changes.

*Backlinks:*

```dataview
list from [[How GitHub Linguist Works]] AND -"Changelog"
```