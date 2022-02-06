---
Date: 2021-11-26
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Tool"]
Alias: ["Todoist-CLI"]
---

# Todoist CLI

*Source: [sachaos/todoist Todoist CLI Client. I ❤️ Todoist and CLI.](https://github.com/sachaos/todoist)*

[sachaos/todoist](https://github.com/sachaos/todoist) is a CLI for [Todoist](https://doist.com) written in [Golang]() and available on GitHub.

## Contents

- [[#Installation|Installation]]
- [[#Register API token|Register API token]]
- [[#Sync|Sync]]
- [[#Usage|Usage]]
	- [[#`list --filter`|`list --filter`]]
		- [[#e.g. List tasks which over due date and have high priority|e.g. List tasks which over due date and have high priority]]
- [[#Config|Config]]
	- [[#Use with peco/fzf|Use with peco/fzf]]
		- [[#If Installed via Homebrew|If Installed via Homebrew]]
	- [[#Enable shell completion|Enable shell completion]]



## Installation

To install can use Homebrew (Unix):

```bash
brew tap sachaos/todoist
brew install todoist 
```

or use [Docker](https://docker.com):

```bash
git clone https://github.com/sachaos/todoist.git
cd todoist
make docker-build token=<TODOIST_API_TOKEN>
make docker-run
```

## Register API token

When you run `todoist` for the first time, you will be asked your *Todoist API Token*. 

Input Todoist API token and register it. 

In order to get your API token go to <https://todoist.com/prefs/integrations>.

## Sync

After you register your API token, you should sync with <todoist.com> by the `sync` sub-command:

```bash
todoist sync
```

## Usage

```bash
todoist --help

NAME:
   todoist - Todoist CLI Client

USAGE:
   todoist [global options] command [command options] [arguments...]

VERSION:
   0.15.0

COMMANDS:
     list, l                  Show all tasks
     show                     Show task detail
     completed-list, c-l, cl  Show all completed tasks (only premium users)
     add, a                   Add task
     modify, m                Modify task
     close, c                 Close task
     delete, d                Delete task
     labels                   Show all labels
     projects                 Show all projects
     karma                    Show karma
     sync, s                  Sync cache
     quick, q                 Quick add a task
     help, h                  Show a list of commands or help for one command

GLOBAL OPTIONS:
   --color              colorize output
   --csv                output in CSV format
   --debug              output logs
   --namespace          display parent task like namespace
   --indent             display children task with indent
   --project-namespace  display parent project like namespace
   --help, -h           show help
   --version, -v        print the version
```

### `list --filter`

You can filter tasks by `--filter` option on `list` subcommand.
The filter syntax is base on [todoist official filter syntax](https://support.todoist.com/hc/en-us/articles/205248842-Filters).

Supported filter is [here](https://github.com/sachaos/todoist/issues/15#issuecomment-334140101).

#### e.g. List tasks which over due date and have high priority

```bash
todoist list --filter '(overdue | today) & p1'
```

## Config

Config by default stored in `$HOME/.config/todoist/config.json`

It has following parameters:

```json
{
  "token": "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx", # todoist api token, required
  "color": "true"                                      # colorize all output, not required, default false
}
```
### Use with peco/fzf

**RECOMMENDED**

Install [peco](https://github.com/peco/peco) and load `todoist_functions.sh` on your `.zshrc`, like below.

fish version is here. [ka2n/fish-peco_todoist](https://github.com/ka2n/fish-peco_todoist) Thanks @ka2n!

If you would prefer to use [fzf](https://github.com/junegunn/fzf) instead load `todoist_functions_fzf.sh` like below.

```bash
source "$GOPATH/src/github.com/sachaos/todoist/todoist_functions.sh"
```

#### If Installed via Homebrew

If installed via homebrew and using zsh (usually this is added to your `.zshrc`, before loading your ZSH plugin manager):

For **peco**:

```zsh
source $(brew --prefix)/share/zsh/site-functions/_todoist_peco
```

For **fzf**:

```bash
source $(brew --prefix)/share/zsh/site-functions/_todoist_fzf
```

### Enable shell completion

You can also enable shell completion by adding the following lines to your `.bashrc`/`.zshrc` files.

```bash
# Bash
PROG=todoist source "$GOPATH/src/github.com/urfave/cli/autocomplete/bash_autocomplete"
# Zsh
PROG=todoist source "$GOPATH/src/github.com/urfave/cli/autocomplete/zsh_autocomplete"
```


***

## Appendix: Related

- [[Tools]]
- [[Todoist]]
- [[CLI Tools]]

*Backlinks:*

```dataview
list from [[Tool-Template]] AND -"Changelog"
```