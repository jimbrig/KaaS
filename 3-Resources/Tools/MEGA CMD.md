---
Date: 2021-11-28
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Tool"]
Alias: ["MEGA CMD"]
---

# MEGA CMD

*Source: [MEGAcmd/UserGuide.md · meganz/MEGAcmd](https://github.com/meganz/MEGAcmd/blob/master/UserGuide.md)*

This document relates to MEGAcmd version 0.9.9. It contains introductory information and the [Command Summary](https://github.com/meganz/MEGAcmd/blob/master/UserGuide.md#command-summary), with links to detailed command descriptions.

## Contents

- [[#What is it|What is it]]
- [[#Where can you get it|Where can you get it]]
- [[#What can you do with it|What can you do with it]]
- [[#Terminology and Descriptions|Terminology and Descriptions]]
- [[#Interactive|Interactive]]
- [[#Scriptable|Scriptable]]
- [[#Contact|Contact]]
- [[#Remote Path|Remote Path]]
- [[#Local Path|Local Path]]
- [[#Session|Session]]
- [[#Local Cache|Local Cache]]
- [[#Synchronization configurations|Synchronization configurations]]
- [[#Backup configurations|Backup configurations]]
- [[#WebDAV configurations|WebDAV configurations]]
- [[#Linux|Linux]]
- [[#Macintosh|Macintosh]]
- [[#Windows|Windows]]
- [[#Command Summary|Command Summary]]
- [[#Account / Contacts|Account / Contacts]]
- [[#Login / Logout|Login / Logout]]
- [[#Browse|Browse]]
- [[#Moving/Copying Files|Moving/Copying Files]]
- [[#Sharing (your own files, of course, without infringing any copyright)|Sharing (your own files, of course, without infringing any copyright)]]
- [[#Misc|Misc]]
- [[#Appendix: Related|Appendix: Related]]


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

And here is an example of the power of using [scriptable](https://github.com/meganz/MEGAcmd/blob/master/UserGuide.md#scriptable) MEGAcmd commands in bash. In this case we are going to share some promotional videos previously uploaded to MEGA:

```
for i in $(mega-find /enterprise/video/promotional2015/may --pattern="*mpeg")
do 
mega-export -a $i | awk '{print $4}'; 
done
```

In addition to running commands on request, MEGAcmd can also be configured to [synchronise](https://github.com/meganz/MEGAcmd/blob/master/UserGuide.md#synchronisation-configurations) folders between your local device and your MEGA account, or perform regular [backups](https://github.com/meganz/MEGAcmd/blob/master/UserGuide.md#backup-configurations) from your device to your MEGA account.

In order to enable synchronisation and backup features, and for efficiency running commands, MEGAcmd runs a server process in the background which the MEGAcmd shell or the script commands forward requests to. The server keeps running in the background until it is told to close with the [`quit`](https://github.com/meganz/MEGAcmd/blob/master/UserGuide.md#quit) command. If you want it to keep running when you quit the interactive shell (to keep sync and backup runnign for example), use `quit --only-shell`.

Working with your MEGA account requires signing in with your email and password using the [`login`](https://github.com/meganz/MEGAcmd/blob/master/UserGuide.md#login) command, though you can download public links or upload to public folders without logging in. Logging in with your username and password starts a [Session](https://github.com/meganz/MEGAcmd/blob/master/UserGuide.md#session), and causes some of your account such as the folder structure to be downloaded to your [Local Cache](https://github.com/meganz/MEGAcmd/blob/master/UserGuide.md#local-cache).

### Where can you get it

For Linux, Mac, or Windows: Download it from the MEGA.nz website: [https://mega.nz/cmd](https://mega.nz/cmd)

### What can you do with it

The major features are

-   Move files around inside your MEGA account or between MEGA and your PC using command line tools.
-   Use those same commands in scripts to manage your files.
-   Set up synchronization or a backup schedule between a folder on your machine, and a folder on your MEGA account. (use the [`sync`](https://github.com/meganz/MEGAcmd/blob/master/UserGuide.md#sync) or [`backup`](https://github.com/meganz/MEGAcmd/blob/master/UserGuide.md#backup) commands)
-   Set up WebDAV access to files in your MEGA account (use the [`webdav`](https://github.com/meganz/MEGAcmd/blob/master/UserGuide.md#webdav) command)

See our Help Center pages for the basics of getting started, and friendly examples of common usages with plenty of pictures: [https://mega.nz/help](https://mega.nz/help)


## Terminology and Descriptions

### Interactive

Interactive refers to running the MEGAcmd shell which only processes MEGA commands. You invoke commands by typing and pressing Enter. MEGAcmd shell provides a lot of feedback about what it's doing. You can start the MEGAcmd shell with `mega-cmd` (or `MEGAcmd` on Windows). You can then issue commands like `ls` directly:

`ls /my/account/folder`

or you can get a list of available commands with:

`help`

or you can get detailed information about any particular command by using the `--help` flag with that command:

`ls --help`

Autocompletion (pressing tab to fill in the remainder of a command) is available in interactive mode.

### Scriptable

Scriptable refers to running the MEGAcmd commands from a shell such as bash or the windows [[3-Resources/Tools/PowerShell]]. If the PATH to the MEGAcmd commands are not yet on the PATH in that shell, you'll need to add it. You can then issue commands like `ls` by prefixing them with the `mega-` prefix:

`mega-ls /my/account/folder`

or you can get a list of available commands with:

`mega-help`

or you can get detailed information about any particular command by using the `--help` flag with that command:

`mega-ls --help`

Scriptable commands can of course be used in scripts to achieve a lot in a short space of time, using loops or preparing all the desired commands ahead of time. If you are using bash as your shell, the MEGAcmd commands support auto-completion.

### Contact

A contact is someone (identified by their email address) that also has a MEGA account, who you can share files or folders with, and can chat with on MEGAchat.

### Remote Path

This refers to a file or a folder stored in your MEGA account, or a publicly available file or folder in the MEGA cloud. Remote paths always use the '/' character as the separator between folder and file elements.

Some MEGAcmd commands allow the use of regular expressions in remote paths. You can check if the command supports those by using the `--help` flag with the command. If you use these in the [scriptable](https://github.com/meganz/MEGAcmd/blob/master/UserGuide.md#scriptable) way, you need to escape characters that would otherwise be intercepted and interpreted by the shell.

Paths to folders shared to you from another person start with their email and a : character, see the example at ([example](https://github.com/meganz/MEGAcmd/blob/master/UserGuide.md#shared-folders-example))

### Local Path

This refers to a file or folder on the PC or device that MEGAcmd is running in.

### Session

When you log in with your email and MEGA account password, that creates a session. The session exists until you log out of it or kill it from another client. In MEGAcmd, use `whoami -l` to see all your open sessions across all devices, and use `killsession` to close them. You can use other MEGA clients such as the phone app, or webclient to close these also. Devices that were using a killed session will have their connection to MEGA closed immediately and will no longer have access to your account, until you log in on them again. Syncs, backups, and webdavs are specific to a session, so logging out will cause them to be cancelled.

### Local Cache

Logging in with MEGAcmd creates your Local Cache, a subfolder of your home folder. MEGAcmd downloads and stores some data in your Local Cache relating to your account, such as folder structure and contacts, for performance reasons. The MEGAcmd background server keeps the local cache up to date when changes to your account occur from other clients. The cache does contain a way for MEGAcmd to access your MEGA account when it starts up again if you have not specifically logged out. The Local Cache also contains information from your Session, including sync, backup, and webdav configurations. Logging out cleans the Local Cache, but also closes your session and the sync, backup, and webdav configurations are wiped.

### Synchronization configurations

MEGAcmd can set up a synchronization between a folder on your local machine and a folder in your MEGA account, using the [`sync`](https://github.com/meganz/MEGAcmd/blob/master/UserGuide.md#sync) command. This is the same mechanism that MEGAsync uses. The synchronisation is two-way: the folders you nominate to be synced will mirror any action! Whatever you add or delete in your sync folder on your device gets added or deleted in your sync folder in your MEGA account. And additions or deletions in your synced folder in your MEGA account will similarly be applied to your local synced folder. Files that are removed from sync folders are moved to a hidden local folder (Rubbish/.debris inside your local sync folder, or SyncDebris folder in the Rubbish Bin of your MEGA account).

Here is a very simple example of setting up a synchronization with MEGAcmd:

```
sync /path/to/local/folder /folder/in/mega
```

You can set up more than one pair or folders to be synced, and you can also set a sync from another device to the same folder, to achieve folder synchronisations between different devices. The changes are sent via your MEGA account rather than directly between the devices in that case.

Additional information about synchronising folders is available in our Help Center: [https://mega.nz/help/client/megasync/syncing](https://mega.nz/help/client/megasync/syncing)

### Backup configurations

MEGAcmd can set up a periodic copy of a local folder to your MEGA account using the [`backup`](https://github.com/meganz/MEGAcmd/blob/master/UserGuide.md#backup) command. Here is a simple example that will back up a folder immediately and then at 4am each day, keeping the 10 most recent backups:

```
backup /path/mega/folder /remote/path --period="0 0 4 * * *" --num-backups=10
```

For further information on backups, please see the [`backup`](https://github.com/meganz/MEGAcmd/blob/master/UserGuide.md#backup) command and the [tutorial](https://github.com/meganz/MEGAcmd/blob/master/contrib/docs/BACKUPS.md).

### WebDAV configurations

MEGAcmd can set up access to folders or files in your MEGA account as if they were local folders and files on your device using the [`webdav`](https://github.com/meganz/MEGAcmd/blob/master/UserGuide.md#webdav) command. For example making the folder appear like a local drive on your PC, or providing a hyperlink a browser can access, where the hyperlink is to your PC.

For further information on WebDAV, please see the [`webdav`](https://github.com/meganz/MEGAcmd/blob/master/UserGuide.md#webdav) command and the [tutorial](https://github.com/meganz/MEGAcmd/blob/master/contrib/docs/WEBDAV.md).

### Linux

On Linux, MEGAcmd commands are installed at /usr/bin and so will already be on your PATH. The interactive shell is `mega-cmd` and the background server is `mega-cmd-server`, which will be automatically started on demand. The various scriptable commands are installed at the same location, and invoke `mega-exec` to send the command to `mega-cmd-server`.

If you are using the scriptable commands in bash (or using the interactive commands in mega-cmd), the commands will auto-complete.

### Macintosh

For MacOS, after installing the dmg, you can launch the server using **MEGAcmd** in Applications. If you wish to use the client commands from MacOS Terminal, open the Terminal and include the installation folder in the PATH.

Typically:

```
export PATH=/Applications/MEGAcmd.app/Contents/MacOS:$PATH
```

And for bash completion, source `megacmd_completion.sh` :

```
source /Applications/MEGAcmd.app/Contents/MacOS/megacmd_completion.sh
```

### Windows

Once you have MEGAcmd installed, you can start the [interactive](https://github.com/meganz/MEGAcmd/blob/master/UserGuide.md#interactive) shell from the Start Menu or desktop icon. On windows the interactive shell executable is called `MEGAcmdShell.exe` and the server is `MEGAcmdServer.exe`.

On Windows 7, we recommend using the MEGAcmd shell from inside PowerShell for a better user experience (and you can do this on other Windows platforms also). You can start powershell from the Start Menu and then execute these commands to start it:

```
$env:PATH += ";$env:LOCALAPPDATA\MEGAcmd"
MEGAcmdShell
```

For [scriptable](https://github.com/meganz/MEGAcmd/blob/master/UserGuide.md#scriptable) usage, the MEGAcmd commands are provided via installed .bat files which pass the command to the MEGAcmdServer.exe. Provided you have set the PATH as above, you can use these like normal command line tools in PowerShell:

```
$env:PATH += ";$env:LOCALAPPDATA\MEGAcmd"
mega-cd /my/favourite/folder
mega-ls 
```

Or in Command Prompt:

```
set PATH=%LOCALAPPDATA%\MEGAcmd;%PATH%
mega-cd /my/favourite/folder
mega-ls 
```

And of course those can be invoked in your own .bat or .cmd files. Autocompletion is not available for the scriptable commands, but is in the interactive shell.

Unicode is supported though it currently in the interactive shell it needs to be switched on, and to have a suitable font selected; please execute `help --unicode` for the latest information. There are plans to improve this. Please report any issues experienced to our support team.


## Command Summary

These summaries use the usual conventions - `[]` indicates its content is optional, `|` indicates you should choose either the item on the left or the one on the right (but not both)

Each command is described as it would be used in the [interactive](https://github.com/meganz/MEGAcmd/blob/master/UserGuide.md#interactive) MEGAcmd shell, and the corresponding [scriptable](https://github.com/meganz/MEGAcmd/blob/master/UserGuide.md#scriptable) command (which must be prefixed with `mega-`) works in the same way.

Commands referring to a [remote path](https://github.com/meganz/MEGAcmd/blob/master/UserGuide.md#remote-path) are talking about a file in your MEGA account online, whereas a [local path](https://github.com/meganz/MEGAcmd/blob/master/UserGuide.md#local-path) refers to a file or folder on your local device where MEGAcmd is running.

Verbosity: You can increase the amount of information given by any command by passing `-v` (`-vv`, `-vvv`, ...)

### Account / Contacts

-   [`signup`](https://github.com/meganz/MEGAcmd/blob/master/UserGuide.md#signup)`email [password] [--name="Your Name"]` Register as user with a given email.
-   [`confirm`](https://github.com/meganz/MEGAcmd/blob/master/UserGuide.md#confirm)`link email [password]` Confirm an account using the link provided after the "signup" process.
-   [`invite`](https://github.com/meganz/MEGAcmd/blob/master/UserGuide.md#invite)`[-d|-r] dstemail [--message="MESSAGE"]` Invites a contact / deletes an invitation.
-   [`showpcr`](https://github.com/meganz/MEGAcmd/blob/master/UserGuide.md#showpcr)`[--in | --out]` Shows incoming and outgoing contact requests.
-   [`ipc`](https://github.com/meganz/MEGAcmd/blob/master/UserGuide.md#ipc)`email|handle -a|-d|-i` Manages contact incoming invitations.
-   [`users`](https://github.com/meganz/MEGAcmd/blob/master/UserGuide.md#users)`[-s] [-h] [-n] [-d contact@email]` List contacts
-   [`userattr`](https://github.com/meganz/MEGAcmd/blob/master/UserGuide.md#userattr)`[-s attribute value|attribute] [--user=user@email]` Lists/updates user attributes
-   [`passwd`](https://github.com/meganz/MEGAcmd/blob/master/UserGuide.md#passwd)`[oldpassword newpassword]` Modifies user password
-   [`masterkey`](https://github.com/meganz/MEGAcmd/blob/master/UserGuide.md#masterkey)`pathtosave` Shows your master key.

### Login / Logout

-   [`login`](https://github.com/meganz/MEGAcmd/blob/master/UserGuide.md#login)`[email [password]] | exportedfolderurl#key | session` Logs into MEGA
-   [`logout`](https://github.com/meganz/MEGAcmd/blob/master/UserGuide.md#logout)`[--keep-session]` Logs out
-   [`whoami`](https://github.com/meganz/MEGAcmd/blob/master/UserGuide.md#whoami)`[-l]` Print info of the user
-   [`session`](https://github.com/meganz/MEGAcmd/blob/master/UserGuide.md#session) Prints (secret) session ID
-   [`killsession`](https://github.com/meganz/MEGAcmd/blob/master/UserGuide.md#killsession)`[-a|sessionid]` Kills a session of current user.

### Browse

-   [`cd`](https://github.com/meganz/MEGAcmd/blob/master/UserGuide.md#cd)`[remotepath]` Changes the current remote folder
-   [`lcd`](https://github.com/meganz/MEGAcmd/blob/master/UserGuide.md#lcd)`[localpath]` Changes the current local folder for the interactive console
-   [`ls`](https://github.com/meganz/MEGAcmd/blob/master/UserGuide.md#ls)`[-lRr] [remotepath]` Lists files in a remote path
-   [`pwd`](https://github.com/meganz/MEGAcmd/blob/master/UserGuide.md#pwd) Prints the current remote folder
-   [`lpwd`](https://github.com/meganz/MEGAcmd/blob/master/UserGuide.md#lpwd) Prints the current local folder for the interactive console
-   [`attr`](https://github.com/meganz/MEGAcmd/blob/master/UserGuide.md#attr)`remotepath [-s attribute value|-d attribute]` Lists/updates node attributes
-   [`du`](https://github.com/meganz/MEGAcmd/blob/master/UserGuide.md#du)`[-h] [remotepath remotepath2 remotepath3 ... ]` Prints size used by files/folders
-   [`find`](https://github.com/meganz/MEGAcmd/blob/master/UserGuide.md#find)`[remotepath] [-l] [--pattern=PATTERN] [--mtime=TIMECONSTRAIN] [--size=SIZECONSTRAIN]` Find nodes matching a pattern
-   [`mount`](https://github.com/meganz/MEGAcmd/blob/master/UserGuide.md#mount) Lists all the main nodes

### Moving/Copying Files

-   [`mkdir`](https://github.com/meganz/MEGAcmd/blob/master/UserGuide.md#mkdir)`[-p] remotepath` Creates a directory or a directory hierarchy
-   [`cp`](https://github.com/meganz/MEGAcmd/blob/master/UserGuide.md#cp)`srcremotepath dstremotepath|dstemail` Copies a file/folder into a new location (all remotes)
-   [`put`](https://github.com/meganz/MEGAcmd/blob/master/UserGuide.md#put)`[-c] [-q] [--ignore-quota-warn] localfile [localfile2 localfile3 ...] [dstremotepath]` Uploads files/folders to a remote folder
-   [`get`](https://github.com/meganz/MEGAcmd/blob/master/UserGuide.md#get)`[-m] [-q] [--ignore-quota-warn] exportedlink#key|remotepath [localpath]` Downloads a remote file/folder or a public link
-   [`preview`](https://github.com/meganz/MEGAcmd/blob/master/UserGuide.md#preview)`[-s] remotepath localpath` To download/upload the preview of a file.
-   [`thumbnail`](https://github.com/meganz/MEGAcmd/blob/master/UserGuide.md#thumbnail)`[-s] remotepath localpath` To download/upload the thumbnail of a file.
-   [`mv`](https://github.com/meganz/MEGAcmd/blob/master/UserGuide.md#mv)`srcremotepath [srcremotepath2 srcremotepath3 ..] dstremotepath` Moves file(s)/folder(s) into a new location (all remotes)
-   [`rm`](https://github.com/meganz/MEGAcmd/blob/master/UserGuide.md#rm)`[-r] [-f] remotepath` Deletes a remote file/folder
-   [`transfers`](https://github.com/meganz/MEGAcmd/blob/master/UserGuide.md#transfers)`[-c TAG|-a] | [-r TAG|-a] | [-p TAG|-a] [--only-downloads | --only-uploads] [SHOWOPTIONS]` List or operate with transfers
-   [`speedlimit`](https://github.com/meganz/MEGAcmd/blob/master/UserGuide.md#speedlimit)`[-u|-d] [-h] [NEWLIMIT]` Displays/modifies upload/download rate limits
-   [`sync`](https://github.com/meganz/MEGAcmd/blob/master/UserGuide.md#sync)`[localpath dstremotepath| [-dsr] [ID|localpath]` Controls synchronizations
-   [`exclude`](https://github.com/meganz/MEGAcmd/blob/master/UserGuide.md#exclude)`[(-a|-d) pattern1 pattern2 pattern3 [--restart-syncs]]` Manages exclusions in syncs.
-   [`backup`](https://github.com/meganz/MEGAcmd/blob/master/UserGuide.md#backup)`localpath remotepath --period="PERIODSTRING" --num-backups=N` Set up a new backup folder and/or schedule
-   [`backup`](https://github.com/meganz/MEGAcmd/blob/master/UserGuide.md#backup)`[-lhda] [TAG|localpath] [--period="PERIODSTRING"] [--num-backups=N])` View/Modify an existing backup schedule

### Sharing (your own files, of course, without infringing any copyright)

-   [`cp`](https://github.com/meganz/MEGAcmd/blob/master/UserGuide.md#cp)`srcremotepath dstremotepath|dstemail` Moves a file/folder into a new location (all remotes)
-   [`export`](https://github.com/meganz/MEGAcmd/blob/master/UserGuide.md#export)`[-d|-a [--expire=TIMEDELAY]] [remotepath]` Prints/Modifies the status of current exports
-   [`import`](https://github.com/meganz/MEGAcmd/blob/master/UserGuide.md#import)`exportedfilelink#key [remotepath]` Imports the contents of a remote link into your account
-   [`share`](https://github.com/meganz/MEGAcmd/blob/master/UserGuide.md#share)`[-p] [-d|-a --with=user@email.com [--level=LEVEL]] [remotepath]` Prints/Modifies the status of current shares
-   [`webdav`](https://github.com/meganz/MEGAcmd/blob/master/UserGuide.md#webdav)`[ [-d] remotepath [--port=PORT] [--public] [--tls --certificate=/path/to/certificate.pem --key=/path/to/certificate.key]]` Sets up the ability to download a file from your MEGA account via your PC/device.

### Misc

-   [`version`](https://github.com/meganz/MEGAcmd/blob/master/UserGuide.md#version)`[-l][-c]` Prints MEGAcmd versioning and extra info
-   [`deleteversions`](https://github.com/meganz/MEGAcmd/blob/master/UserGuide.md#deleteversions) `[-f] (--all | remotepath1 remotepath2 ...)` Delete prior versions of files to save space.
-   [`unicode`](https://github.com/meganz/MEGAcmd/blob/master/UserGuide.md#unicode) Toggle unicode input enabled/disabled in interactive shell
-   [`reload`](https://github.com/meganz/MEGAcmd/blob/master/UserGuide.md#reload) Forces a reload of the remote files of the user
-   [`help`](https://github.com/meganz/MEGAcmd/blob/master/UserGuide.md#help)`[-f]` Prints list of commands
-   [`https`](https://github.com/meganz/MEGAcmd/blob/master/UserGuide.md#https)`[on|off]` Shows if HTTPS is used for transfers. Use `https on` to enable it.
-   [`clear`](https://github.com/meganz/MEGAcmd/blob/master/UserGuide.md#clear) Clear screen
-   [`log`](https://github.com/meganz/MEGAcmd/blob/master/UserGuide.md#log)`[-sc] level` Prints/Modifies the current logs level
-   [`debug`](https://github.com/meganz/MEGAcmd/blob/master/UserGuide.md#debug) Enters debugging mode (HIGHLY VERBOSE)
-   [`exit`](https://github.com/meganz/MEGAcmd/blob/master/UserGuide.md#exit)`|`[`quit`](https://github.com/meganz/MEGAcmd/blob/master/UserGuide.md#quit) `[--only-shell]` Quits MEGAcmd


***



## Appendix: Related

- [[Tools]]

*Backlinks:*

```dataview
list from [[Tool-Template]] AND -"Changelog"
```