# obsidian-blog

*Source: [A/obsidian-blog: Work-in-Progress static site/blog generator for obsidian.md (github.com)](https://github.com/A/obsidian-blog)*

## Overview

Experiments around static site generation for obsidian markdown.

The idea is to create a simple blog generated from obsidian [Map Of Content](https://www.youtube.com/watch?v=7GqQKCT0PZ4) notes, that's I believe based on the [original zettelkasten benefit](https://en.wikipedia.org/wiki/Niklas_Luhmann#Note-taking_system_(Zettelkasten)).

### Features

* Yet another static site generator for obsidian
* Built to use with git, github pages and action.
* Uses handlebars template engine
* Supports `--watch` and `--server` modes for local writing
* Recursively parses `[[includes]]` and has cycles detection
* Automatically copies included local images into the build
* Supports `--draft` mode to work unpublished files locally
* Privacy. Notes can be published only with explicit `published: True` annotation.
* Fluent title detection from `[[note | alt title]]`, frontmatter `title` attribute, or a filename.
* Render notes as links, in case they're included in the middle of the paragraph and have `link` frontmatter attribute.
* Supports filename delimeters: `Topic - Category - Note` becomes just `Note`

### Installation

`obsidian-blog` is a [Python Package](../../../Developer%20Tools/Languages/Python/Python%20Packages/Python%20Packages.md) and therefore should be installed via [pip](../../../Developer%20Tools/Package%20Managers/Python%20-%20pip.md):

````bash
pip install obsidian-blog
````

### Usage

````powershell
obsidian-blog

Static site generator for obsidian.md notes.

Usage:
  obsidian-blog [-w] [-s] [--port <number>] [--title <string>] [--posts_dir <directory>] [--pages_dir <directory>]

Options:
  -h --help                     Show this screen.
  -w --watch                    Enable watcher
  -s --serve                    Enable web-server
  -p --port=<number>            Web-server port [default: 4200]

  --title=<string>              Blog title [default: My Blog]
  --posts_dir=<directory>       Posts directory to parse [default: Posts]
  --pages_dir=<directory>       Pages directory to parse [default: Pages]

  --version             Show version
````

### Example

See [Obsidian Blog Theme](https://github.com/A/obsidian-blog-theme/)

### Environment

`obsidian-blog` expects you have an `.env` file. Supported variables and their default values can be found in `src/dataclasses/config_data`.

### Blog files

````bash
notes ❯ tree .blog -a -I .git
├── .blog
│   ├── _assets # static files to be copied into .build
│   │   └── styles.css
│   └── _layouts # layout files
│       └── main.hbs # name of layout, can be selected with `layout` frontmatter attribute. Default: `main`
├── .build # build directory created by run `obsidian-blog` to be deployed
├── .env # environment variables
├── Pages # Pages directory, contains handlebars and markdown files
└── Posts # Posts directory contains obsidian markdown files (which are anyway processed via handlebars)
````

### Posts

Posts are obsidian markdown files with includes, images, and anything you usually have in your obsidian notes. Posts are post-processed by handlebars, so you can use it if you need (but not sure if it's a good idea tho).

````yaml
---
title: My awesome post
date: 2021-01-01 (used for sorting)
published: True # privacy, can't be skipped
layout: main (default_layout is used if it skipped)
---
````

### Pages

Pages are handlebars templates (or just markdown files), rendered via global (`pages` and `posts` lists) and local (`self` points to the entity being rendered) contexts.

### Assets

Assets are divided into 2 types:

* `.blog/_assets` copied during the build unconditionally
* Images included either with markdown reference or incline images, or by obsidian `![[]]` syntax. This ones are detected and copied during the build.

### Deployment

So far I'm using github actions to deploy my stuff to [my blog](https://anto.sh/).

### Feedback and things

Just text me in [telegram](https://t.me/a_shuvalov) or file an issue. I'd be happy to know if you want to use it.

### Alternatives

* [Obsidian Export](https://crates.io/crates/obsidian-export) - cli to render obsidian notes into markdown written in Rust (See [obsidian-export](obsidian-export.md))

---

## Appendix: Links

* [Tools](../../../Tools.md)
* [Obsidian](../Obsidian.md)
* [CLI Tools List](../../../../../2-Areas/Lists/CLI%20Tools%20List.md)

*Backlinks:*

````dataview
list from [[obsidian-blog]] AND -"Changelog"
````
