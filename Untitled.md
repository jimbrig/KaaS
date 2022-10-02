```
~/
├─ .cache/    # $XDG_CACHE_HOME
├─ .config/   # $XDG_CONFIG_HOME
├─ .local/
│  ├─ share/  # $XDG_DATA_HOME
│  └─ bin/    # $PATH
│
├─ c/         # Dotfiles ("c" stand for "config")
├─ d/         # Documents
├─ m/         # Medias (Images, videos and Musics)
└─ t/         # Test, clone git repo, download files...
```

```
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"

export XDG_DOCUMENTS_DIR="$HOME/documents"
export XDG_PICTURES_DIR="$HOME/media/picture"
export XDG_VIDEOS_DIR="$HOME/media/videos"
export XDG_MUSIC_DIR="$HOME/media/music"
export XDG_DESKTOP_DIR="$HOME/desktop"
export XDG_DOWNLOAD_DIR="$HOME/.local/downloads"
export XDG_PUBLICSHARE_DIR="$HOME/.local/share"
export XDG_TEMPLATES_DIR="$HOME/.templates"
export XDG_SCRIPTS_DIR="$HOME/.scripts"
export XDG_BIN_DIR="$HOME/.bin"
```

```
xdg-user-dirs-update --set DOCUMENTS   "$XDG_DOCUMENTS_DIR"
xdg-user-dirs-update --set PICTURES    "$XDG_PICTURES_DIR"
xdg-user-dirs-update --set VIDEOS      "$XDG_VIDEOS_DIR"
xdg-user-dirs-update --set MUSIC       "$XDG_MUSIC_DIR"
xdg-user-dirs-update --set DESKTOP     "$XDG_DESKTOP_DIR"
xdg-user-dirs-update --set DOWNLOAD    "$XDG_DOWNLOAD_DIR"
xdg-user-dirs-update --set PUBLICSHARE "$XDG_PUBLICSHARE_DIR"
xdg-user-dirs-update --set TEMPLATES   "$XDG_TEMPLATES_DIR"
```