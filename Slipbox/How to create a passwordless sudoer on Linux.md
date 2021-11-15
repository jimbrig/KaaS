---
Date: 2021-11-15
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Code", "#Topic/Dev"]
Alias: "How to create a passwordless sudoer on Linux"
---

# How to create a passwordless sudoer on Linux

*Source: [How to configure passwordless sudo in Linux](https://www.simplified.guide/linux/enable-passwordless-sudo#:~:text=Steps%20to%20setting%20up%20passwordless%20sudo%20in%20Linux%3A,visudo%20by%20saving%20the%20file.%20More%20items...%20)*

Using the [[Linux - visudo|visudo]] command:

```bash
# Edit the sudoers with the visudo command
sudo visudo

# Change the %sudo group to be password-less
%sudo   ALL=(ALL:ALL) NOPASSWD: ALL

# Press CTRL+X to exit
# Press Y to save
# Press Enter to confirm
```


*Backlinks:*

```dataview
list from [[How to create a passwordless sudoer on Linux]] AND -"Changelog"
```