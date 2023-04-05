# Guide - Setup oh-my-zsh

## Contents

* [Setup oh-my-zsh](Guide%20-%20Setup%20oh-my-zsh.md#setup-oh-my-zsh)
* [Install Meslo Nerd Font](Guide%20-%20Setup%20oh-my-zsh.md#install-meslo-nerd-font)
* [Setup OhMyZsh](Guide%20-%20Setup%20oh-my-zsh.md#setup-ohmyzsh)
* [Appendix: Links](Guide%20-%20Setup%20oh-my-zsh.md#appendix-links)

## Pre-Requisites

1. Install a *nerd-font* - Follow the linked instructions to install the <a href="https://github.com/romkatv/powerlevel10k#manual-font-installation" target="_blank">Meslo Nerd Font</a>.
1. Apply the *nerd-font* to your defauly terminal, shells, and editors:
   * [Windows Terminal](../../3-Resources/Tools/Developer%20Tools/Terminal/Windows%20Terminal.md): Open Settings (Ctrl+,), search for *fontFace* and set value to the installed `NF` nerd font (i.e. "MesloLGS NF") for every profile and the default profile.
   * [VSCode](../../3-Resources/Tools/Developer%20Tools/Documentation/Text%20Editors/VSCode.md):  Open File → Preferences → Settings, enter `terminal.integrated.fontFamily` in the search box and set the value to to the installed `NF` nerd font (i.e. "MesloLGS NF")
   * *Windows Console Host*: Click the icon in the top left corner, then Properties → Font and set Font to "MesloLGS NF"
   * *Jupyter Lab* Terminal: Settings: Advanced Settings Editor → Terminal, then enter the below in the `User Preferences` window
1. Install [zsh](../../3-Resources/Tools/Developer%20Tools/Shell/zsh.md) Shell: `sudo apt-get -y install zsh`

## Set Default Shell

Start by setting `ZSH` as the default shell instead of `BASH`: `chsh -s $(which zsh)`

````bash
chsh -s $(which zsh)
````

## Install Oh-My-Zsh

To “install” (really just cloning a git repo) [oh-my-zsh](../../3-Resources/Tools/Developer%20Tools/Shell/oh-my-zsh.md) simple execute the shell command below:

````bash
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)";
````

Validate by running:

````bash
omz --version
````

## Install oh-my-zsh Plugins

* [zsh-completions](https://github.com/zsh-users/zsh-completions): 
* [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions):
* [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting):
* [k](https://github.com/supercrabtree/k):

To install manually simply, clone these plugins to the default `ZSH_CUSTOM/plugins` folder:

````bash
install_omz_plugin() {
	
}

git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions;
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions;
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting;
git clone https://github.com/supercrabtree/k ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/k;
````

Run the commands below to install some useful plugins and the `powerlevel10k` theme:

````


git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k;
````

Now use VSCode, or another text editor, to make a few changes to the `.zshrc` file. For example, if you have VSCode installed you can use it from a macOS or Windows Terminal by typing: 

````
code ~/.zshrc
````

Replace the `plugins` section in the `.zshrc` file with the code below

````
plugins=(
  git
  zsh-completions
  zsh-autosuggestions
  zsh-syntax-highlighting
  k
)
````

Then replace `ZSH_THEME="robbyrussell"` with `ZSH_THEME="powerlevel10k/powerlevel10k"` in `~/.zshrc`. Save the changes and type `source ~/.zshrc` in the terminal to start the configuration wizard. Follow the prompts and select the setup you prefer. You can always update and change the configuration by running `p10k configure` in a terminal. 

---

## Appendix: Links

**See Also:**
