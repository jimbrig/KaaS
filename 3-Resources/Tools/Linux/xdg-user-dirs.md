# xdg-user-dirs

*Source: [xdg-user-dirs (www.freedesktop.org)](https://www.freedesktop.org/wiki/Software/xdg-user-dirs/)*

 > 
 > xdg-user-dirs is a tool to help manage "well known" user directories  like the desktop folder and the music folder. It also handles localization (i.e.  translation) of the filenames.

## xdg-user-dirs

`xdg-user-dirs` is a tool to help manage "well known" user directories like the desktop folder and the music folder. It also handles localization (i.e. translation) of the filenames.

The way it works is that xdg-user-dirs-update is run very early in the login phase. This program reads a configuration file, and a set of default directories. It then creates localized versions of these directories in the users home directory and sets up a config file in $(XDG\_CONFIG\_HOME)/user-dirs.dirs (XDG\_CONFIG\_HOME defaults to ~/.config) that applications can read to find these directories.

## Settings

Sysadmins can configure things by editing /etc/xdg/user-dirs.conf. At the moment there are only two settings, you can disable the whole thing, and you can specify the charset encoding used for filenames. They can also set or change the default directories and their initial values in /etc/xdg/user-dirs.defaults.

$(XDG\_CONFIG\_HOME)/user-dirs.dirs specifies the current set of directories for the user. This file is in a shell format, so its easy to access from a shell script. This file can also be modified by users (manually or via applications) to change the directories used. Note: To disable a directory, point it to the homedir. If you delete it it will be recreated on the next login.

Here is a shellscript example of how to find the desktop and the download directory:

````
test -f ${XDG_CONFIG_HOME:-~/.config}/user-dirs.dirs && source ${XDG_CONFIG_HOME:-~/.config}/user-dirs.dirs
echo ${XDG_DESKTOP_DIR:-$HOME/Desktop}
echo ${XDG_DOWNLOAD_DIR:-$HOME}
````

For application code the hope is that the various desktops will integrate this and have a nice API to find these directories.

## Translations

Translations of xdg-user-dirs are now handled by the [translation project](http://translationproject.org/). All translations should go through there. The merging from translation project to freedesktop.org is managed by Mikel Olasagasti.

## Code

The [Git](https://www.freedesktop.org/wiki/Software/xdg-user-dirs//../../Infrastructure/git/) module for this code is [xdg/xdg-user-dirs](http://cgit.freedesktop.org/xdg/xdg-user-dirs/).

### Download

* [http://user-dirs.freedesktop.org/releases/xdg-user-dirs-0.18.tar.gz](http://user-dirs.freedesktop.org/releases/xdg-user-dirs-0.18.tar.gz)
  * Fixed minor leak
  * Updated translations
  * Documentation fixes
* [http://user-dirs.freedesktop.org/releases/xdg-user-dirs-0.17.tar.gz](http://user-dirs.freedesktop.org/releases/xdg-user-dirs-0.17.tar.gz)
  * Respect $HOME in favour of getpwuid()
  * Updated translations
  * Documentation spelling fixes
* [http://user-dirs.freedesktop.org/releases/xdg-user-dirs-0.16.tar.gz](http://user-dirs.freedesktop.org/releases/xdg-user-dirs-0.16.tar.gz)
  * Added autostart file
* [http://user-dirs.freedesktop.org/releases/xdg-user-dirs-0.15.tar.gz](http://user-dirs.freedesktop.org/releases/xdg-user-dirs-0.15.tar.gz)
  * New translations
  * Added manpages
* [http://user-dirs.freedesktop.org/releases/xdg-user-dirs-0.14.tar.gz](http://user-dirs.freedesktop.org/releases/xdg-user-dirs-0.14.tar.gz)
  * New translations
  * Use right permissions on ~/.config if created (0700)
* [http://user-dirs.freedesktop.org/releases/xdg-user-dirs-0.13.tar.gz](http://user-dirs.freedesktop.org/releases/xdg-user-dirs-0.13.tar.gz)
  * New translations
  * Fix memory leak
  * Generate from git
* [http://user-dirs.freedesktop.org/releases/xdg-user-dirs-0.12.tar.gz](http://user-dirs.freedesktop.org/releases/xdg-user-dirs-0.12.tar.gz)
  * New translations
* [http://user-dirs.freedesktop.org/releases/xdg-user-dirs-0.11.tar.gz](http://user-dirs.freedesktop.org/releases/xdg-user-dirs-0.11.tar.gz)
  * New translations
  * Change "Download" to "Downloads" by default to match other names
  * Fix bashism in xdg-user-dir
* [http://user-dirs.freedesktop.org/releases/xdg-user-dirs-0.10.tar.gz](http://user-dirs.freedesktop.org/releases/xdg-user-dirs-0.10.tar.gz)
  * New translations
  * Update cut and paste code to handle oom and c++
* [http://user-dirs.freedesktop.org/releases/xdg-user-dirs-0.9.tar.gz](http://user-dirs.freedesktop.org/releases/xdg-user-dirs-0.9.tar.gz)
  * New translations
  * Relocatable
  * Fix possible crash
* [http://user-dirs.freedesktop.org/releases/xdg-user-dirs-0.8.tar.gz](http://user-dirs.freedesktop.org/releases/xdg-user-dirs-0.8.tar.gz)
  * Remove accidental debug spew
* [http://user-dirs.freedesktop.org/releases/xdg-user-dirs-0.7.tar.gz](http://user-dirs.freedesktop.org/releases/xdg-user-dirs-0.7.tar.gz)
  * Don't recreate dirs set to $HOME
* [http://user-dirs.freedesktop.org/releases/xdg-user-dirs-0.6.tar.gz](http://user-dirs.freedesktop.org/releases/xdg-user-dirs-0.6.tar.gz)
  * New translations
  * Fixed buggy printouts on --force
  * Make xdg-user-dir-lookup.c #include:able
  * Add xdg\_user\_dir\_lookup\_with\_fallback to xdg-user-dir-lookup.c
  * Add docs to xdg-user-dir-lookup.c
* [http://user-dirs.freedesktop.org/releases/xdg-user-dirs-0.5.tar.gz](http://user-dirs.freedesktop.org/releases/xdg-user-dirs-0.5.tar.gz)
  * New translations
* [http://user-dirs.freedesktop.org/releases/xdg-user-dirs-0.4.tar.gz](http://user-dirs.freedesktop.org/releases/xdg-user-dirs-0.4.tar.gz)
  * New translations
  * fix build with external libintl
* [http://user-dirs.freedesktop.org/releases/xdg-user-dirs-0.3.tar.gz](http://user-dirs.freedesktop.org/releases/xdg-user-dirs-0.3.tar.gz)
  * Create ~/.config dir if needed
* [http://user-dirs.freedesktop.org/releases/xdg-user-dirs-0.2.tar.gz](http://user-dirs.freedesktop.org/releases/xdg-user-dirs-0.2.tar.gz)
  * Build fixes
  * Update user-dirs.dirs atomically
* [http://user-dirs.freedesktop.org/releases/xdg-user-dirs-0.1.tar.gz](http://user-dirs.freedesktop.org/releases/xdg-user-dirs-0.1.tar.gz)
  * Add "Applications" to translations
  * Support --dummy-output to write config file elsewhere on update
  * Support --set to set a directory for the user
  * Save the locale used on initial run and forced update
    * This can be used to track changes in locale
* [http://user-dirs.freedesktop.org/releases/xdg-user-dirs-0.0.4.tar.gz](http://user-dirs.freedesktop.org/releases/xdg-user-dirs-0.0.4.tar.gz)
  * Added Projects/projects to list of translated keys
  * Also support non-homedir-relative directories in user-dirs.dir.
    * This isn't recommended (as it can cause problems with e.g. shared homedirs on multiple machines), but can be useful at times.

---

## Appendix: Links

* *MarkDownloads*

---

Jimmy Briggs | \[\[\]\]

---

## Appendix: Links

* *Tools*

*Backlinks:*

````dataview
list from [[xdg-user-dirs]] AND -"Changelog"
````
