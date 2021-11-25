---
Date: 2021-11-15
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Code", "#Topic/Dev"]
Alias: "How to create a passwordless sudoer on Linux"
---

# How to create a passwordless `sudoer` on Linux

*Source: [How to configure passwordless sudo in Linux](https://www.simplified.guide/linux/enable-passwordless-sudo#:~:text=Steps%20to%20setting%20up%20passwordless%20sudo%20in%20Linux%3A,visudo%20by%20saving%20the%20file.%20More%20items...%20)*

Edit the `etc/sudoers.tmp` file:

Using the [[Linux Commands - visudo|visudo]] command:

```bash
sudo visudo -f /etc/sudoers.d/vips
```

Then, edit the opened file with the nano editor, adding:

```bash
[your-username] ALL=(ALL) NOPASSWD:ALL
```

mine looks like:

```bash
jimmy ALL=(ALL) NOPASSWD:ALL
```

to exit, `Ctrl+X` > `Enter`.

***

Old Method:

```bash
# Edit the sudoers with the visudo command
sudo visudo

# Change the %sudo group to be password-less
%sudo   ALL=(ALL:ALL) NOPASSWD: ALL

# Press CTRL+X to exit
# Press Y to save
# Press Enter to confirm
```

Note that the file now looks like this:

```text
# This file MUST be edited with the 'visudo' command as root.
#
# Please consider adding local content in /etc/sudoers.d/ instead of
# directly modifying this file.
#
# See the man page for details on how to write a sudoers file.
#
Defaults        env_reset
Defaults        mail_badpass
Defaults        secure_path="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/snap/bin"

# Host alias specification

# User alias specification

# Cmnd alias specification

# User privilege specification
root    ALL=(ALL:ALL) ALL

# Members of the admin group may gain root privileges
%admin ALL=(ALL) ALL

# Allow members of group sudo to execute any command
%sudo   ALL=(ALL:ALL) NOPASSWD: ALL

# See sudoers(5) for more information on "@include" directives:

@includedir /etc/sudoers.d
```

***

### Appendix: Links

*Backlinks:*

- [[Linux Commands - visudo]]

*Dataview*

	```dataview
	list from [[How to create a passwordless sudoer on Linux]] AND -"Changelog"
	```