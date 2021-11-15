---
Date: 2021-11-15
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Guide", "#Topic/Dev"]
Alias: "WSL Terminal and Shell Setup Guide"
---

# WSL Terminal and Shell Setup Guide

- Terminal Emulator: [[Microsoft Windows Terminal (Preview)]]
- Shell: [[zsh]] (or z-shell) + [[oh-my-zsh]]
- Theme: [[powerlevel10k]] + a [[Nerdfont]]

## Install Zsh

```bash
sudo apt-get install zsh
zsh
```

when prompted, select `0` to create config file and prevent message from showing again (I will customize configuration when installing oh-my-zsh).

## Install oh-my-zsh

Before running the installation script, may be helpful to setup [[Git]] first:

```bash
sudo apt-get -y install git
git config --global user.name "Jimmy Briggs"
git config --global user.name "jimmy.briggs@jimbrig.com"
```

Then install oh-my-zsh:

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

This will clone the repo and replace the existing `~/.zshrc` with a template from `oh-my-zsh`. When prompted, set zsh as default shell.

![[Pasted image 20211115122342.png]]
## Install Powerline

First, need Nerdfonts:

```bash
git clone https://github.com/powerline/fonts.git
```

### Configure Zsh and oh-my-zsh

- Edit `~/.zshrc`
	- Set `ZSH_THEME="agnoster"`
	- 

*Backlinks:*

```dataview
list from [[WSL Termi