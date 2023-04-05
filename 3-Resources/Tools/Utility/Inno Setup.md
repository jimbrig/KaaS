# Inno Setup

[Inno Setup](https://jrsoftware.org/isinfo.php) is a *free* installer for Windows Programs created by [Jordan Russell | Jordan Russell's Software](https://jrsoftware.org/) (and Martign Laan) back in 1997.

Inno Setup rivals and even surpasses many commercial installers in feature set and stability and is very widely used throughout [Software Development](../../../2-Areas/MOCs/Software%20Development.md).

## Key Features

*Source: [Inno Setup Help](https://jrsoftware.org/ishelp/)*

***Key features:***

* Support for every Windows release since 2006, including: Windows 11, Windows 10, Windows 10 on ARM, Windows Server 2019, Windows Server 2016, Windows 8.1, Windows 8, Windows Server 2012, Windows 7, Windows Server 2008 R2, Windows Server 2008, and Windows Vista. (No service packs are required.)
* Extensive support for installation of [64-bit](https://jrsoftware.org/ishelp/topic_32vs64bitinstalls.htm) applications on the 64-bit editions of Windows. The x64, ARM64 and Itanium architectures are all supported.
* Extensive support for both administrative and [non administrative installations](https://jrsoftware.org/ishelp/topic_admininstallmode.htm) installations.
* Supports creation of a single EXE to install your program for easy online distribution. [Disk spanning](https://jrsoftware.org/ishelp/topic_setup_diskspanning.htm) is also supported.
* Resizable standard Windows wizard interface.
* Customizable setup [types](https://jrsoftware.org/ishelp/topic_typessection.htm), e.g. Full, Minimal, Custom.
* Complete [uninstall](https://jrsoftware.org/ishelp/topic_setup_uninstallable.htm) capabilities.
* Installation of [files](https://jrsoftware.org/ishelp/topic_filessection.htm):  
  Includes integrated support for "deflate", bzip2, and 7-Zip LZMA/LZMA2 file [compression](https://jrsoftware.org/ishelp/topic_setup_compression.htm). The installer has the ability to compare file version info, replace in-use files, use shared file counting, register DLL/OCX's and type libraries, and install fonts.
* Creation of [shortcuts](https://jrsoftware.org/ishelp/topic_iconssection.htm) anywhere, including in the Start Menu and on the desktop.
* Creation of [registry](https://jrsoftware.org/ishelp/topic_registrysection.htm) and [.INI](https://jrsoftware.org/ishelp/topic_inisection.htm) entries.
* [Running](https://jrsoftware.org/ishelp/topic_runsection.htm) other programs before, during or after install.
* Support for [multilingual](https://jrsoftware.org/ishelp/topic_languagessection.htm) installs, including right-to-left language support.
* Support for [passworded](https://jrsoftware.org/ishelp/topic_setup_password.htm) and [encrypted](https://jrsoftware.org/ishelp/topic_setup_encryption.htm) installs.
* Support for [digitally signed](https://jrsoftware.org/ishelp/topic_setup_signtool.htm) installs and uninstalls, including dual signing (SHA1 & SHA256).
* [Silent install](https://jrsoftware.org/ishelp/topic_setupcmdline.htm#SILENT) and [silent uninstall](https://jrsoftware.org/ishelp/topic_uninstcmdline.htm#SILENT).
* [Unicode installs](https://jrsoftware.org/ishelp/topic_unicode.htm).
* Integrated preprocessor option for advanced compile-time customization.
* Integrated [Pascal scripting](https://jrsoftware.org/ishelp/topic_scriptintro.htm) engine option for advanced run-time install and uninstall customization.
* Full source code is available from [GitHub](https://github.com/jrsoftware/issrc "https://github.com/jrsoftware/issrc")![ \[external link\]](https://jrsoftware.org/ishelp/images/extlink.png).
* Tiny footprint: only about 1.5 mB overhead with all features included.
* All features are fully documented.
* Used by [Microsoft Visual Studio Code](https://code.visualstudio.com "https://code.visualstudio.com")![ \[external link\]](https://jrsoftware.org/ishelp/images/extlink.png) and [Embarcardero Delphi](https://www.embarcadero.com/products/delphi "https://www.embarcadero.com/products/delphi").

## Creating Installations

Installations are created by means of *scripts*, which are ASCII or Unicode (UTF-8 encoded with a BOM) text files with a format somewhat similar to .INI files. (No, it's not as complicated as you might be thinking!).

Scripts have an ".iss" (meaning Inno Setup Script) extension. The script controls every aspect of the installation. It specifies which files are to be installed and where, what shortcuts are to be created and what they are to be named, and so on.

Script files are usually edited from inside the "Inno Setup Compiler" Compiler IDE program. After you have finishing writing the script, the next and final step is select "Compile" in the Compiler IDE. What this does is create a complete, ready-to-run Setup program based on your script. By default, this is created in a directory named "Output" under the directory containing the script.

To give you an idea of how this all works, start the Compiler IDE, click *File | Open*, and select one of the script files in the Examples subdirectory located under the Inno Setup directory. (It may be helpful to use the sample scripts as a template for your own scripts.)

*See Also: [Script Format Overview](https://jrsoftware.org/ishelp/topic_scriptformatoverview.htm)*

---

## Appendix: Related

* [Tools](../Tools.md)
* [Electron](Electron.md)
* [Silent Installations](../../../0-Slipbox/Silent%20Installations.md)
* *Difference between MSI and EXE*
* *Windows - msiexec.exe*
* [Microsoft](../../../2-Areas/MOCs/Microsoft.md)
* *Windows*
* *R Package - Rinno*

*Backlinks:*

````dataview
list from [[Tool-Template]] AND -"Changelog"
````
