---
Date: 2021-10-27
Author: Jimmy Briggs <jimmy.briggs@pwc.com>
Alias: "KaaS"
Tags: ["#Type/Readme"]
---

<head>
<link rel="apple-touch-icon" sizes="76x76" href="/apple-touch-icon.png?v=2.0">
<link rel="icon" type="image/png" sizes="32x32" href="/favicon-32x32.png?v=2.0">
<link rel="icon" type="image/png" sizes="16x16" href="/favicon-16x16.png?v=2.0">
<link rel="manifest" href="/site.webmanifest?v=2.0">
<link rel="mask-icon" href="/safari-pinned-tab.svg?v=2.0" color="#5bbad5">
<link rel="shortcut icon" href="/favicon.ico?v=2.0">
<meta name="apple-mobile-web-app-title" content="KaaS">
<meta name="application-name" content="KaaS">
<meta name="msapplication-TileColor" content="#2b5797">
<meta name="theme-color" content="#ffffff">
</head>


<h1 align="center">KaaS - Knowledge as a Service</h1>
<p align="center">
    <a href="https://publish.obsidian.md/kaas-published/">KaaS - Obsidian Publish</a> | 
    <a href="https://kaas.jimbrig.com">KaaS - GitHub Pages</a> | 
    <a href="https://github.com/jimbrig/kaas">GitHub Repo</a>
</p>
<h4 align="center">Curated Knowledge for the Masses</h4>
<h5 align="center">Created by <a href="https://github.com/jimbrig">Jimmy Briggs</a></h5>
<p align="center">
    <img src="https://i.imgur.com/FB2il3N.png"; height="50%"; width="50%"/>
</p>
<br>
<p align="center">
    <a href="https://github.com/jimbrig/KaaS/actions/workflows/convert-links.yml">
        <img src="https://github.com/jimbrig/KaaS/actions/workflows/convert-links.yml/badge.svg"></img>
    </a>
    <a href="https://github.com/jimbrig/KaaS/actions/workflows/mkdocs.yml">
        <img src="https://github.com/jimbrig/KaaS/actions/workflows/mkdocs.yml/badge.svg"></img>
    </a>
    <a href="https://github.com/jimbrig/KaaS/actions/workflows/pages/pages-build-deployment">
        <img src="https://github.com/jimbrig/KaaS/actions/workflows/pages/pages-build-deployment/badge.svg"></img>
    </a>
</p>    

## Welcome

Welcome to my personal knowledge base - **KaaS** or Knowledge as a Service.

Inside is my personal, customized, digital knowledge note-base structured loosely as a *[[Zettelkasten]]*, a collection of interlinked *[[Atomic Notes]]* about anything that interests me.

Consider this my *Digital Garden*. It is a garden that needs to be maintained and cared for overtime to produce fruitful outcomes.

## Contents

- [[#Welcome|Welcome]]
- [[#Roadmap|Roadmap]]
- [[#About|About]]
	- [[#Publishing Setup|Publishing Setup]]
	- [[#Structure: Maps of Content|Structure: Maps of Content]]
- [[#Content|Content]]
	- [[#Code Snippets|Code Snippets]]
	- [[#Lists|Lists]]
	- [[#Tools|Tools]]

## Roadmap

Currently I am persistently perusing and curating my 10,000+ various notes houses across various platforms and locations: I would say I am about **18%** complete in this endeavor.

## About

Check out the `Meta/` Folder for details about this Vault and its setup:

- [[2-Areas/Meta/_README|Meta]]
    - [[About]]
    - [[Publish Workflow]] _(MkDocs version only, not Obsidian Publish)_
    - [[How I Take Notes]]
    - [[Vault Setup]]
    - [[Structure]]

The [[Changelog]] is also a good _Meta_ resource.

*Launch this vault directly via the **Obsidian URI Schema**: `obsidian://open?vault=KaaS`.*

### Publishing Setup

- This repository has three main branches: [main], [develop], and [gh-pages]. 
	- The [main] branch is a representation of the [develop] branch, but with all obsidian wiki-links converted to GitHub markdown links for display on GitHub as well as `_README.md` files converted to `README.md` for display on GitHub. 
	- The [develop] branch mirrors what I actually work with while inside the Obsidian application and gets sync'd automatically.
	- The [gh-pages] branch is deployed using [MkDocs]() and [GitHub Actions]().
	- Links are converted using the rust library [Obsidian-Export].
	- Links for deployment are converted using the [mkdocs-roamlinks]() plugin.

*Check out the various [GitHub Actions] utilized to enable this entire process.*

### Structure: Maps of Content

If this vault serves as my version of [[Building a Second Brain|a second brain]], then [[2-Areas/MOCs/_README|Maps of Content]] or _MOC's_ are the underlying [[Synapse|synapse]]'s connecting the neurotransmitters of the brain together to form a complex, structured system.

In other words MOC's serve as structural, index notes that list related [[Atomic Notes]] in a single location.

Utilize [[2-Areas/MOCs/_README|Maps of Content]] (MOCs) to navigate the vault efficiently: 

Some Maps of Content to consider are:

-   [[Actuarial Science]]
-   [[Development]]
	- [[Data Science]]
	- [[Data Engineering]]
	- [[Databases]]
	- [[Web Development]]
	- [[Software Development]]
	- [[R]] 
	- [[R Shiny]]
	- [[Python]]
	- [[PowerShell]]
- [[Productivity]]
- [[Personal Knowledge Management]]
- [[Mathematics and Statistics]]
- [[Finance]]

The others are still works in progress as I collect and curate more notes into the vault.

## Content

The vault has a variety of content including, but not limited to:

- Code Snippets
- Lists of Resources
- Checklists
- Slipbox Atomic Notes
- Guides and How-To's
- Lessons Learned
- Daily Notes
- Templates 
- Best Practices
- Documentation
- Tools by Category
- Mindsweeps 
- Goals and Learning Notes
- Project Support Notes
- Notes about People and Agendas
- Definitions
- Embedded Websites
- Kanban Boards
- MindMaps
- Highlights from a variety of sources
- Clippings from the Web
- Podcast Notes

And More!

### Code Snippets

See the [[2-Areas/Code/_README|Code]] folder's README for details on all of the code snippets included inside this vault. 

Currently I have code snippets for the following categories:

- [[2-Areas/Code/PowerShell/_README|PowerShell]] (Core)
- [[2-Areas/Code/Python/_README|Python]]
- [[2-Areas/Code/R/_README|R]]

- [[2-Areas/Code/SQL/_README|SQL Code]]
    - [[2-Areas/Code/SQL/General/_README|SQL - General]]
    - [[2-Areas/Code/SQL/PostgreSQL/_README|PostgreSQL SQL Code Snippets]] 
    - [[2-Areas/Code/SQL/SQL Server/_README|SQL Server]]
    - [[2-Areas/Code/SQL/BigQuery/_README|BigQuery]]

- [[2-Areas/Code/Windows/_README|Windows]]
    - [[2-Areas/Code/Windows/Miscellaneous/_README|Miscellaneous]]
    - [[2-Areas/Code/Windows/Batch/_README|Batch]]
    - [[2-Areas/Code/Windows/Windows CMD/_README|Windows Command Line]]
    - [[2-Areas/Code/Windows/Run/_README|Run]]
    - [[2-Areas/Code/Windows/Registry/_README|Registry]]
    - [[2-Areas/Code/Windows/Visual Basic/Excel VBA/_README|VBA]]
    - [[2-Areas/Code/Windows/Windows PowerShell/_README|Windows PowerShell]]

Plus:

- [[2-Areas/Code/Linux/Bash/_README|Bash]]
- [[2-Areas/Code/CSS/_README|CSS]]
- [[2-Areas/Code/GitHub Actions/_README|GitHub Actions]]
- [[2-Areas/Code/Javascript/_README|Javascript Code]]
- [[2-Areas/Code/Pandoc/_README|Pandoc]]

### Lists

Under [[2-Areas/Lists/_README|2-Areas/Lists]] I have curated lists for various topics you may find helpful:

[[2-Areas/Lists/_README|Lists]]:

- [[Actuarial Development Master Resource List]]
- [[Advanced Programming Concepts List]]
- [[AWS Components Master List]]
- [[CLI Tools List|Command Line Tools List]]
- [[Data Engineering Master List of Resources]]
- [[Database GUIs List]]
- [[Database Modeling Tools]]
- [[Excel Automation Resources]]
- [[Learn to Code Platforms Master List]]
- [[REST API Resources List]]
- [[Learn to Code Platforms Master List]]
- [[List of Python Flask Resources]]
- [[Obsidian Plugins List]]
- [[Online Developer Tools List]]
- [[Awesome R Package Development List]]
- [[Productivity Apps List]]
- [[R - Database Packages List]]
- [[Online Developer Tools List]]
- [[Ten Step GTD Setup List]]
- [[SQL Server List of Tools and Scripts]]
- [[R Shiny Packages List]]
- [[R Package Development Resources List]]
- [[R on the Web - List of Links]]

### Tools

See [[3-Resources/Tools/_README|Tools]] for a vast listing of useful tools I've come across split into categories:

- [[3-Resources/Tools/Developer Tools/_README|Developer Tools]]
    - [[3-Resources/Tools/Developer Tools/Cloud Services/_README|Cloud Services]]
        - [[3-Resources/Tools/Developer Tools/Cloud Services/AWS/_README|AWS]]
        - [[3-Resources/Tools/Developer Tools/Cloud Services/Azure/_README|Azure]]
        - [[3-Resources/Tools/Developer Tools/Cloud Services/GCP/_README|GCP]]
    - [[3-Resources/Tools/Developer Tools/Command Line Utilities/_README|Command Line Utilities]]
    - [[3-Resources/Tools/Developer Tools/Data Stack/_README|Data Stack]]
        - [[3-Resources/Tools/Developer Tools/Data Stack/Business Intelligence/_README|Business Intelligence]]
        - [[3-Resources/Tools/Developer Tools/Data Stack/Database GUI/_README|Database GUI]]
        - [[3-Resources/Tools/Developer Tools/Data Stack/Databases/_README|Databases]]
        - [[3-Resources/Tools/Developer Tools/Data Stack/Procedural Languages/_README|Procedural Languages]]
        - [[3-Resources/Tools/Developer Tools/Data Stack/Miscellaneous/_README|Miscellaneous]]
    - [[3-Resources/Tools/Developer Tools/Docker/_README|Docker]]
    - [[3-Resources/Tools/Developer Tools/Documentation/_README|Documentation]]
        - [[3-Resources/Tools/Developer Tools/Documentation/Static Site Generators/_README|Static Site Generators]]
        - [[3-Resources/Tools/Developer Tools/Documentation/Text Editors/_README|Text Editors]]
        - [[3-Resources/Tools/Developer Tools/Documentation/Utility/_README|Utility]]
    - [[3-Resources/Tools/Developer Tools/IDE/_README|IDE]]
    - [[3-Resources/Tools/Developer Tools/Languages/_README|Languages]]
        - [[3-Resources/Tools/Developer Tools/Languages/JavaScript/_README|JavaScript]]
        - [[3-Resources/Tools/Developer Tools/Languages/PowerShell]]
        - [[3-Resources/Tools/Developer Tools/Languages/Python/_README|Python]]
        - [[3-Resources/Tools/Developer Tools/Languages/R/_README|R]]
    - [[3-Resources/Tools/Developer Tools/Linux/_README|Linux]]
    - [[3-Resources/Tools/Developer Tools/Package Managers/_README|Package Managers]]
    - [[3-Resources/Tools/Developer Tools/Shell/_README|Shell]]
    - [[3-Resources/Tools/Developer Tools/Terminal/_README|Terminal]]
    - [[3-Resources/Tools/Developer Tools/Version Control/_README|Version Control]]
    - [[3-Resources/Tools/Developer Tools/Websites and Online Tools/_README|Websites and Online Tools]]

And many others!

***

<center><img src="https://i.imgur.com/j70aDp9.png" height="75%" width="75%"/></center>

***

[KaaS - Obsidian Publish (publish.obsidian.md/kaas/)]: https://publish.obsidian.md/kaas/README
[KaaS - GitHub Pages (kaas.jimbrig.com)]: http://kaas.jimbrig.com/
[main]: https://github.com/jimbrig/KaaS-New/tree/main
[develop]: https://github.com/jimbrig/KaaS-New/tree/develop
[gh-pages]: https://github.com/jimbrig/KaaS-New/tree/gh-pages
[Obsidian-Export]: https://github.com/zoni/obsidian-export
[GitHub Actions]: https://github.com/jimbrig/KaaS-New/tree/main/.github/workflows
