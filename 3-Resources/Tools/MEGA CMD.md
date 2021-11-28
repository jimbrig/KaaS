---
Date: 2021-11-28
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Tool"]
Alias: ["MEGA CMD"]
---

# MEGA CMD

*Source: [MEGAcmd/UserGuide.md · meganz/MEGAcmd](https://github.com/meganz/MEGAcmd/blob/master/UserGuide.md)*

This document relates to MEGAcmd version 0.9.9. It contains introductory information and the [Command Summary](https://github.com/meganz/MEGAcmd/blob/master/UserGuide.md#command-summary), with links to detailed command descriptions.

### What is it

A command line tool to work with your MEGA account and files. The intent is to offer all the MEGA account functionality via command line. You can run it in [interactive](https://github.com/meganz/MEGAcmd/blob/master/UserGuide.md#interactive) mode where it processes all commands directly, or you can run its [scriptable](https://github.com/meganz/MEGAcmd/blob/master/UserGuide.md#scriptable) commands from your favourite Linux or Mac shell such as bash, or you can even run its commands in a Windows command prompt. And of course you can write scripts using those scriptable commands.

Here is an example of downloading a file using MEGAcmd. In this case we are downloading a file specified by a public link, which does not require being logged in:

```bash
mega-get https://mega.nz/#F!ABcD1E2F!gHiJ23k-LMno45PqrSTUvw /path/to/local/folder 
```

And here is an example of uploading a file using MEGAcmd, and making a link available to share it, that will expire after 10 minutes.

```bash
mega-put /path/to/my/temporary_resource /exportedstuff/
mega-export -a  /exportedstuff/temporary_resource --expire=10M | awk '{print $4}'
```
***

## Appendix: Related

- [[Tools]]

*Backlinks:*

```dataview
list from [[Tool-Template]] AND -"Changelog"
```