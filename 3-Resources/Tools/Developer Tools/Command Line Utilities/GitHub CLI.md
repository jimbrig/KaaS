---
Date: 2022-01-28
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Tool", "#Topic/Dev/CLI"]
Alias: ["GitHub CLI"]
---

# GitHub CLI

## Reference Links

- [GitHub CLI | Take GitHub to the command line](https://cli.github.com/)
- [Manual | GitHub CLI](https://cli.github.com/manual/)
	- [Installation instructions | GitHub CLI](https://cli.github.com/manual/installation)
- [GitHub CLI - GitHub Docs](https://docs.github.com/en/github-cli)
- [GitHub CLI](https://github.com/cli)
	- [cli/cli: GitHub’s official command line tool](https://github.com/cli/cli)
	- [cli/scoop-gh: scoop packaging for the github cli](https://github.com/cli/scoop-gh)

## Installation

### Windows

```powershell
# install via scoop
scoop bucket add github-gh https://github.com/cli/scoop-gh.git
scoop install gh

# install via chocolatey
choco -y install gh
```

### Linux

*Source: [cli/install_linux.md at trunk · cli/cli (github.com)](https://github.com/cli/cli/blob/trunk/docs/install_linux.md)*

```bash
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/etc/apt/trusted.gpg.d/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/trusted.gpg.d/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
sudo apt update
sudo apt install gh
```

Upgrade:

```bash
sudo apt update
sudo apt install gh
```

### Post-Installation Configuration

- See [gh config | GitHub CLI](https://cli.github.com/manual/gh_config)

```powershell
gh config set [editor]
```

Display or change configuration settings for `gh`.

Current respected settings:

-   `git_protocol`: the protocol to use for git clone and push operations (default: "https")
-   `editor`: the text editor program to use for authoring text
-   `prompt`: toggle interactive prompting in the terminal (default: "enabled")
-   `pager`: the terminal pager program to send standard output to
-   `http_unix_socket`: the path to a unix socket through which to make HTTP connection
-   `browser`: the web browser to use for opening URLs

#### Commands

-   [gh config get](https://cli.github.com/manual/gh_config_get)
-   [gh config list](https://cli.github.com/manual/gh_config_list)
-   [gh config set](https://cli.github.com/manual/gh_config_set)

### See also

-   [gh](https://cli.github.com/manual/gh)

***

## Appendix: Related

- [[Tools]]
- [[CLI Tools List]]
- [[GitHub]]
- [[3-Resources/Highlights/Readwise 1/Articles/Top GitHub Best Practices for Developers]]

*Backlinks:*

```dataview
list from [[Tool-Template]] AND -"Changelog"
```