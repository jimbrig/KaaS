---
Date: 2022-02-06
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Tool/PythonPackage", "#Topic/Dev/Python", "#Type/Tool/CLI", "#Topic/Productivity"]
Alias: ["Python Package - keep", "keep"]
---

# Python Package - keep

*Source: [OrkoHunter/keep: A Meta CLI toolkit : Personal shell command keeper and snippets manager (github.com)](https://github.com/OrkoHunter/keep)*

![](https://i.imgur.com/QZPBRl0.png)


## Overview

**Keep** is a *Meta CLI toolkit : Personal shell command keeper and snippets manager.*

## Features

-   Save a new command with a brief description
-   Search the saved commands using powerful patterns
-   Save the commands as a secret GitHub gist
-   Use `keep push` and `keep pull` to sync the commands between GitHub gist and other computers.

**ProTip : Save the commands you usually forget in ssh sessions and sync it with your local machine.**

## Installation

```bash
pip3 install keep
```

Use Python 3.6 or later.

You can install pip3 using apt-get as `sudo apt install python3-pip`.

## Usage

```bash
Usage: keep [OPTIONS] COMMAND [ARGS]...

  Keep and view shell commands in terminal only.

  Read more at https://github.com/orkohunter/keep

Options:
  -v, --verbose  Enables verbose mode.
  --help         Show this message and exit.

Commands:
  edit          Edit a saved command.
  github_token  Register a GitHub Token to use GitHub Gists as a backup.
  grep          Searches for a saved command.
  init          Initializes the CLI.
  list          Shows the saved commands.
  new           Saves a new command.
  pull          Pull commands from saved GitHub gist.
  push          Push commands to a secret GitHub gist.
  rm            Deletes a saved command.
  run           Executes a saved command.
  update        Check for an update of Keep.
```

[See the detailed usage and tutorial.](https://github.com/OrkoHunter/keep/blob/master/tutorial.md)

### Command-line Completion

To enable command-line completion (TAB completion) follow these steps for the shell of your choice

#### bash

1.  Create a directory in your home directory called `.bash`
    
```bash
mkdir -p $HOME/.bash
```
    
2.  Copy [completion/keep.bash](https://github.com/OrkoHunter/keep/blob/master/completions/keep.bash) to `$HOME/.bash/keep`
    
```bash
curl -SLo "$HOME/.bash/keep" "https://raw.githubusercontent.com/OrkoHunter/keep/master/completions/keep.bash"
```
    
3.  Add the following lines to `$HOME/.bashrc` file
    
```bash
[ -f "$HOME/.bash/keep" ] && . "$HOME/.bash/keep"
```
    
#### zsh

*See Also: [[zsh]]*

1.  Create a directory in your home called `.zsh`
    
```zsh
mkdir -p $HOME/.zsh
```
    
2.  Copy [completion/keep.zsh](https://github.com/OrkoHunter/keep/blob/master/completions/keep.zsh) to `$HOME/.zsh/_keep`
    
```zsh
curl -SLo "$HOME/.zsh/_keep" "https://raw.githubusercontent.com/OrkoHunter/keep/master/completions/keep.zsh"
```
    
3.  Add the following lines inside `$HOME/.zshrc` file
    
```zsh
fpath=($HOME/.zsh $fpath)
autoload -Uz compinit && compinit
```

## Resources

Not a command line fanatic? Here are some resources for you :

-   [https://github.com/jlevy/the-art-of-command-line](https://github.com/jlevy/the-art-of-command-line)
-   [https://github.com/herrbischoff/awesome-osx-command-line](https://github.com/herrbischoff/awesome-osx-command-line)
-   [https://github.com/alebcay/awesome-shell](https://github.com/alebcay/awesome-shell)
-   [https://github.com/aharris88/awesome-cli-apps](https://github.com/aharris88/awesome-cli-apps)

***

## Appendix: Links

- [[Tools]]
- [[Development]]
- [[Python]]
- [[Python Packages]]
- [[CLI Tools]]


*Backlinks:*

```dataview
list from [[Python Package - keep]] AND -"Changelog"
```