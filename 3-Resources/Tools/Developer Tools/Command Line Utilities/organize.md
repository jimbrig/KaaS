---
Date: 2022-08-12
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Tool/CLI", "#Type/Tool/Documentation", "#Topic/Dev/CLI", "#Topic/Dev/Python"]
Alias: ["organize CLI"]
---

# Organize 

![[Pasted image 20220812155046.png]]

> `organize` is a command line, open-source alternative to apps like Hazel (macOS) or [[File Juggler]] ([[2-Areas/Code/Windows/_README|Windows]]).

## Contents

- [[#Installation|Installation]]
- [[#Features|Features]]
- [[#Create a Rule|Create a Rule]]
- [[#Example Rules|Example Rules]]
- [[#Command Line Interface|Command Line Interface]]
- [[#My Configuration File|My Configuration File]]
- [[#Appendix: Links|Appendix: Links]]


Links: 
- Github Repository: <https://github.com/tfeldmann/organize>
- Documentation: <https://organize.readthedocs.io/en/latest/>

## Installation

Install through [[Python - pip|pip]]:

```bash
pip3 install -U organize-tool
```

If you want the text extraction capabilities, install with `textract` like this:

```bash
pip3 install -U "organize-tool[textract]"
```

This command can also be used to update to the newest version. Now you can run `organize --help` to check if the installation was successful.

## Features

Some highlights include:

-   Free and open source. Please donate if it is useful for you!
-   Works on macOS, Windows and Linux
-   Safe moving, renaming, copying of files and folders with conflict resolution options
-   Fast duplicate file detection
-   Exif tags extraction
-   Categorization via text extracted from PDF, DOCX and many more
-   Supports remote file locations like FTP, WebDAV, S3 Buckets, SSH and many more
-   Powerful template engine
-   Inline python and shell commands as filters and actions for maximum flexibility
-   Everything can be simulated before touching your files.

## Create a Rule

In your shell, run `organize edit` to edit the configuration:

```yaml
rules:
  - name: "Find PDFs"
    locations:
      - ~/Downloads
    subfolders: true
    filters:
      - extension: pdf
    actions:
      - echo: "Found PDF!"
```

> If you have problems editing the configuration you can run `organize reveal` to reveal the configuration folder in your file manager. You can then edit the `config.yaml` in your favourite editor.

save your config file and run:

```sh
organize run
```

You will see a list of all `.pdf` files you have in your downloads folder (+ subfolders). For now we only show the text `Found PDF!` for each file, but this will change soon... (If it shows `Nothing to do` you simply don't have any pdfs in your downloads folder).

Run `organize edit` again and add a `move`-action to your rule:

```yml
actions:
  - echo: "Found PDF!"
  - move: ~/Documents/PDFs/
```

Now run `organize sim` to see what would happen without touching your files.

You will see that your pdf-files would be moved over to your `Documents/PDFs` folder.

Congratulations, you just automated your first task. You can now run `organize run` whenever you like and all your pdfs are a bit more organized. It's that easy.

> There is so much more. You want to rename / copy files, run custom shell- or python scripts, match names with regular expressions or use placeholder variables? organize has you covered. Have a look at the advanced usage example below!

## Example Rules

Here are some examples of simple organization and cleanup rules. Modify to your needs!

Move all invoices, orders or purchase documents into your documents folder:

```yaml
rules:
  - name: "Sort my invoices and receipts"
    locations: ~/Downloads
    subfolders: true
    filters:
      - extension: pdf
      - name:
          contains:
            - Invoice
            - Order
            - Purchase
          case_sensitive: false
    actions:
      - move: ~/Documents/Shopping/
```

Recursively delete all empty directories:

```yaml
rules:
  - name: "Recursively delete all empty directories"
    locations:
      - path: ~/Downloads
    subfolders: true
    filters:
      - empty
    actions:
      - delete
```

You'll find many more examples in the [full documentation](https://tfeldmann.github.io/organize).

## Command Line Interface

```sh
Usage: organize [OPTIONS] COMMAND [ARGS]...

  organize

  The file management automation tool.

Options:
  --version   Show the version and exit.
  -h, --help  Show this message and exit.

Commands:
  run     Organizes your files according to your rules.
  sim     Simulates a run (does not touch your files).
  edit    Edit the rules.
  check   Checks whether a given config file is valid.
  reveal  Reveals the default config file.
  schema  Prints the json schema for config files.
  docs    Opens the documentation.
```

## My Configuration File

```yaml
# organize configuration file
# https://organize.readthedocs.io

rules:
  - name: "Recursively delete all empty directories"
    locations:
      - path: ~/Downloads
    subfolders: true
    filters:
      - empty
    actions:
      - delete
    tags:
      - cleanup

  - name: "Clean up %TEMP% folders"
    locations:
      - path: ~/AppData/Local/Temp
        ignore_errors: true
      - path: C:/Windows/Temp
        ignore_errors: true
    subfolders: true
    actions:
      - delete
    tags:
      - cleanup
```

***

## Appendix: Links

- [[3-Resources/Tools/_README|Tools]]
- [[Log - New Discoveries]]
- [[3-Resources/Tools/Developer Tools/Command Line Utilities/_README|Command Line Utilities]]
- [[CLI Tools List]]
- [[Python]]
- [[Development]]

*Backlinks:*

```dataview
list from [[organize]] AND -"Changelog"
```