# Symlinks in Windows, MinGW, Git, and Cygwin · Josh Kelley

## Metadata

* Author: *joshkel.com*
* Full Title: Symlinks in Windows, MinGW, Git, and Cygwin · Josh Kelley
* Category: #Type/Highlight/Article
* URL: https://www.joshkel.com/2018/01/18/symlinks-in-windows/

## Highlights

* Symlinks in Windows, MinGW, Git, and Cygwin
  19 Jan 2018 ([View Highlight](https://instapaper.com/read/1355716636/14404470))
* Symlinks are a commonly used feature in Linux and macOS, but Windows traditionally either hasn’t supported them (prior to Windows Vista) or has strictly limited their use. As a result, many cross-platform development tools, like Git for Windows, either didn’t support or didn’t enable symlink support on Windows. ([View Highlight](https://instapaper.com/read/1355716636/14404475))
* Configuring Windows ([View Highlight](https://instapaper.com/read/1355716636/14404477))
* Enable developer mode: Go under Settings, under Update & Security, under For developers, and set “Use developer features” to “Developer mode.” This is how you enable the Windows 10 Creators Update option of allowing users to create symlinks without UAC elevation. ([View Highlight](https://instapaper.com/read/1355716636/14404480))
* As described in the Git for Windows documentation, you’ll also need to edit Windows’ local security policy to grant permissions to create symlinks. My personal preference is to use gpedit.msc, since that’s a standard Windows tool. ([View Highlight](https://instapaper.com/read/1355716636/14404483))
* Incidentally, in case you’re wondering why all of this is necessary, the concern was that symlinks could be a security risk:
  Symbolic links (symlinks) can expose security vulnerabilities in applications that aren’t designed to handle symbolic links. - Microsoft TechNet ([View Highlight](https://instapaper.com/read/1355716636/14404488))
* Configuring MinGW, Cygwin, and Git ([View Highlight](https://instapaper.com/read/1355716636/14404493))
* For MSYS / MinGW (this includes the command-line utilities that used in the git-bash shell), add an environment variable, MSYS, and make sure it contains winsymlinks:nativestrict. (If you don’t do this, then symlinks are “emulated” by copying files and directories. This can be surprising, to say the least.) ([View Highlight](https://instapaper.com/read/1355716636/14404497))
* For Cygwin, add an environment variable, CYGWIN, and make sure it contains winsymlinks:nativestrict. See the Cygwin manual for details. (If you don’t do this, then Cygwin defaults to emulating symlinks by using special file contents that it understands but non-Cygwin software doesn’t.) ([View Highlight](https://instapaper.com/read/1355716636/14404499))
* For Git for Windows, make sure that the core.symlinks config option is true. In a normal Git system, this would be done at the system level (git config --system core.symlinks true). However, Git for Windows adds an additional “super-system” configuration file, c:\\ProgramData\\Git\\config; this was where I had to update core.symlinks on my system. (This Stack Overflow answer describes c:\\ProgramData\\Git\\config better.) ([View Highlight](https://instapaper.com/read/1355716636/14404502))
* For Git for Windows, make sure that the core.symlinks config option is true. In a normal Git system, this would be done at the system level (git config --system core.symlinks true). However, Git for Windows adds an additional “super-system” configuration file, c:\\ProgramData\\Git\\config; ([View Highlight](https://instapaper.com/read/1355716636/14404503))
* For Git for Windows, make sure that the core.symlinks config option is true. In a normal Git system, this would ([View Highlight](https://instapaper.com/read/1355716636/14404506))
* be done at the system level (git config --system core.symlinks true). However, Git for Windows adds an additional “super-system” configuration file, c:\\ProgramData\\Git\\config; this was where I had to update core.symlinks on my system. (This Stack Overflow answer describes c:\\ProgramData\\Git\\config better.) ([View Highlight](https://instapaper.com/read/1355716636/14404508))
* be done at the system level (git config --system core.symlinks true). However, Git for Windows adds an additional “super-system” configuration file, ([View Highlight](https://instapaper.com/read/1355716636/14404509))
* Update: If you’re looking for a Windows GUI to help you manage all of these symlinks, the Link Shell Extension is very useful. It allows you to create symlinks, junction points, and more by right-dragging items in Explorer. ([View Highlight](https://instapaper.com/read/1355716636/14404511))
