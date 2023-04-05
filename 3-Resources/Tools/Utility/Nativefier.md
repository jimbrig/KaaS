# Nativefier

*Source: [nativefier/nativefier: Make any web page a desktop application (github.com)](https://github.com/nativefier/nativefier)*

See Also: [Creating a Google Suite Desktop Electron App with Nativefier](../../../0-Slipbox/Creating%20a%20Google%20Suite%20Desktop%20Electron%20App%20with%20Nativefier.md)

---

## Contents

* [Usage](Nativefier.md#usage)
  * [Example](Nativefier.md#example)
* [Resources](Nativefier.md#resources)
* [Appendix: Related](Nativefier.md#appendix-related)

## Introduction

[Nativefier](https://github.com/nativefier/nativefier) is a command-line tool to easily create a “desktop app” for any web site with minimal fuss. Apps are wrapped by [Electron](https://www.electronjs.org/) (which uses Chromium under the hood) in an OS executable (`.app`, `.exe`, etc) usable on Windows, macOS and Linux.

I built this because I grew tired of having to Alt-Tab to my browser and then search through numerous open tabs when using Messenger or Whatsapp Web ([HN thread](https://news.ycombinator.com/item?id=10930718)). Nativefier features:

* Automatically retrieval of app icon / name
* Injection of custom JS & CSS
* Many more, see the [API docs](https://github.com/nativefier/nativefier/blob/master/API.md) or `nativefier --help`

## Installation

Installing nativefier is as easy as:

````powershell
npm i -g nativefier
````

*Assuming you have Node and NPM installed and on your `%PATH%`*

## Usage

````PowerShell
➜ nativefier --help

nativefier <targetUrl> [outputDirectory] [other options]
or
nativefier --upgrade <pathToExistingApp> [other options]

Positionals:
  targetUrl        the URL that you wish to to turn into a native app; required if not using --upgrade  [string]
  outputDirectory  the directory to generate the app in  [string] [default: current directory]

====== App Creation Options ======
  -a, --arch              the CPU architecture to build for  [string] [choices: "ia32", "x64", "armv7l", "arm64"] [default: current Node's arch]
  -c, --conceal           package the app source code into an asar archive  [boolean] [default: false]
  -e, --electron-version  specify the electron version to use (without the 'v'); see https://github.com/electron/electron/releases  [default: 16.0.6]
      --global-shortcuts  define global keyboard shortcuts via a JSON file; See https://github.com/nativefier/nativefier/blob/master/API.md#global-shortcuts  [string]
  -i, --icon              the icon file to use as the icon for the app (.ico on Windows, .icns/.png on macOS, .png on Linux)  [string]
  -n, --name              specify the name of the app  [string] [default: the title of the page passed via targetUrl]
      --no-overwrite      do not overwrite output directory if it already exists  [boolean] [default: false]
  -p, --platform          the operating system platform to build for  [string] [choices: "darwin", "linux", "mac", "mas", "osx", "win32", "windows"] [default: current operating system]
      --portable          make the app store its user data in the app folder; WARNING: see https://github.com/nativefier/nativefier/blob/master/API.md#portable for security risks  [boolean] [default: false]
      --upgrade           upgrade an app built by an older version of Nativefier
                          You must pass the full path to the existing app executable (app will be overwritten with upgraded version by default)  [string]
      --widevine          use a Widevine-enabled version of Electron for DRM playback (use at your own risk, it's unofficial, provided by CastLabs)  [boolean] [default: false]

====== App Window Options ======
      --always-on-top          enable always on top window  [boolean] [default: false]
      --background-color       set the app background color, for better integration while the app is loading. Example value: '#2e2c29'  [string]
      --bookmarks-menu         create a bookmarks menu (via JSON file); See https://github.com/nativefier/nativefier/blob/master/API.md#bookmarks-menu  [string]
      --browserwindow-options  override Electron BrowserWindow options (via JSON string); see https://github.com/nativefier/nativefier/blob/master/API.md#browserwindow-options
      --disable-context-menu   disable the context menu (right click)  [boolean] [default: false]
      --disable-dev-tools      disable developer tools (Ctrl+Shift+I / F12)  [boolean] [default: false]
      --full-screen            always start the app full screen  [boolean] [default: false]
      --height                 set window default height in pixels  [number] [default: 800]
      --hide-window-frame      disable window frame and controls  [boolean] [default: false]
  -m, --show-menu-bar          set menu bar visible  [boolean] [default: false]
      --max-width              set window maximum width in pixels  [number] [default: unlimited]
      --max-height             set window maximum height in pixels  [number] [default: unlimited]
      --maximize               always start the app maximized  [boolean] [default: false]
      --min-height             set window minimum height in pixels  [number] [default: 0]
      --min-width              set window minimum width in pixels  [number] [default: 0]
      --process-envs           a JSON string of key/value pairs to be set as environment variables before any browser windows are opened
      --single-instance        allow only a single instance of the app  [boolean] [default: false]
      --tray                   allow app to stay in system tray. If 'start-in-tray' is set as argument, don't show main window on first start  [choices: "true", "false", "start-in-tray"] [default: "false"]
      --width                  app window default width in pixels  [number] [default: 1280]
  -x                           set window x location in pixels from left  [number]
  -y                           set window y location in pixels from top  [number]
      --zoom                   set the default zoom factor for the app  [number] [default: 1]

====== Internal Browser Options ======
      --file-download-options        a JSON string defining file download options; see https://github.com/sindresorhus/electron-dl
      --inject                       path to a CSS/JS file to be injected; pass multiple times to inject multiple files  [array]
      --lang                         set the language or locale to render the web site as (e.g., "fr", "en-US", "es", etc.)  [string] [default: os language at runtime of the app]
  -u, --user-agent                   set the app's user agent string; may also use 'edge', 'firefox', or 'safari' to have one auto-generated  [string]
      --user-agent-honest, --honest  prevent the normal changing of the user agent string to appear as a regular Chrome browser  [boolean] [default: false]

====== Internal Browser Cache Options ======
      --clear-cache      prevent the app from preserving cache between launches  [boolean] [default: false]
      --disk-cache-size  set the maximum disk space (in bytes) to be used by the disk cache  [number] [default: chromium default]

====== URL Handling Options ======
      --block-external-urls  forbid navigation to URLs not considered "internal" (see '--internal-urls').  Instead of opening in an external browser, attempts to navigate to external URLs will be blocked  [boolean] [default: false]
      --internal-urls        regex of URLs to consider "internal"; all other URLs will be opened in an external browser  [string] [default: URLs sharing the same base domain]
      --proxy-rules          proxy rules; see https://www.electronjs.org/docs/api/session#sessetproxyconfig  [string]

====== Auth Options ======
      --basic-auth-password  basic http(s) auth password  [string]
      --basic-auth-username  basic http(s) auth username  [string]

====== Graphics Options ======
      --disable-gpu           disable hardware acceleration  [boolean] [default: false]
      --enable-es3-apis       force activation of WebGL 2.0  [boolean] [default: false]
      --ignore-gpu-blacklist  force WebGL apps to work on unsupported GPUs  [boolean] [default: false]

====== (In)Security Options ======
      --disable-old-build-warning-yesiknowitisinsecure  disable warning shown when opening an app made too long ago; Nativefier uses the Chrome browser (through Electron), and it is dangerous to keep using an old version of it  [boolean] [default: false]
      --ignore-certificate                              ignore certificate-related errors  [boolean] [default: false]
      --insecure                                        enable loading of insecure content  [boolean] [default: false]

====== Platform-Specific Options ======
      --app-copyright             (macOS, windows only) set a human-readable copyright line for the app; maps to `LegalCopyright` metadata property on Windows, and `NSHumanReadableCopyright` on macOS  [string]
      --app-version               (macOS, windows only) set the version of the app; maps to the `ProductVersion` metadata property on Windows, and `CFBundleShortVersionString` on macOS  [string]
      --bounce                    (macOS only) make the dock icon bounce when the counter increases  [boolean] [default: false]
      --build-version             (macOS, windows only) set the build version of the app; maps to `FileVersion` metadata property on Windows, and `CFBundleVersion` on macOS  [string]
      --counter                   (macOS only) set a dock count badge, determined by looking for a number in the window title  [boolean] [default: false]
      --darwin-dark-mode-support  (macOS only) enable Dark Mode support on macOS 10.14+  [boolean] [default: false]
  -f, --fast-quit                 (macOS only) quit app on window close  [boolean] [default: false]
      --title-bar-style           (macOS only) set title bar style; consider injecting custom CSS (via --inject) for better integration  [string] [choices: "hidden", "hiddenInset"]
      --win32metadata             (windows only) a JSON string of key/value pairs (ProductName, InternalName, FileDescription) to embed as executable metadata

====== Debug Options ======
      --crash-reporter  remote server URL to send crash reports  [string]
      --verbose         enable verbose/debug/troubleshooting logs  [boolean] [default: false]

Other Options
      --version  Show version number  [boolean]
      --help     Show help  [boolean]

Examples:
  nativefier <targetUrl> -n <name>                Make an app from <targetUrl> and set the application name to <name>
  nativefier --upgrade <pathToExistingApp>        Upgrade (in place) the existing Nativefier app at <pathToExistingApp>
  nativefier <targetUrl> -p <platform> -a <arch>  Make an app from <targetUrl> for the OS <platform> and CPU architecture <arch>
  for more examples and help...                   See https://github.com/nativefier/nativefier/blob/master/CATALOG.md

````

### Example

For example, here's how I created my GSuite Desktop PWA App:

````PowerShell
nativefier 'https://workspace.google.com/u/1/dashboard' `
    --user-agent firefox `
    --portable "." `
    --internal-urls ".*?\.google\.*?" `
    --show-menu-bar `
    --bookmarks-menu '.\menuBar.json' `
    --arch x64 `
    --icon "icons\Google.ico" `
    --basic-auth-username "jimmy.briggs@jimbrig.com" `
    --basic-auth-password "<PASSWORD>" `
    "app"
````

Resulting in this directory output into the `app` folder specified above:

![](https://i.imgur.com/CLX94pi.png)

and this is what the application looks like while running:

![](https://i.imgur.com/CXAk3R4.png)

## Resources

* [nativefier/nativefier: Make any web page a desktop application (github.com)](https://github.com/nativefier/nativefier)
* [nativefier/CATALOG.md at master · nativefier/nativefier (github.com)](https://github.com/nativefier/nativefier/blob/master/CATALOG.md)
* [nativefier/CHANGELOG.md at master · nativefier/nativefier (github.com)](https://github.com/nativefier/nativefier/blob/master/CHANGELOG.md)
* [nativefier/HACKING.md at master · nativefier/nativefier (github.com)](https://github.com/nativefier/nativefier/blob/master/HACKING.md)
* [nativefier/API.md at master · nativefier/nativefier (github.com)](https://github.com/nativefier/nativefier/blob/master/API.md#command-line)
* [ImageMagick – Convert, Edit, or Compose Digital Images](https://imagemagick.org/index.php)
* [WineHQ - Run Windows applications on Linux, BSD, Solaris and macOS](https://www.winehq.org/)
* [Introduction | Electron (electronjs.org)](https://www.electronjs.org/docs/latest/)
* [Accelerator | Electron (electronjs.org)](https://www.electronjs.org/docs/latest/api/accelerator)
* [BrowserWindow | Electron (electronjs.org)](https://www.electronjs.org/docs/latest/api/browser-window#new-browserwindowoptions)
* [sindresorhus/electron-dl: Simplified file downloads for your Electron app (github.com)](https://github.com/sindresorhus/electron-dl)
* [PortableApps.com - Portable software for USB, portable, and cloud drives](https://portableapps.com/)

---

## Appendix: Related

**Example Use:**

* [Creating a Google Suite Desktop Electron App with Nativefier](../../../0-Slipbox/Creating%20a%20Google%20Suite%20Desktop%20Electron%20App%20with%20Nativefier.md)

**Notes:**

* [Tools](../Tools.md)
* [CLI Tools List](../../../2-Areas/Lists/CLI%20Tools%20List.md)
* *Nodejs* | [Node - npm](../Developer%20Tools/Package%20Managers/Node%20-%20npm.md)
* [Electron](Electron.md)
* [Portable Apps](../../../0-Slipbox/Portable%20Apps.md)
