# RIM - R Installation Manager CLI

Link: [gaborcsardi/rim: The R Installation Manager (github.com)](https://github.com/gaborcsardi/rim)

## Installation

Install from the GitHub releases URL here: [Releases · gaborcsardi/rim (github.com)](https://github.com/gaborcsardi/rim/releases)

* Install using [2-Areas/MOCs/PowerShell](../../../../2-Areas/MOCs/PowerShell.md) and [GitHub CLI](../Command%20Line%20Utilities/GitHub%20CLI.md) via the following commands:

````powershell
gh release download -R gaborcsardi/rim -D "$HOME\Downloads" -p "*.exe"
Start-Process "$HOME\Downloads\rim-*.exe"
````

## Usage

````powershell
➜ rim --help
RIM -- The R Installation Manager 0.1.5

DESCRIPTION
    rim manages your R installations, on macOS and Windows. It can install
    and set up multiple versions R, and it makes sure that they work
    together.

    rim is currently experimental and work in progress. Feedback is much
    appreciated. See https://github.com/gaborcsardi/rim for bug reports.

USAGE:
    rim.exe [SUBCOMMAND]

OPTIONS:
    -h, --help       Print help information
    -V, --version    Print version information

SUBCOMMANDS:
    add        Install a new R version
    default    Print or set default R version
    help       Print this message or the help of the given subcommand(s)
    list       List installed R versions
    resolve    Resolve a symbolic R version
    rm         Remove R versions
    system     Manage current installations

EXAMPLES:
    # Add the latest development snapshot
    rim add devel

    # Add the latest release
    rim add release

    # Install specific version
    rim add 4.1.2

    # Install latest version within a minor branch
    rim add 4.1

    # List installed versions
    rim list

    # Set default version
    rim default 4.0
````

---

## Appendix: Related

* [Tools](../../Tools.md)

*Backlinks:*

````dataview
list from [[Tool-Template]] AND -"Changelog"
````
