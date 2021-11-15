---
Date: 2021-11-15
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Slipbox", "#Topic/Dev"]
Alias: ["visudo", "Linux - visudo", "visudo command"]
---

# Linux - visudo command

The **visudo command** is a safe and secure way of editing the **/etc/sudoers** file on UNIX and Linux systems. /etc/sudoers is instumental for gaining privileged access via [sudo command](https://www.unixtutorial.org/commands/sudo/).

Since the sudoers file determines which users can run administrative tasks, those requiring superuser privileges, it is a good idea to take some precautions when editing it, and that’s what visudo does.

It locks the sudoers file so it cannot be edited by anyone else simultaneously. It also checks the syntax of your edits and provides basic sanity checks. If someone else is editing the file you’ll get a message to try later, and if there are errors in your edits it wont save them.

Preventing simultaneous editing by someone else is helpful to ensure your edits aren’t lost, and saving a sudoers file without errors is important because you could otherwise end up locked out of your system. An unreadable sudoers file will prevent you from running administrative tasks by using the sudo command or becoming root, and editing the sudoers file itself requires those privileges. So you really don’t want to screw that one up.

Visudo is basically a wrapper for a text editor such as vi or nano. Vi is traditionally the default unless your distribution or OS has something else set up. For basics on how to use vi for editing check out the vi survival guide.

Visudo has a built in list of supported editors that can be used, and you can change which it will use by setting the “EDITOR” environment variable on the command line like this:

```command
$ export EDITOR=nano
```

This will set nano as the default editor. To save this permanently add the same line to the .bashrc file in your home directory. On Ubuntu, where nano is actually set as the default, you can also change it by running sudo update-alternatives –config editor and then selecting your preference.

Editing Sudoers To open up the /etc/sudoers file for editing with visudo simply run sudo visudo.

Before making any edits it’s a good idea to check the existing configuration, and understand what everything means. One line you’ll definitely encounter is this:

```command
root ALL=(ALL:ALL) ALL
```

This gives the root user all of the superuser privileges, as can be expected. The format of the rule set such as this is as follows:

```command
user hosts=(users:groups) commands
```

What you’re doing is specifying which commands can a given user run under which circumstances. In case where all of them are set to ALL, like for root, it means that the user can run all commands on all hosts, as all users and groups.

If all you want is enable another user with the same powers as root, obtainable by issuing the sudo command before the desired command, you can just copy the root line and change “root” with your username, in this example “daniel”:

```command
daniel ALL=(ALL:ALL) ALL
```

But if you don’t want to give all of the privileges you can adjust the rules. For example you can allow “daniel” to only run certain commands:

```command
daniel ALL=(ALL:ALL) mytop,cat,tail
```

Besides users you can also give superuser permissions to groups using a % indicator:

```command
%admin ALL=(ALL) ALL
```

This would allow all users in the admin group to run all commands as root.

## Aliases in /etc/sudoers

Finally, you can set up aliases to group multiple entries into a single one for use in these statements. There are four types of aliases: User_Alias for listing users, Runas_Alias for listing users a given user can run as, Host_Alias for listing hosts, and Cmnd_Alias for listing commands.

Aliases are useful if you have a more complex set up with multitude of users that should have varying degrees of privileges on the system. To set up an alias just state the alias type, its name, and then the list of users, hosts or commands you want to associate it with. For example to set up a User_Alias you can do this:

```command
User_Alias MANAGERS = steve,bill,james
```

All the other aliases follow the same format only with the different specified type, and listing different types of things, like users, hosts or commands. If we wanted to put the three commands from the above example with the “daniel” user under an alias we could do this:

```command
Cmnd_Alias READ = mytop,cat,tail
```

And then instead of listing these two commands in our configuration for daniel we can just specify the READ alias:

```command
daniel ALL=(ALL:ALL) READ
```

It works the same way for other types of aliases. If we want to give the same privileges to users steve, bill, and james we can say:

```command
MANAGERS ALL=(ALL:ALL) READ
```

You get the idea.

## Applying your changes to /etc/sudoers

Once you’re done editing the file, use the standard sequence to finish your text editor session.

In vi/vim: type “:wq” – this means pressing : first, which activates the command mode, then typing wq and pressing Enter. This sequence will save the file and exit the editor.

In nano: press Ctrl+X, then y to confirm you want to save changes. Then press Enter without changing the default filename (visudo will know what to do).

Once your text editor session finishes, the control will be back to visudo which will do the checks and flag any issues. If there are no issues, you’ll get your shell prompt back.

These are the basics of using visudo and editing the sudoers file with it. We recommend you check out the manual pages if you ever need more detailed reference, like man visudo and man sudoers. You can also see a sample sudoers file with many examples at its web site.

*Backlinks:*

```dataview
list from [[Linux - visudo]] AND -"Changelog"
```