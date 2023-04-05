# Organize

![Pasted image 20220812155046.png](_assets/Pasted%20image%2020220812155046.png)

 > 
 > `organize` is a command line, open-source alternative to apps like Hazel (macOS) or *File Juggler* (*Windows*).

## Contents

* [Installation](organize.md#installation)
* [Features](organize.md#features)
* [Create a Rule](organize.md#create-a-rule)
* [Example Rules](organize.md#example-rules)
* [Command Line Interface](organize.md#command-line-interface)
* [My Configuration File](organize.md#my-configuration-file)
* [Appendix: Links](organize.md#appendix-links)

Links: 

* Github Repository: <https://github.com/tfeldmann/organize>
* Documentation: <https://organize.readthedocs.io/en/latest/>

## Installation

Install through [pip](../Package%20Managers/Python%20-%20pip.md):

````bash
pip3 install -U organize-tool
````

If you want the text extraction capabilities, install with `textract` like this:

````bash
pip3 install -U "organize-tool[textract]"
````

This command can also be used to update to the newest version. Now you can run `organize --help` to check if the installation was successful.

## Features

Some highlights include:

* Free and open source. Please donate if it is useful for you!
* Works on macOS, Windows and Linux
* Safe moving, renaming, copying of files and folders with conflict resolution options
* Fast duplicate file detection
* Exif tags extraction
* Categorization via text extracted from PDF, DOCX and many more
* Supports remote file locations like FTP, WebDAV, S3 Buckets, SSH and many more
* Powerful template engine
* Inline python and shell commands as filters and actions for maximum flexibility
* Everything can be simulated before touching your files.

## Create a Rule

In your shell, run `organize edit` to edit the configuration:

````yaml
rules:
  - name: "Find PDFs"
    locations:
      - ~/Downloads
    subfolders: true
    filters:
      - extension: pdf
    actions:
      - echo: "Found PDF!"
````

 > 
 > If you have problems editing the configuration you can run `organize reveal` to reveal the configuration folder in your file manager. You can then edit the `config.yaml` in your favourite editor.

save your config file and run:

````sh
organize run
````

You will see a list of all `.pdf` files you have in your downloads folder (+ subfolders). For now we only show the text `Found PDF!` for each file, but this will change soon... (If it shows `Nothing to do` you simply don't have any pdfs in your downloads folder).

Run `organize edit` again and add a `move`-action to your rule:

````yml
actions:
  - echo: "Found PDF!"
  - move: ~/Documents/PDFs/
````

Now run `organize sim` to see what would happen without touching your files.

You will see that your pdf-files would be moved over to your `Documents/PDFs` folder.

Congratulations, you just automated your first task. You can now run `organize run` whenever you like and all your pdfs are a bit more organized. It's that easy.

 > 
 > There is so much more. You want to rename / copy files, run custom shell- or python scripts, match names with regular expressions or use placeholder variables? organize has you covered. Have a look at the advanced usage example below!

## Example Rules

Here are some examples of simple organization and cleanup rules. Modify to your needs!

Move all invoices, orders or purchase documents into your documents folder:

````yaml
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
````

Recursively delete all empty directories:

````yaml
rules:
  - name: "Recursively delete all empty directories"
    locations:
      - path: ~/Downloads
    subfolders: true
    filters:
      - empty
    actions:
      - delete
````

You'll find many more examples in the [full documentation](https://tfeldmann.github.io/organize).

## Command Line Interface

````sh
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
````

## My Configuration File

````yaml
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
````

---

## Appendix: Links

* *Tools*
* [Log - New Discoveries](../../../../2-Areas/Logs/Log%20-%20New%20Discoveries.md)
* *Command Line Utilities*
* [CLI Tools List](../../../../2-Areas/Lists/CLI%20Tools%20List.md)
* [Python](../../../../2-Areas/Code/Python/Python.md)
* [Development](../../../../2-Areas/MOCs/Development.md)

*Backlinks:*

````dataview
list from [[organize]] AND -"Changelog"
````
