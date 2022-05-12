---
Date: 2022-05-10
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Code/R", "#Topic/Dev/R"]
Alias: ["R - VSCode devcontainer"]
---

# R Development Container

*Source: [jimbrig/rdevcontainer: R Development Environment Using VSCode's DevContainers and Docker (github.com)](https://github.com/jimbrig/rdevcontainer)*

> Repository housing my customized R development environment using Visual Studio Code's Development Containers feature.

This project serves the purpose of creating and maintaining an optimal development environment for R within a container based R environment using Visual Studio Code's devcontainers and various R features for interacting with VSCode.

View this project's progression over time through its auto-generated [Changelog](CHANGELOG.md).

<!-- START doctoc generated TOC please keep comment here to allow auto update -->

<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**

- [R Development Container](#r-development-container)
  - [Features](#features)
  - [Development Container Images](#development-container-images)
  	- [Dockerfile](#dockerfile)
  - [Settings](#settings)
  - [Extensions](#extensions)
  	- [Installations](#installations)
  - [Notes](#notes)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## Features

Currently the development environment runs with R version 4.1 and uses zsh as its default shell; radian is used as the default R terminal.

## Development Container Images

The latest container images can be found in [this repository's package containers](https://github.com/jimbrig/rdevcontainer/pkgs/container/rdevcontainer).

These may be utilized locally by including the image as the base image in your own [devcontainer.json](.devcontainer/devcontainer.json) configuration file. 

- Pull image from the command line: `docker pull ghcr.io/jimbrig/rdevcontainer:latest`
- Use as base image in Dockerfile: `FROM ghcr.io/jimbrig/rdevcontainer:latest`

Container Image Versions:

- [rdevcontainer:latest](https://github.com/jimbrig/rdevcontainer/pkgs/container/rdevcontainer/18163217?tag=latest) - latest development container image
- [rdevcontainer:v1.1.0](https://github.com/jimbrig/rdevcontainer/pkgs/container/rdevcontainer/18163217?tag=v1.1.0) - version 1.1.0 with additional packages and configurations added to the base image.
- [rdevcontainer:v1.0.0](https://github.com/jimbrig/rdevcontainer/pkgs/container/rdevcontainer/18163185?tag=v1.0.0) - initial version of the container image primarily based off the R Community development container image.

### Dockerfile

<details><summary>View the Latest Dockerfile</summary><p>

```Dockerfile
# R version:
ARG VARIANT="4.1"
FROM rocker/r-ver:${VARIANT}

# Use the [Option] comment to specify true/false arguments that should appear in VS Code UX

# [Option] Install zsh
ARG INSTALL_ZSH="true"

# [Option] Upgrade OS packages to their latest versions
ARG UPGRADE_PACKAGES="true"

# Install needed packages and setup non-root user. Use a separate RUN statement to add your own dependencies.
ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=$USER_UID

COPY library-scripts/*.sh /tmp/library-scripts/
COPY .Rprofile ${HOME}/.Rprofile

RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && /bin/bash /tmp/library-scripts/common-debian.sh "${INSTALL_ZSH}" "${USERNAME}" "${USER_UID}" "${USER_GID}" "${UPGRADE_PACKAGES}" "true" "true" \
    && usermod -a -G staff ${USERNAME} \
    && apt-get -y install \
        python3-pip \
        libgit2-dev \
        libcurl4-openssl-dev \
        libssl-dev \
        libxml2-dev \
        libxt-dev \
    && apt-get autoremove -y && apt-get clean -y && rm -rf /var/lib/apt/lists/* /tmp/library-scripts \
    && python3 -m pip --no-cache-dir install radian \
    && install2.r --error --skipinstalled --ncpus -1 \
        devtools \
        languageserver \
        httpgd \
        rstudioapi \
        tidyverse \
    && rm -rf /tmp/downloaded_packages

# VSCode R Debugger dependency. Install the latest release version from GitHub without using GitHub API.
# See https://github.com/microsoft/vscode-dev-containers/issues/1032
RUN export TAG=$(git ls-remote --tags --refs --sort='version:refname' https://github.com/ManuelHentschel/vscDebugger v\* | tail -n 1 | cut --delimiter='/' --fields=3) \
    && Rscript -e "remotes::install_git('https://github.com/ManuelHentschel/vscDebugger.git', ref = '"${TAG}"', dependencies = FALSE)"

# R Session watcher settings.
# See more details: https://github.com/REditorSupport/vscode-R/wiki/R-Session-watcher
RUN echo 'source(file.path(Sys.getenv("HOME"), ".vscode-R", "init.R"))' >> ${R_HOME}/etc/Rprofile.site

# [Optional] Uncomment this section to install additional OS packages.
# RUN apt-get update \
#     && export DEBIAN_FRONTEND=noninteractive \
#     && apt-get -y install --no-install-recommends <your-package-list-here>
```

</p></details>

## Settings

From [devcontainer.json](.devcontainer/devcontainer.json): 

```json
"settings": {
	"r.rterm.linux": "/usr/local/bin/radian",
	"r.bracketedPaste": true,
	"r.plot.useHttpgd": true,
	"[r]": {
		"editor.defaultFormatter": "Ikuyadeu.r",
		"editor.formatOnSave": true,
		"editor.wordSeparators": "`~!@#%$^&*()-=+[{]}\\|;:'\",<>/?"
	},
	"[rmd]": {
		"editor.defaultFormatter": "Ikuyadeu.r",
		"editor.formatOnSave": true
	},
	"C_Cpp.commentContinuationPatterns": [
		"/**",
		"//'"
	],
	"path-autocomplete.pathMappings": {
		"/": "/",
		"./": "${folder}"
	}
},
```

## Extensions

- [R Extension for Visual Studio Code](https://marketplace.visualstudio.com/items?itemName=Ikuyadeu.r)

- [R Debugger for VS Code](https://marketplace.visualstudio.com/items?itemName=RDebugger.r-debugger)

- [Path Intellisense](https://marketplace.visualstudio.com/items?itemName=christian-kohler.path-intellisense) and [Path AutoComplete](https://marketplace.visualstudio.com/items?itemName=ionutvmi.path-autocomplete)

- [Prettier](https://marketplace.visualstudio.com/items?itemName=esbenp.prettier-vscode)

- [shinysnip - Simple Shiny Code Snippets generator](https://marketplace.visualstudio.com/items?itemName=Mohamed-El-Fodil-Ihaddaden.shinysnip)

- [C/C++](https://marketplace.visualstudio.com/items?itemName=ms-vscode.cpptools)

- [Error Lens](https://marketplace.visualstudio.com/items?itemName=usernamehw.errorlens)

- [Live Preview (New!)](https://marketplace.visualstudio.com/items?itemName=ms-vscode.live-server)

From [devcontainer.json](.devcontainer/devcontainer.json):

```json
"extensions": [
	"ikuyadeu.r",
	"rdebugger.r-debugger",
	"christian-kohler.path-intellisense",
	"ionutvmi.path-autocomplete",
	"esbenp.prettier-vscode",
	"Mohamed-El-Fodil-Ihaddaden.shinysnip",
	"ms-vscode.cpptools",
	"usernamehw.errorlens",
	"ms-vscode.live-server"
],
```

### Installations

Initially only the following R Packages are installed with the devcontainer:

- devtools
- languageserver
- httpgd
- rstudioapi
- tidyverse

Additionally, the Dockerfile runs the script: [common-debian.sh](./.devcontainer/library-scripts/common-debian.sh) to install system packages and other dependencies.

## Notes

- Utilize VSCode's [devcontainer-cli](https://code.visualstudio.com/docs/remote/devcontainer-cli) to manage devcontainer environments and images from the command line locally. This CLI tool can be installed directly fro the [Remote Containers Extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers).

***

*Table of Contents auto-generated thanks to [DocToc](https://github.com/thlorenz/doctoc)*  
*[CHANGELOG.md](CHANGELOG.md) auto-generated thanks to [git-cliff](https://github.com/orhun/git-cliff)* 


***

Jimmy Briggs | 2022


***

## Appendix: Links

- [[Code]]
- [[2-Areas/MOCs/R]]
- [[Development]]

*Backlinks:*

```dataview
list from [[R - VSCode devcontainer]] AND -"Changelog"
```