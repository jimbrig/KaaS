---
Date: 2022-01-28
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Tool", "#Topic/Dev/CLI"]
Alias: ["Topgrade"]
---

# Topgrade

*Source: [r-darwish/topgrade: Upgrade everything (github.com)](https://github.com/r-darwish/topgrade)*

## About

Keeping your system up to date usually involves invoking multiple package managers. This results in big, non-portable shell one-liners saved in your shell. To remedy this, _topgrade_ detects which tools you use and runs the appropriate commands to update them.

-   Arch Linux: [AUR](https://aur.archlinux.org/packages/topgrade/) package.
-   NixOS: _topgrade_ package in `nixpkgs`.
-   macOS: [Homebrew](https://brew.sh/) or [MacPorts](https://www.macports.org/install.php).

Other systems users can either use `cargo install` or use the compiled binaries from the release page. The compiled binaries contain a self-upgrading feature.

Topgrade requires Rust 1.51 or above.

## Usage

Just run `topgrade`. See [the wiki](https://github.com/r-darwish/topgrade/wiki/Step-list) for the list of things Topgrade supports.

## Customization

See [`config.example.toml`](https://github.com/r-darwish/topgrade/blob/develop/config.example.toml) for an example configuration file.

My Configuration File is slightly more advanced and looks like this:

- `%APPDATA%\topgrade.toml` (Windows)

```toml
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
```

Plus my [[Windows Subsystem for Linux]] separate configuration file at `\\wsl.localhost\kali-linux\home\jimmy\.config`:

```toml
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

```

### [](https://github.com/r-darwish/topgrade#configuration-path)Configuration path

The configuration should be placed in the following paths depending by the operating system:

-   **Windows** - `%APPDATA%/topgrade.toml`
-   **macOS** and **other Unix systems** - `${XDG_CONFIG_HOME:-~/.config}/topgrade.toml`

## [](https://github.com/r-darwish/topgrade#remote-execution)Remote execution

You can specify a key called `remote_topgrades` in the configuration file. This key should contain a list of hostnames that have topgrade installed on them. Topgrade will use `ssh` to run `topgrade` on remote hosts before acting locally. To limit the execution only to specific hosts use the `--remote-host-limit` parameter.

***

## Appendix: Related

- [[Tools]]

*Backlinks:*

```dataview
list from [[Tool-Template]] AND -"Changelog"
```