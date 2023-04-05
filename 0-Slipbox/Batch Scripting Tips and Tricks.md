# Batch Scripting Tips and Tricks

Batch Scripts (i.e. `.bat`) represents a collection [Microsoft DOS](../3-Resources/Tools/Developer%20Tools/Shell/Microsoft%20DOS.md) and [Windows Command Line](../3-Resources/Tools/Developer%20Tools/Shell/Microsoft%20DOS.md) commands used on a computer running a *Windows* Operating System.

## Contents

* [Commands and Symbols](Batch%20Scripting%20Tips%20and%20Tricks.md#commands-and-symbols)
  * \[\[\#`@`\|`@`\]\]
  * \[\[\#`%1`\|`%1`\]\]
  * \[\[\#`::`\|`::`\]\]
  * \[\[\#`:LABEL`\|`:LABEL`\]\]
  * \[\[\#`CHOICE` and `SET`\|`CHOICE` and `SET`\]\]
  * \[\[\#`CLS`\|`CLS`\]\]
  * \[\[\#`ECHO`\|`ECHO`\]\]
  * \[\[\#`EXIT`\|`EXIT`\]\]
  * \[\[\#`GOTO`\|`GOTO`\]\]
  * \[\[\#`IF`\|`IF`\]\]
  * \[\[\#`PAUSE`\|`PAUSE`\]\]
  * \[\[\#`REM`\|`REM`\]\]
  * \[\[\#`SHIFT`\|`SHIFT`\]\]
  * \[\[\#`START`\|`START`\]\]
* [Appendix: Links](Batch%20Scripting%20Tips%20and%20Tricks.md#appendix-links)

## Commands and Symbols

### `@`

The "at" symbol `@` does not echo back text after the symbol. `@` is most often used as `@ECHO OFF` to only show the output of the command.

### `%1`

`%1`, or `%` followed by and number represents *variables* or *parameters* sent to batch file. For example, let's say we have a file named `hello.bat`:

````batch
ECHO Hello %1
````

If I run:

````powershell
.\hello.bat Jimmy
````

(or just `hello Jimmy`) from the command line the resulting output display will be `Hellow Jimmy` passing "Jimmy" to `%1`.

### `::`

Double colons in front of a line **remarks** that line in the batch file, or in other words, ensures that line is never displayed when the batch file is executed. Unlike `REM`, this line is not shown regardless if `ECHO` if off or not.

### `:LABEL`

By adding a colon in front of a word you can create a category, more commonly known as a *label*. A label allows you to skip to certain sections of a batch file using `GOTO`.

### `CHOICE` and `SET`

The choice and set commands allow you to have options in your batch file. Further information about each of these commands is on the [choice](https://www.computerhope.com/choicehl.htm) and [set](https://www.computerhope.com/sethlp.htm) pages.

* [How to use choice and set in a batch file.](https://www.computerhope.com/issues/ch001674.htm)

### `CLS`

Like the DOS command, cls would clear your screen. Run the [cls](https://www.computerhope.com/clshlp.htm) command at the top of your batch file to clear any previous commands or output. This action makes the batch file output easier to find and read.

### `ECHO`

Echo a message in the batch file. Such as `ECHO Hello World` prints *Hello World* on the screen when executed.

### `EXIT`

Exits out of the DOS window if the batch file is running from Windows. See the [exit](https://www.computerhope.com/exithlp.htm) command page for further information on this command.

### `GOTO`

Jumps to a label or section of a batch file. The goto function makes it easier to jump back to the start of a batch file if a condition is met, or an error occurs.

* [How to use choice and set in a batch file.](https://www.computerhope.com/issues/ch001674.htm)

### `IF`

Used to check for a certain condition if the condition exists. If that condition exists, it performs that function. See the [if command](https://www.computerhope.com/if.htm) for further information on this command.

### `PAUSE`

Prompt the user to press any key to continue.

### `REM`

One of two ways of adding [remarks](https://www.computerhope.com/jargon/r/rem.htm) into the batch file without displaying or executing that line when the batch file is run.

### `SHIFT`

The shift command changes the position of replaceable parameters in a batch program. See the [shift](https://www.computerhope.com/shift.htm) page for further information on this command.

### `START`

Used to open Windows programs. For example, **START C:\WINDOW\CALC** would run the Windows Calculator. The [start](https://www.computerhope.com/starthlp.htm) command can also be used to start any file Windows recognizes. For example, you could start a movie or audio file in a batch file to start your default player for that file.

---

## Appendix: Links

* *Windows*
* [Microsoft DOS](../3-Resources/Tools/Developer%20Tools/Shell/Microsoft%20DOS.md)
* [Add a GUI to Batch File Scripts on Windows](../2-Areas/Guides/Add%20a%20GUI%20to%20Batch%20File%20Scripts%20on%20Windows.md)
* [2-Areas/MOCs/PowerShell](../2-Areas/MOCs/PowerShell.md)
* [Development](../2-Areas/MOCs/Development.md)
* [CLI Tools List](../2-Areas/Lists/CLI%20Tools%20List.md)

*Backlinks:*

````dataview
list from [[Batch Scripts]] AND -"Changelog"
````
