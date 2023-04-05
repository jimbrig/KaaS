# Topgrade

*Source: [r-darwish/topgrade: Upgrade everything (github.com)](https://github.com/r-darwish/topgrade)*

## Contents

* [About](Topgrade.md#about)
* [Usage](Topgrade.md#usage)
* [Example](Topgrade.md#example)
* [Customization](Topgrade.md#customization)
  * [Configuration path](Topgrade.md#configuration-path)
* [Custom Commands](Topgrade.md#custom-commands)
* [Step List](Topgrade.md#step-list)
* [Remote execution](Topgrade.md#remote-execution)
* [Appendix: Links](Topgrade.md#appendix-links)

## About

Keeping your system up to date usually involves invoking multiple package managers. This results in big, non-portable shell one-liners saved in your shell. To remedy this, *topgrade* detects which tools you use and runs the appropriate commands to update them.

* Arch Linux: [AUR](https://aur.archlinux.org/packages/topgrade/) package.
* NixOS: *topgrade* package in `nixpkgs`.
* macOS: [Homebrew](https://brew.sh/) or [MacPorts](https://www.macports.org/install.php).

Other systems users can either use `cargo install` or use the compiled binaries from the release page. The compiled binaries contain a self-upgrading feature.

Topgrade requires Rust 1.51 or above.

## Usage

Just run `topgrade`. See [the wiki](https://github.com/r-darwish/topgrade/wiki/Step-list) for the list of things Topgrade supports.

![Topgrade-Example.gif](_assets/Topgrade-Example.gif)

## Example

When I run `topgrade` from an Administrative Shell, it performs the following steps in sequence (see the Customization, Configuration, and Custom Commands sections below for details):

*WSL Section's Output:*

![](https://i.imgur.com/jpHY4eF.png)

*Full Output:*

![](https://i.imgur.com/fWau52J.png)

## Customization

See [`config.example.toml`](https://github.com/r-darwish/topgrade/blob/develop/config.example.toml) for an example configuration file.

My Configuration File is slightly more advanced and looks like this:

* `%APPDATA%\topgrade.toml` (Windows)

````toml
# Don't ask for confirmations
assume_yes = true

# Do not ask to retry failed steps (default: false)
no_retry = true

# Do not set the terminal title
set_title = false

# Cleanup temporary or old files
cleanup = true

# Causes Topgrade to rename itself during the run to allow package managers
# to upgrade it. Use this only if you installed Topgrade by using a package
# manager such as Scoop to Cargo
# self_rename = true

# Ignore failures for these steps
ignore_failures = ["powershell"]

# Disable specific steps - same options as the command line flag
disable = ["winget", "gcloud", "git_repos"]

# Custom commands
[commands]
"Gcloud Components" = "sudo cmd.exe /c 'gcloud components update'" 
"R Packages" = "& Rscript -e \"update.packages(lib.loc = .libPaths()[[1]], repos = 'https://cloud.r-project.org/', ask = FALSE)\""
"Choco Package List Backup" = "cmd.exe /c 'cplb'"
"Choco Cleanup" = "sudo cmd.exe /c 'choco-cleaner'"
"System Cleanup" = "sudo cmd.exe /c Cleanmgr /sageset:65535 & Cleanmgr /sagerun:65535"
"SFC Scan" = "sudo cmd.exe /c 'sfc /scannow'"

# Run specific steps - same options as the command line flag
#only = ["system", "emacs"]

[windows]
# Manually select Windows updates
accept_all_updates = true
open_remotes_in_new_terminal = true

[linux]
# Arguments to pass yay when updating packages
#yay_arguments = "--nodevel"
#trizen_arguments = "--devel"
#enable_tlmgr = true
#emerge_sync_flags = "-q"
#emerge_update_flags = "-uDNa --with-bdeps=y world"
#redhat_distro_sync = false
#rpm_ostree = false

[git]
#max_concurrency = 5
# Additional git repositories to pull
#repos = [
#    "~/src/*/",
#    "~/.config/something"
#]

# Don't pull the predefined git repos
#predefined_repos = false

# Arguments to pass Git when pulling Repositories
#arguments = "--rebase --autostash"

[composer]
#self_update = true

# Commands to run before anything
[pre_commands]
#"Emacs Snapshot" = "rm -rf ~/.emacs.d/elpa.bak && cp -rl ~/.emacs.d/elpa ~/.emacs.d/elpa.bak"


#"Python Environment" = "~/dev/.env/bin/pip install -i https://pypi.python.org/simple -U --upgrade-strategy eager jupyter"

[brew]
#greedy_cask = true

[npm]
# Use sudo if the NPM directory isn't owned by the current user
#use_sudo = true

# Run inside tmux
#run_in_tmux = true

# List of remote machines with Topgrade installed on them
#remote_topgrades = ["toothless", "pi", "parnas"]

# Arguments to pass SSH when upgrading remote systems
#ssh_arguments = "-o ConnectTimeout=2"

# Path to Topgrade executable on remote machines
#remote_topgrade_path = ".cargo/bin/topgrade"

# Arguments to pass tmux when pulling Repositories
#tmux_arguments = "-S /var/tmux.sock"

[firmware]
# Offer to update firmware; if false just check for and display available updates
#upgrade = true

[flatpak]
# Use sudo for updating the system-wide installation
#use_sudo = true
````

Plus my [Windows Subsystem for Linux](../Developer%20Tools/Linux/Windows%20Subsystem%20for%20Linux.md) separate configuration file at `\\wsl.localhost\kali-linux\home\jimmy\.config`:

````toml
# `~/.config/topgrade.toml`


# Don't ask for confirmations
assume_yes = true

# Disable specific steps - same options as the command line flag
disable = ["gcloud", "pnpm"]

# Ignore failures for these steps
ignore_failures = ["powershell"]

# Run specific steps - same options as the command line flag
#only = ["system", "emacs"]

# Do not ask to retry failed steps (default: false)
no_retry = true

# Run inside tmux
#run_in_tmux = true

# List of remote machines with Topgrade installed on them
#remote_topgrades = ["toothless", "pi", "parnas"]

# Arguments to pass SSH when upgrading remote systems
#ssh_arguments = "-o ConnectTimeout=2"

# Path to Topgrade executable on remote machines
#remote_topgrade_path = ".cargo/bin/topgrade"

# Arguments to pass tmux when pulling Repositories
#tmux_arguments = "-S /var/tmux.sock"

# Do not set the terminal title
set_title = false

# Cleanup temporary or old files
cleanup = true

[git]
#max_concurrency = 5
# Additional git repositories to pull
#repos = [
#    "~/src/*/",
#    "~/.config/something"
#]

# Don't pull the predefined git repos
#predefined_repos = false

# Arguments to pass Git when pulling Repositories
#arguments = "--rebase --autostash"

[composer]
self_update = true

# Commands to run before anything
[pre_commands]
#"Emacs Snapshot" = "rm -rf ~/.emacs.d/elpa.bak && cp -rl ~/.emacs.d/elpa ~/.emacs.d/elpa.bak"

# Custom commands
[commands]
#"Python Environment" = "~/dev/.env/bin/pip install -i https://pypi.python.org/simple -U --upgrade-strategy eager jupyter"

[brew]
#greedy_cask = true

[linux]
# Arch Package Manager to use. Allowed values: autodetect, trizen, paru, yay, pacman.
#arch_package_manager = "pacman"
# Arguments to pass yay (or paru) when updating packages
#yay_arguments = "--nodevel"
show_arch_news = true
#trizen_arguments = "--devel"
enable_tlmgr = true
#emerge_sync_flags = "-q"
#emerge_update_flags = "-uDNa --with-bdeps=y world"
#redhat_distro_sync = false
#rpm_ostree = false

[windows]
# Manually select Windows updates
#accept_all_updates = false
#open_remotes_in_new_terminal = true

# Causes Topgrade to rename itself during the run to allow package managers
# to upgrade it. Use this only if you installed Topgrade by using a package
# manager such as Scoop to Cargo
self_rename = true

[npm]
# Use sudo if the NPM directory isn't owned by the current user
#use_sudo = true

[firmware]
# Offer to update firmware; if false just check for and display available updates
upgrade = true

[flatpak]
# Use sudo for updating the system-wide installation
use_sudo = true

````

### Configuration path

The configuration should be placed in the following paths depending by the operating system:

* **Windows** - `%APPDATA%/topgrade.toml`
* **macOS** and **other Unix systems** - `${XDG_CONFIG_HOME:-~/.config}/topgrade.toml`

## Custom Commands

Notice that I implement the following custom commands in my configuration file under this section:

````toml
# Custom commands
[commands]
"Gcloud Components" = "sudo cmd.exe /c 'gcloud components update'" 
"R Packages" = "& Rscript -e \"update.packages(lib.loc = .libPaths()[[1]], repos = 'https://cloud.r-project.org/', ask = FALSE)\""
"Choco Package List Backup" = "cmd.exe /c 'cplb'"
"Choco Cleanup" = "sudo cmd.exe /c 'choco-cleaner'"
"System Cleanup" = "sudo cmd.exe /c Cleanmgr /sageset:65535 & Cleanmgr /sagerun:65535"
"SFC Scan" = "sudo cmd.exe /c 'sfc /scannow'"
````

These commands tell Topgrade to perform the following additional steps:

* Update `gcloud` components
* Update my R Packages
* Run `choco-pakcage-list-backup` (cplb)
* Run `choco-cleaner`
* Perform a *deep* background system cleanup via `cleanmgr`
* Run an SFC Scan via `sfc /scannow`

## Step List

Here's a comprehensive listing of Topgrade's complete list of tasks it can perform:

* **Linux**: Run the system package manager:
  * **Arch based**: Run [yay](https://github.com/Jguer/yay) or fall back to pacman
  * **Redhat based**: Run `yum upgrade` (or `dnf` if present)
  * **Debian based**: Run `apt update && apt dist-upgrade`
  * **Clear Linux**: Run `swupd update`
  * **Gentoo**: Run `layman -s ALL && emerge --sync -q && eix-update && emerge -uDNa world`
  * **openSUSE**: Run `zypper refresh && zypper dist-upgrade`
  * **Void**: Run `xbps-install -Su`
* **Linux**: Run [etc-update](https://dev.gentoo.org/~zmedico/portage/doc/man/etc-update.1.html):
* **DragonFly BSD**: Upgrade and audit packages
* **FreeBSD**: Upgrade and audit packages
* **Unix**: Run `brew update && brew upgrade`. This should handle both Homebrew and Linuxbrew
* **Unix**: Run `nix upgrade-nix && nix --upgrade`.
* **Unix**: Run [Pearl](https://github.com/pearl-core/pearl) `pearl update`.
* **Windows**: Run Topgrade inside WSL.
* **Windows**: Upgrade Powershell modules
* **Windows**: Upgrade all [Chocolatey](https://chocolatey.org/) packages
* **Windows**: Upgrade all [Scoop](https://scoop.sh/) packages
* Check if the following paths are tracked by Git. If so, pull them:
  * ~/.emacs.d (Should work whether you use [Spacemacs](http://spacemacs.org/) or a custom configuration)
  * ~/.zshrc
  * ~/.tmux
  * ~/.config/fish
  * ~/.config/nvim
  * ~/.vim
  * ~/.config/openbox
  * ~/.config/bspwm
  * ~/.config/i3
  * ~/.config/sway
  * Powershell Profile
  * [Microsoft Terminal](https://github.com/microsoft/terminal) configuration
  * Custom defined paths
* **Unix**: Run [zr](https://github.com/jedahan/zr) update
* **Unix**: Run [zplug](https://github.com/zplug/zplug) update
* **Unix**: Run [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh) update
* **Unix**: Run [antigen](https://github.com/zsh-users/antigen) update
* **Unix**: Run [antibody](https://getantibody.github.io/) update
* **Unix**: Run [fisher](https://github.com/jorgebucaran/fisher)
* **Unix**: Upgrade tmux plugins with [TPM](https://github.com/tmux-plugins/tpm). *Note*: Do not use the `-b` flag in your configuration as suggested by the TPM readme.
* Update Rustup by running `rustup update`. This will also attempt to run `rustup self update` when Rustup is installed inside the home directory.
* Run Cargo [install-update](https://github.com/nabijaczleweli/cargo-update)
* Upgrade Emacs packages (You'll get a better output if you have [Paradox](https://github.com/Malabarba/paradox) installed)
* Upgrade [Flutter SDK](https://flutter.dev/docs/development/tools/sdk/upgrading)
* Upgrade [OCaml packages](https://opam.ocaml.org/)
* Upgrade [vcpkg](https://github.com/Microsoft/vcpkg) globally installed packages
* Upgrade [myrepos](https://myrepos.branchable.com/) managed sourcecode repositories
* Upgrade Python packages installed using [pipx](https://github.com/cs01/pipx)
* Upgrade [R globally installed packages](https://github.com/ankane/jetpack)
* Upgrade [stack](https://docs.haskellstack.org/en/stable/README/)
* Upgrade Vim/Neovim packages. Works with the following plugin frameworks:
  * [NeoBundle](https://github.com/Shougo/neobundle.vim)
  * [Vundle](https://github.com/VundleVim/Vundle.vim)
  * [Plug](https://github.com/junegunn/vim-plug)
  * [Dein](https://github.com/Shougo/dein.vim)
  * [Voom](https://github.com/airblade/voom)
* Node
  * Run `yarn global update` if yarn is installed.
  * Run `npm update -g`. In Unix systems other then macOS the step will be performed only if`npm root -g` is a path inside your home directory.
* Run `composer global update` if Composer's home directory is inside the home directory of the user. Run `valet install` after.
* Upgrade Atom packages
* Run `gem upgrade --user-install` if `~/.gem` exists
* **Linux**: Update Flatpak packages
* **Linux**: Update snap packages
* **Linux**: Run [fwupdmgr](https://github.com/hughsie/fwupd) to show firmware upgrade. (View only. No upgrades will actually be performed)
* **Linux**: Run [pihole](https://pi-hole.net/) updater
* Run custom defined commands
* Final stage
  * **Linux**: Run [needrestart](https://github.com/liske/needrestart)
  * **Windows**: Run Windows Update (You'll have to install [PSWindowsUpdate](https://marckean.com/2016/06/01/use-powershell-to-install-windows-updates/))
  * **macOS**: Upgrade App Store applications using [mas](https://github.com/mas-cli/mas)
  * **macOS**: Upgrade the system
  * **FreeBSD**: Run `freebsd-upgrade`

## Remote execution

You can specify a key called `remote_topgrades` in the configuration file. This key should contain a list of hostnames that have topgrade installed on them. Topgrade will use `ssh` to run `topgrade` on remote hosts before acting locally. To limit the execution only to specific hosts use the `--remote-host-limit` parameter.

---

## Appendix: Links

* [Tools](../Tools.md)
* [CLI Tools List](../../../2-Areas/Lists/CLI%20Tools%20List.md) | [CLI Tools List > Package Managers](../../../2-Areas/Lists/CLI%20Tools%20List.md#package-managers)
* [Windows Subsystem for Linux](../Developer%20Tools/Linux/Windows%20Subsystem%20for%20Linux.md)
* [WSL Initial Setup Notes](../../../0-Slipbox/WSL%20Initial%20Setup%20Notes.md)
* [2-Areas/MOCs/PowerShell](../../../2-Areas/MOCs/PowerShell.md)
* [Chocolatey](../Developer%20Tools/Package%20Managers/Chocolatey/Chocolatey.md)
* [Scoop](../Developer%20Tools/Package%20Managers/Scoop/Scoop.md)
* [Rust - Cargo](../Developer%20Tools/Package%20Managers/Rust%20-%20Cargo.md)
* *Rust*
* [Git](../Developer%20Tools/Version%20Control/Git.md)
* [2-Areas/MOCs/R](../../../2-Areas/MOCs/R.md)
* [Winget](../Developer%20Tools/Package%20Managers/Winget.md)

*Backlinks:*

````dataview
list from [[Tool-Template]] AND -"Changelog"
````
