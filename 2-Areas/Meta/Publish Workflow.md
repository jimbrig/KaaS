# Publish Workflow

* This repository has three main branches: [main](https://github.com/jimbrig/KaaS-New/tree/main), [develop](https://github.com/jimbrig/KaaS-New/tree/develop), and [gh-pages](https://github.com/jimbrig/KaaS-New/tree/gh-pages). 
  * The [main](https://github.com/jimbrig/KaaS-New/tree/main) branch is a representation of the [develop](https://github.com/jimbrig/KaaS-New/tree/develop) branch, but with all obsidian wiki-links converted to GitHub markdown links for display on GitHub as well as `_README.md` files converted to `README.md` for display on GitHub. 
  * The [develop](https://github.com/jimbrig/KaaS-New/tree/develop) branch mirrors what I actually work with while inside the Obsidian application and gets sync'd automatically.
  * The [gh-pages](https://github.com/jimbrig/KaaS-New/tree/gh-pages) branch is deployed using [MkDocs]() and [GitHub Actions]().
  * Links are converted using the rust library [Obsidian-Export](https://github.com/zoni/obsidian-export).
  * Links for deployment are converted using the [mkdocs-roamlinks]() plugin.

*Check out the various [GitHub Actions](https://github.com/jimbrig/KaaS-New/tree/main/.github/workflows) utilized to enable this entire process.*

*NOTE: The `.obsidian` directory has been git-ignore'd due to continuously having to deal with git and sync issues between vaults in different locations (i.e. multiple laptops, mobile, etc.*

---

*Backlinks:*

````dataview
list from [[Publish Workflow]] AND -"Changelog"
````
