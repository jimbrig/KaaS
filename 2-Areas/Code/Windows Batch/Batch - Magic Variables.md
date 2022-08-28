---
Date: 2022-03-07
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Code/Batch", "#Topic/Dev/Windows"]
Alias: ["Batch - Magic Variables"]
---

# Batch - Magic Variables

*Source: [What does %~d0 mean in a Windows batch file? (newbedev.com)](https://newbedev.com/what-does-d0-mean-in-a-windows-batch-file#:~:text=What%20does%20%25~d0%20mean%20in%20a%20Windows%20batch,after%2C%20%252%20is%20the%20second%20and%20so%20on.)*

## Contents

- [[#Arguments|Arguments]]
- [[#Paths|Paths]]
- [[#File Meta-Data|File Meta-Data]]
- [[#Enhanced Variable Substitutions|Enhanced Variable Substitutions]]
- [[#Help|Help]]
- [[#Appendix: Links|Appendix: Links]]


## Arguments

- `%0` - path to the batch-file itself
- `%1` - first argument
- `%2` - second argument
- `%n` - nth argument and so on..

## Paths

Additional syntax to extract parts of the path:

- `~d` - is drive
- `~p` - is the path (without drive)
- `~n` - file name

These can be combined like so:

`~dp`: drive + path

## File Meta-Data

Metadata about the file:

- `~t` - timestamp
- `~z` - size

## Enhanced Variable Substitutions

- `%~d0` - `%` and `0` mean the path to the batch file; `~d` in-between means drive ---> therefore `%~d0` is the folder in which the executing batch script resides.
- `%~s0` - 

## Help

*NOTE: Call `FOR /?` for detailed help on various substitutions:*

```cmd
>FOR /?

Runs a specified command for each file in a set of files.

FOR %variable IN (set) DO command [command-parameters]

  %variable  Specifies a single letter replaceable parameter.
  (set)      Specifies a set of one or more files.  Wildcards may be used.
  command    Specifies the command to carry out for each file.
  command-parameters
             Specifies parameters or switches for the specified command.

To use the FOR command in a batch program, specify %%variable instead
of %variable.  Variable names are case sensitive, so %i is different
from %I.

If Command Extensions are enabled, the following additional
forms of the FOR command are supported:

FOR /D %variable IN (set) DO command [command-parameters]

    If set contains wildcards, then specifies to match against directory
    names instead of file names.

FOR /R [[drive:]path] %variable IN (set) DO command [command-parameters]

    Walks the directory tree rooted at [drive:]path, executing the FOR
    statement in each directory of the tree.  If no directory
    specification is specified after /R then the current directory is
    assumed.  If set is just a single period (.) character then it
    will just enumerate the directory tree.

FOR /L %variable IN (start,step,end) DO command [command-parameters]

    The set is a sequence of numbers from start to end, by step amount.
    So (1,1,5) would generate the sequence 1 2 3 4 5 and (5,-1,1) would
    generate the sequence (5 4 3 2 1)

FOR /F ["options"] %variable IN (file-set) DO command [command-parameters]
FOR /F ["options"] %variable IN ("string") DO command [command-parameters]
FOR /F ["options"] %variable IN ('command') DO command [command-parameters]

    or, if usebackq option present:

FOR /F ["options"] %variable IN (file-set) DO command [command-parameters]
FOR /F ["options"] %variable IN ('string') DO command [command-parameters]
FOR /F ["options"] %variable IN (`command`) DO command [command-parameters]

    file-set is one or more file names.  Each file is opened, read
    and processed before going on to the next file in file-set.
    Processing consists of reading in the file, breaking it up into
    individual lines of text and then parsing each line into zero or
    more tokens.  The body of the for loop is then called with the
    variable value(s) set to the found token string(s).  By default, /F
    passes the first blank separated token from each line of each file.
    Blank lines are skipped.  You can override the default parsing
    behavior by specifying the optional "options" parameter.  This
    is a quoted string which contains one or more keywords to specify
    different parsing options.  The keywords are:

        eol=c           - specifies an end of line comment character
                          (just one)
        skip=n          - specifies the number of lines to skip at the
                          beginning of the file.
        delims=xxx      - specifies a delimiter set.  This replaces the
                          default delimiter set of space and tab.
        tokens=x,y,m-n  - specifies which tokens from each line are to
                          be passed to the for body for each iteration.
                          This will cause additional variable names to
                          be allocated.  The m-n form is a range,
                          specifying the mth through the nth tokens.  If
                          the last character in the tokens= string is an
                          asterisk, then an additional variable is
                          allocated and receives the remaining text on
                          the line after the last token parsed.
        usebackq        - specifies that the new semantics are in force,
                          where a back quoted string is executed as a
                          command and a single quoted string is a
                          literal string command and allows the use of
                          double quotes to quote file names in
                          file-set.

    Some examples might help:

FOR /F "eol=; tokens=2,3* delims=, " %i in (myfile.txt) do @echo %i %j %k

    would parse each line in myfile.txt, ignoring lines that begin with
    a semicolon, passing the 2nd and 3rd token from each line to the for
    body, with tokens delimited by commas and/or spaces.  Notice the for
    body statements reference %i to get the 2nd token, %j to get the
    3rd token, and %k to get all remaining tokens after the 3rd.  For
    file names that contain spaces, you need to quote the filenames with
    double quotes.  In order to use double quotes in this manner, you also
    need to use the usebackq option, otherwise the double quotes will be
    interpreted as defining a literal string to parse.

    %i is explicitly declared in the for statement and the %j and %k
    are implicitly declared via the tokens= option.  You can specify up
    to 26 tokens via the tokens= line, provided it does not cause an
    attempt to declare a variable higher than the letter 'z' or 'Z'.
    Remember, FOR variables are single-letter, case sensitive, global,
    and you can't have more than 52 total active at any one time.

    You can also use the FOR /F parsing logic on an immediate string, by
    making the file-set between the parenthesis a quoted string,
    using single quote characters.  It will be treated as a single line
    of input from a file and parsed.

    Finally, you can use the FOR /F command to parse the output of a
    command.  You do this by making the file-set between the
    parenthesis a back quoted string.  It will be treated as a command
    line, which is passed to a child CMD.EXE and the output is captured
    into memory and parsed as if it was a file.  So the following
    example:

      FOR /F "usebackq delims==" %i IN (`set`) DO @echo %i

    would enumerate the environment variable names in the current
    environment.

In addition, substitution of FOR variable references has been enhanced.
You can now use the following optional syntax:

    %~I         - expands %I removing any surrounding quotes (")
    %~fI        - expands %I to a fully qualified path name
    %~dI        - expands %I to a drive letter only
    %~pI        - expands %I to a path only
    %~nI        - expands %I to a file name only
    %~xI        - expands %I to a file extension only
    %~sI        - expanded path contains short names only
    %~aI        - expands %I to file attributes of file
    %~tI        - expands %I to date/time of file
    %~zI        - expands %I to size of file
    %~$PATH:I   - searches the directories listed in the PATH
                   environment variable and expands %I to the
                   fully qualified name of the first one found.
                   If the environment variable name is not
                   defined or the file is not found by the
                   search, then this modifier expands to the
                   empty string

The modifiers can be combined to get compound results:

    %~dpI       - expands %I to a drive letter and path only
    %~nxI       - expands %I to a file name and extension only
    %~fsI       - expands %I to a full path name with short names only
    %~dp$PATH:I - searches the directories listed in the PATH
                   environment variable for %I and expands to the
                   drive letter and path of the first one found.
    %~ftzaI     - expands %I to a DIR like output line

In the above examples %I and PATH can be replaced by other valid
values.  The %~ syntax is terminated by a valid FOR variable name.
Picking upper case variable names like %I makes it more readable and
avoids confusion with the modifiers, which are not case sensitive.
```




***

## Appendix: Links

- [[Code]]
- [[Development]]

*Backlinks:*

```dataview
list from [[Batch - Magic Variables]] AND -"Changelog"
```