---
Date: 2022-11-11
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Tool/CLI", "#Type/Tool/Git"]
Alias: ["GnuPG", "GPG"]
---

# GnuPG

*Homepage: [gnupg.org](https://gnupg.org/index.html)*

## Overview

`GnuPG` or *The GNU Privacy Guard* is a complete and free implementation of the OpenPGP standard as defined by [RFC4880](https://www.ietf.org/rfc/rfc4880.txt) (also known as _PGP_). GnuPG allows you to encrypt and sign your data and communications; it features a versatile key management system, along with access modules for all kinds of public key directories. GnuPG, also known as _GPG_, is a command line tool with features for easy integration with other applications. A wealth of [frontend applications](https://gnupg.org/software/frontends.html) and [libraries](https://gnupg.org/software/libraries.html) are available. GnuPG also provides support for S/MIME and Secure Shell (ssh).


Since its introduction in 1997, GnuPG is [Free Software](https://www.gnu.org/philosophy/free-sw.html) (meaning that it respects your freedom). It can be freely used, modified and distributed under the terms of the [GNU General Public License](https://www.gnu.org/copyleft/gpl.html) .

The current version of GnuPG is 2.2.40. See the [download](https://gnupg.org/download/index.html) page for other maintained versions.

[Gpg4win](https://www.gpg4win.org/) is a Windows version of GnuPG featuring a context menu tool, a crypto manager, and an Outlook plugin to send and receive standard PGP/MIME mails. The current version of Gpg4win is 4.0.4.


## GnuPG Tool (Software)

GnuPG is a command line tool without any graphical user interface. It is an universal crypto engine which can be used directly from a command line prompt, from shell scripts, or from other programs. Therefore GnuPG is often used as the actual crypto backend of other applications.

Even when used on the command line it provides all functionality needed - this includes an interactive menu system. The set of commands of this tool will always be a superset of those provided by any frontends.

-   Full OpenPGP implementation (see RFC4880 at [RFC Editor](http://www.rfc-editor.org/)).
-   Full CMS/X.509 (S/MIME) implementation.
-   Ssh-agent implementation
-   Runs on all Unix platforms, Windows and macOS.
-   A full replacement of PGP; written from scratch.
-   Does not use any patented algorithms.
-   Freely available under the GPL;
-   Can be used as a filter program.
-   Better functionality than PGP with state of the art security features.
-   Decrypts and verifies PGP 5, 6 and 7 messages.
-   Supports RSA, ECDH, ECDSA, EdDSA, Elgamal, DSA, AES, Camellia, 3DES, Twofish, SHA2, and many more algorithms.
-   Language support for a load of languages.
-   Online help system.
-   Optional anonymous message receivers.
-   Integrated support for HKP keyservers (sks-keyservers.net).
-   and many more things….

## Related Software

Over the years, GnuPG has widly gained in popularity to become the standard _de-facto_ as free software for private communication and digital signature. As such, it is by no mean surprisingly to find out that there are so many programms orbiting around GnuPG.

For your convenience, GnuPG-related software has been grouped here in three big categories. If you are working for a new project and want to be listed here, please, feel free to contact the [webmaster](mailto:webmaster@gnupg.org) .

Please note that, being part of the [GNU Project](http://www.gnu.org/), we can not link to any project which can not be labeled as [free software](http://www.gnu.org/philosophy/free-sw.html) . If you found a link on these pages to a project which does not fulfill this requirement (a good checkpoint is the [FSF/UNESCO Free Software Directory](https://directory.fsf.org/)) please let us know by contacting the [webmaster](mailto:webmaster@gnupg.org) .

[Frontends](https://gnupg.org/software/frontends.html)

This category collects together all the software for various platforms which relays on GnuPG command line and provides some sort of easy-to-use user interface.

[Tools](https://gnupg.org/software/tools.html)

Under this link you'll find tools mostly used to manage GnuPG keys.

[Libraries](https://gnupg.org/software/libraries.html)

This page hosts projects which aim is to build an abstraction layer for who wants to painlessly add GnuPG capabilities to their software.

[All](https://gnupg.org/software/swlist.html)

Direct access to all descriptions.

***

## Appendix: Links

- [[3-Resources/Tools/_README|Tools]]

*Backlinks:*

```dataview
list from [[GnuPG]] AND -"Changelog"
```