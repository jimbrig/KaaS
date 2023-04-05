# The Best Part of Windows 11 Is a Revamped Windows Subsystem for Linux

## Metadata

* Author: *Jim Salter*
* Full Title: The Best Part of Windows 11 Is a Revamped Windows Subsystem for Linux
* Category: #Type/Highlight/Article
* URL: https://arstechnica.com/gadgets/2021/10/the-best-part-of-windows-11-is-a-revamped-windows-subsystem-for-linux/

## Highlights

* there is one obvious "killer app" for WSLg that has us excited—and that's virt-manager, the RedHat-originated virtualization management tool. virt-manager is a simple tool that streamlines the creation, management, and operation of virtual machines using the Linux Kernel Virtual Machine. ([View Highlight](https://instapaper.com/read/1452074556/17711790))
* With virt-manager, you can see a simple list of your VMs along with how much disk, network, and CPU activity is currently associated with each. You can also manipulate their virtual "hardware"—e.g., by adding or removing RAM, "disks", network interfaces, and more—and start, pause, or stop them. Creation and destruction of VMs is as easy as management—and, finally, virt-manager allows you to pull a graphical console directly into each VM, which behaves just as a physical display connected to a bare-metal machine would. ([View Highlight](https://instapaper.com/read/1452074556/17711793))
* You also can't run the GNOME shell desktop environment itself under WSLg. Running apt install gnome-shell works fine, and pulls in the enormous list of dependencies necessary to satisfy that request—but gnome-shell itself fails ignominiously with unsupported session type, which effectively means it doesn't like WSLg's Weston/XWayland environment. ([View Highlight](https://instapaper.com/read/1452074556/17711805))
* Finally, Ubuntu's excellent baked-in OpenZFS support is missing. You can apt install zfsutils-linux without difficulty, but that package depends on Canonical's in-house kernel with built-in ZFS support, which Microsoft has not picked up in its own WSL2 kernel.
  Determined Ubuntu users can still apt install zfs-fuse and expect that user-mode implementation to work as well as it does under native Ubuntu—but we don't recommend it for production; the FUSE implementation is still stuck on 0.7.0, while the in-kernel version is 0.8.3. This means a lack of support for ZFS native encryption, along with a whole host of other features, bugfixes, and enhancements—let alone the performance implications of running under FUSE rather than in-kernel. ([View Highlight](https://instapaper.com/read/1452074556/17711808))
