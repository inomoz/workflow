1. Installed latest hwe stack
https://wiki.ubuntu.com/Kernel/LTSEnablementStack

2. Enabled PRIME Sync (fix tearing), for laptop with nvidia driver and optimus
```
sudo vi /etc/modprobe.d/nvidia-drm-nomodeset.conf
options nvidia-drm modeset=1
reboot
# login into system
sudo cat /sys/module/nvidia_drm/parameters/modeset # Y - means enabled and working
```
3. KDE cursor bug workaround
KDE System Settings -> Workspace Appearance -> Cursor Theme: Switch from resolution dependent to 24

4. KDE effects disable (some to fix bugs in rendering)
Desktop Effects
disable Background Contrast, Blur, Translucency

5. SDDM fix HIGHDPI (seems not working?)
https://wiki.archlinux.org/index.php/SDDM#DPI_settings 

6. Disable AKONADI
https://userbase.kde.org/Akonadi/ru (dont use time plasmoid and some kde apps)

7. Copy some configs to ~/.config/
alacritty/
ardour5/
autostart/
autostart-scripts/
borg/
calibre/
cantata/
compiz-1/
cutechess/
FreeCAD/
GIMP/
htop/
inkscape/
kcalcrc
kcmdisplayrc - here highdpi?
kcminputrc
kcmsambarc
kdeglobals 
kglobalshortcutsrc
khotkeysrc
kicad/
klavaro/
krunnerrc
kscreenlockerrc
ktimezonedrc
kxkbrc
lutris/
mimeapps.list - need customize
mpv/
nomacs/
obs-studio/
offlineimap/
OpenToonz
qBittorrent/
ranger
retroarch
rsibreakrc
rsibreak.notifyrc
spectaclerc
systemd/
twitchy3/
unity3d/
user-dirs.dirs
user-dirs.locale
VirtualBox/
wireshark/
zathura/
Zeal/ - docsets here ~/.local/share/Zeal/Zeal/docsets

8. Copy some configs to ~/
.anaconda/
.bash_logout 
.bashrc
.doom.d/ - doomed emacs config...
.emacs.d/ - emacs config + doom modules
.FreeCAD/
.freemind/
.fusion/
.gnupg/
.goldendict/
.ideavimrc
.inputrc
.IntelliJIdea*
.lmmsrc.xml
.mailrc
.gfc/ - autocomplete?
.steam/
.tmux.conf - need move to ~/.config
.wine/
.Xresources
.xinputrc
.xprofile

9. Install Packages (TODO: more info how install)
- alacritty
- anbox
- anki
- ardour
- aria2
- bash-completion
- blender
- borgbackup
- build-essential
- calibre
- cantata
- cargo
- chromium-browser
- com.github.babluboy.bookworm
- digikam
- discord
- docker-ce
- dropbox
- emacs-snapshot
- ffmpeg
- freecad
- fuse
- gcc
- gimp
- git
- golang-go
- goldendict
- googler
- gparted
- gpg-agent
- handbrake
- htop
- imagemagick
- inkscape-trunk
- jq
- jumpapp
- keepassxc
- kicad
- lm-sensors
- lutris
- maildir-utils
- maim
- mopidy
- mpv
- msmtp
- mu4e
- mupdf
- nomacs
- ntfs-3g
- numix-icon-theme
- obs-studio
- offlineimap
- okular
- openjdk
- openssh-client
- openssl
- openvpn
- opera-stable
- p7zip-full
- papirus-icon-theme
- ppa-purge
- qbittorrent
- ranger
- retroarch
- rsibreak
- scrot
- sirikali
- smartgit
- sqlite3
- sshfs
- steam:i386
- stockfish
- sublime-merge
- suckless-tools
- synergy
- thefuck
- tmux
- trash-cli
- unrar
- unzip
- virtualbox-6.0
- w3m
- wget
- wine
- wireshark
- wmctrl
- xdotool
- xsel
- youtube-dl
- zathura + zathura-cb + zathura-djvu + zathura-ps + https://askubuntu.com/a/841167 (mupdf instead poppler)
- zeal
- zip
- xcape
- surfraw
- parallel
- git-extras
- rclone
- ncdu
- howdoi
- yank
- tldr-py
- bcal
- httpie
- mps-youtube
- gotop
- lftp
- ripgrep
- liquidprompt
- bats
- rtv
- tig
- hstr
- davinci resolve
- unity3d
- opentoonz
- cutechess
- figma-linux
- firefox
- freemind
- jetbrains-idea
- klavaro
- remmina
- stellarium
- sublime merge
- usb-creator  

npm packages:
- doctoc
- caniuse-cmd

pip packages:
- locust
- currencyconverter
- rainbowstream

manual installatin
- https://github.com/creationix/nvm#installation-and-update
- https://github.com/pyenv/pyenv#installation
- https://github.com/domschrei/krunner-symbols
- https://github.com/sharkdp/bat#installation
- https://github.com/yudai/gotty#installation
- https://github.com/Russell91/sshrc#installation
- https://github.com/github/hub#installation
- https://github.com/BasioMeusPuga/twitchy
- https://github.com/holman/spark#install
- https://github.com/junegunn/fzf#installation

notes:
- https://mike.place/2017/fzf-fd/
- https://medium.com/@sidneyliebrand/how-fzf-and-ripgrep-improved-my-workflow-61c7ca212861

# Browser setup
uBlock
https://chrome.google.com/webstore/detail/ublock-origin/cjpalhdlnbpafiamejdnhcphjbkeiagm?hl=ru
Edit Office documents (offline)
https://chrome.google.com/webstore/detail/office-editing-for-docs-s/gbkeegbaiigmenfmjfclcdgdpimamgkj?hl=ru
Google docs offline
https://chrome.google.com/webstore/detail/google-docs-offline/ghbmnnjooekpmoecnnnilnnbdlolhkhi?hl=ru
h264ify - YouTube stream H.264 
https://chrome.google.com/webstore/detail/h264ify/aleakchihdccplidncghkekgioiakgal?hl=ru
HTML/CSS/JavaScript editing and JavaScript debugging using JetBrains IDEs.
https://chrome.google.com/webstore/detail/jetbrains-ide-support/hmhgeddbohgjknpmjagkdomcpobmllji?hl=ru
Allows a user to provide the URL of the page that loads in a new tab.
https://chrome.google.com/webstore/detail/new-tab-redirect/icpgjfneehieebagbmdbhnlpiopdcmna?hl=ru
Watch video using Picture-in-Picture
https://chrome.google.com/webstore/detail/picture-in-picture-extens/hkgfoiooedgoejojocmhlaklaeopbecg?hl=ru
PixelParallel by htmlBurger - Pixel perfect HTML vs Design tool for developers
https://chrome.google.com/webstore/detail/pixelparallel-by-htmlburg/iffnoibnepbcloaaagchjonfplimpkob?hl=ru
Global hotkeys for online music players
https://chrome.google.com/webstore/detail/streamkeys/ekpipjofdicppbepocohdlgenahaneen?hl=ru
Rich shortcuts to click links/switch tabs/scroll pages or capture full page, use Chrome like vim for productivity.
https://chrome.google.com/webstore/detail/surfingkeys/gfbliohnnapiefjpjlpjnehglfpaknnc?hl=ru
todo configure `surfingkeys.js`

Find path to copy data - `chrome://version/`
Check media internals - `chrome://media-internals/`
Clear DNS cache - `chrome://net-internals/#dns`
Flags - `chrome://flags/`

Optionally enable/disable flags:
zero-copy - works with native-gpu-memory-buffers
tcp-fast-open - linux only
```
chromium-browser --ignore-gpu-blacklist --enable-experimental-canvas-features --enable-accelerated-2d-canvas --canvas-msaa-sample-count=2 --force-display-list-2d-canvas --force-gpu-rasterization --enable-fast-unload --enable-accelerated-vpx-decode=3 --enable-tcp-fastopen --enable-checker-imaging --enable-zero-copy --ui-enable-zero-copy --enable-native-gpu-memory-buffers --enable-webgl-image-chromium --enable-accelerated-video --enable-gpu-rasterization
```

not recommended for me
` --javascript-harmony   --v8-cache-options=code --v8-cache-strategies-for-cache-storage=aggressive`

# IDE Setup
todo make script to download...
`
wget -qO-  https://plugins.jetbrains.com/files/$(curl https://plugins.jetbrains.com/api/plugins/4415/updates | jq -r '.[0].file') | bsdtar -xvf- -C ~/.Idea.../config/plugins
`
```
https://plugins.jetbrains.com/plugin/8575-nyan-progress-bar
https://plugins.jetbrains.com/plugin/4230-bashsupport
https://plugins.jetbrains.com/plugin/6098-nodejs
https://plugins.jetbrains.com/plugin/9442-vue-js
https://plugins.jetbrains.com/plugin/6610-php
https://plugins.jetbrains.com/plugin/631-python
https://plugins.jetbrains.com/plugin/8578-postcss-support
https://plugins.jetbrains.com/plugin/9333-makefile-support
https://plugins.jetbrains.com/plugin/10037-csv-plugin
https://plugins.jetbrains.com/plugin/9525--env-files-support
https://plugins.jetbrains.com/plugin/7495--ignore
https://plugins.jetbrains.com/plugin/7294-editorconfig
https://plugins.jetbrains.com/plugin/2162-string-manipulation
https://plugins.jetbrains.com/plugin/7792-yaml-ansible-support
https://plugins.jetbrains.com/plugin/7086-acejump
https://plugins.jetbrains.com/plugin/2917-regexptester
https://plugins.jetbrains.com/plugin/164-ideavim
https://plugins.jetbrains.com/plugin/8554-ide-features-trainer
https://plugins.jetbrains.com/plugin/7007-liveedit
https://plugins.jetbrains.com/plugin/10080-rainbow-brackets
```


# OS setup
~/.config/kxkbrc
