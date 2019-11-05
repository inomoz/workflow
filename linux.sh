7. Copy some configs to ~/.config/
```

fonts: ~/.local/share/fonts
       sudo fc-cache

http://download.virtualbox.org/virtualbox/
vboxmanage extpack install ~/Downloads/Oracle_VM_VirtualBox_Extension_Pack-xxxx.vbox-extpack


sudo apt install docker.io
sudo systemctl start docker
sudo systemctl enable docker
sudo systemctl status docker
sudo usermod -aG docker ${USER}
su ${USER}
id -nG
sudo apt install docker-compose
docker run hello-world 


# alternative docker # `gpasswd -a user docker` then relogin

spotify
curl -sS https://download.spotify.com/debian/pubkey.gpg | sudo apt-key add - 
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update && sudo apt-get install spotify-client


https://www.teamviewer.com/en/download/linux/
https://www.upwork.com/ab/downloads/os/linux/
https://www.skype.com/ru/get-skype/
https://discordapp.com/download
https://desktop.telegram.org/

https://chrome.google.com/webstore/detail/ublock-origin/cjpalhdlnbpafiamejdnhcphjbkeiagm?hl=ru
https://chrome.google.com/webstore/detail/h264ify/aleakchihdccplidncghkekgioiakgal
https://chrome.google.com/webstore/detail/%D0%BE%D0%B1%D1%85%D0%BE%D0%B4-%D0%B1%D0%BB%D0%BE%D0%BA%D0%B8%D1%80%D0%BE%D0%B2%D0%BE%D0%BA-%D1%80%D1%83%D0%BD%D0%B5%D1%82%D0%B0/npgcnondjocldhldegnakemclmfkngch

sudo apt install fzf ripgrep gpick goldendict googler keepassxc mpv ncdu neovim obs-studio  openshot qbittorrent qjackctl ardour redshift-gtk rsync speedtest-cli sshfs tmux translate-shell trash-cli unrar  virtualbox youtube-dl streamlink zathura zathura-cb zathura-djvu zeal  neovim-qt telegram-desktop

sudo apt install --install-suggests gimp inkscape



redshift -> autostart
pin apps:
chromium
intellj
konsole
dolphin
neovim-qt
blender
gimp

pandoc
texlive-fonts-recommended texlive-latex-recommended




ardour5/
autostart/
autostart-scripts/
borg/
calibre/
cantata/
compiz-1/
cutechess/
GIMP/
htop/
inkscape/
kicad/
klavaro/
kxkbrc
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
user-dirs.dirs
user-dirs.locale
VirtualBox/
wireshark/
zathura/
Zeal/ - docsets here ~/.local/share/Zeal/Zeal/docsets
```

8. Copy some configs to ~/
```
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
```

9. Install Packages 
```
set -o pipefail
set -s
trap exit SIGINT SIGTERM

##### remove sudo reauthentication timeout
sudo sed -i.bak -e '$a\' -e 'Defaults timestamp_timeout=-1' -e '/Defaults timestamp_timeout=.*/d' /etc/sudoers

##### set better ssh defaults
sudo sed -i.bak -e '$a\' -e 'StrictHostKeyChecking=no' -e '/StrictHostKeyChecking=.*/d' /etc/ssh/ssh_config
sudo sed -i.bak -e '$a\' -e 'UserKnownHostsFile=\/dev\/null' -e '/UserKnownHostsFile=.*/d' /etc/ssh/ssh_config
sudo sed -i.bak -e '$a\' -e 'GlobalKnownHostsFile=\/dev\/null' -e '/GlobalKnownHostsFile=.*/d' /etc/ssh/ssh_config
sudo sed -i.bak -e '$a\' -e 'Compression=yes' -e '/Compression=.*/d' /etc/ssh/ssh_config
sudo sed -i.bak -e '$a\' -e 'CompressionLevel=1' -e '/CompressionLevel=.*/d' /etc/ssh/ssh_config

##### add ppa support
sudo apt update
sudo apt -y install \
    apt-transport-https \
    software-properties-common \
    
# add base repositories
sudo tee /etc/apt/sources.list << EOF
deb mirror://mirrors.ubuntu.com/mirrors.txt xenial main restricted universe multiverse
deb mirror://mirrors.ubuntu.com/mirrors.txt xenial-updates main restricted universe multiverse
deb mirror://mirrors.ubuntu.com/mirrors.txt xenial-backports main restricted universe multiverse
deb mirror://mirrors.ubuntu.com/mirrors.txt xenial-security main restricted universe multiverse
deb http://archive.canonical.com/ubuntu/ xenial partner

##### add extra repos
sudo add-apt-repository -y ppa:libreoffice/ppa # latest version
sudo add-apt-repository -y ppa:saiarcot895/chromium-dev # latest chromium
sudo add-apt-repository -y ppa:paulo-miguel-dias/pkppa # latest stable mesa graphics

# automated installation
sudo debconf-set-selections <<< 'ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true'

##### upgrade system
sudo apt update
sudo apt -y dist-upgrade

##### install useful apps
sudo apt

stow
fswatch
BorgBackup
pandoc
jq
caniuse-cmd 
aria2
peerflix
GnuPG 
fdupes
ncdu
ranger
CurlFtpFS
FFmpeg
reptyr
Gifsicle
moviemon 
shellpic
youtube-dl 
wego
nmap 
Taskwarrior 
Timewarriror
pdfgrep
ripgrep
sshfs
htop 
autojump *
fzf 
PathPicker 
tmux
Neovim 
Git
OpenVPN
googler 
crontab.guru
progress 
wget
gifgen
parallel
thefuck
tldr
hub
ngnix
asdf
mps-youtube
ripgrep
rtv


fswatch
BorgBackup
pandoc
jq
caniuse-cmd
aria2
peerflix
GnuPG
fdupes
ncdu
ranger
CurlFtpFS
FFmpeg
Gifsicle
moviemon
shellpic
youtube-dl
wego
nmap
Taskwarrior
Timewarriror

pdfgrep
ripgrep
sshfs
htop
autojump *
fzf
PathPicker
tmux
Neovim
Git
OpenVPN
googler
crontab.guru
progress
wget
gifgen
parallel
thefuck
tldr
hub
ngnix

asdf
mps-youtube
ripgrep
rtv

install \
    anbox \
    ardour \
    aria2 \
    bash-completion \
    blender \
    borgbackup \
    build-essential \
    calibre \
    cutechess \
    davfs2 \
    darktable \
    docker-ce \
    dos2unix \
    dropbox \
    exfat-utils \
    ffmpeg \
    figma-linux \
    firefox \
    gimp \
    git \
    goldendict \
    googler \
    gparted \
    gpg-agent \
    howdoi \
    hstr \
    htop \
    hunspell-en-us \
    imagemagick \
    inkscape-trunk \
    iotop \
    jq \
    jumpapp \
    kcalc \
    keepassxc \
    kgpg \
    kicad \
    klavaro \
    lftp \
    libreoffice \
    lm-sensors \
    lutris \
    maildir-utils \
    maim \
    mopidy \
    mps-youtube \
    mpv \
    msmtp \
    mu4e \
    ncdu \
    nomacs \
    ntfs-3g \
    numix-icon-theme \
    obs-studio \
    offlineimap \
    okular \
    openssh-client \
    openssl \
    openvpn \
    p7zip-full \
    p7zip-rar \
    papirus-icon-theme \
    parallel \
    partitionmanager \
    pavucontrol \
    powertop \
    ppa-purge \
    pv \
    python3-hunspell \
    qbittorrent \
    ranger \
    rclone \
    remmina \
    remmina-plugin-{nx,rdp,vnc} \
    ripgrep \
    rsibreak \
    rtv \
    scrot \
    shellcheck \
    sirikali \
    smartgit \
    spectacle \
    sqlite3 \
    sshfs \
    sshpass \
    steam \
    steam:i386 \
    stellarium \
    stockfish \
    suckless-tools \
    surfraw \
    synergy \
    thefuck \
    tig \
    tldr-py \
    tmux \
    trash-cli \
    umbrello \
    virtualbox-6.0 \
    vlc \
    w3m \
    wget \
    wireshark \
    wmctrl \
    xcape \
    xdotool \
    xsel \
    yank \
    youtube-dl \
    zathura \
    zathura-cb \
    zathura-djvu \
    zathura-ps \
    zeal \
    zfsutils-linux 
    
#sudo apt-get -fyo Dpkg::Options::="--force-overwrite" install
sudo apt dist-upgrade

##### add some packages that have no readily available repositories
#sudo mkdir -vp /tmp/extra-debs
#cd /tmp/extra-debs
#sudo wget "https://go.microsoft.com/fwlink/?LinkID=760868" -O vs-code-amd64.deb
#sudo wget -c \
#https://go.skype.com/skypeforlinux-64.deb \
#http://dbeaver.jkiss.org/files/dbeaver-ce_latest_amd64.deb \
#https://downloads.slack-edge.com/linux_releases/slack-desktop-2.8.2-amd64.deb \
#https://github.com/magkopian/keepassxc-debian/releases/download/2.2.2-1/keepassxc_2.2.2-1_amd64_16.04_xenial.deb \
# install them and fix their broken dependencies
#sudo dpkg -i *.deb
#sudo rm -v *.deb
#sudo apt-get -f install

sudo apt -y autoremove
sudo apt -y autoclean
sudo apt -y clean

# add official android fastboot and adb
sudo wget https://dl.google.com/android/repository/platform-tools-latest-linux.zip -O /tmp/android-platform-tools.zip
sudo unzip -q /tmp/android-platform-tools.zip -d /opt/android/
sudo find /opt/android -mindepth 2 -maxdepth 2 -executable -type f -exec ln -sv {} /usr/bin/ \;

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
- unity3d
- opentoonz movena edition
- freemind
- jetbrains-idea
- davinci resolve

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



# Disable meta key
kwriteconfig5 --file kwinrc --group ModifierOnlyShortcuts --key Meta ""



acl
acpid
acpi-support
adium-theme-ubuntu
adwaita-icon-theme
aisleriot
alacritty
alsa-base
alsa-tools
alsa-utils
anacron
android-tools-adb
android-tools-fastboot
anki
apg
app-install-data-partner
apport
apport-gtk
apport-symptoms
appstream
apt-config-icons
aptdaemon
aptdaemon-data
apt-transport-https
apturl
apturl-common
arc-theme
ardour
aspell
aspell-en
atool
atop
at-spi2-core
autoconf
autocutsel
automake
autopoint
avahi-autoipd
avahi-daemon
avahi-utils
baobab
bc
binutils
binutils-common
binutils-x86-64-linux-gnu
bitlbee-dev
bitlbee-libpurple
bitlbee-plugin-otr
blender
bluez
bluez-obexd
bolt
branding-ubuntu
breeze-cursor-theme
breeze-gtk-theme
brltty
bsdtar
build-essential
caca-utils
calibre
check
cheese
cheese-common
chromium-browser
cmake
colord
colord-data
containerd.io
copyq
cracklib-runtime
cups-browsed
cups-bsd
cups-client
cups-common
cups-daemon
cups-ipp-utils
cups-pk-helper
cups-ppdc
cups-server-common
curl
darktable
dbus-user-session
dbus-x11
dc
dconf-cli
dconf-gsettings-backend
dconf-service
deja-dup
desktop-file-utils
diffstat
digikam
djvulibre-bin
dkms
dmz-cursor-theme
dnsmasq-base
dns-root-data
docker-ce
docker-ce-cli
docker-compose
dunst
efibootmgr
emacs-snapshot
enchant
eog
espeak-ng-data
evince-common
evolution-data-server
evolution-data-server-common
example-content
extra-cmake-modules
fdclone
feh
ffmpeg
ffmpegthumbnailer
file-roller
firefox
flex
fontforge
fontforge-common
fonts-beng
fonts-beng-extra
fonts-deva
fonts-deva-extra
fonts-freefont-ttf
fonts-gargi
fonts-gubbi
fonts-gujr
fonts-gujr-extra
fonts-guru
fonts-guru-extra
fonts-indic
fonts-kacst
fonts-kacst-one
fonts-kalapi
fonts-khmeros-core
fonts-knda
fonts-lao
fonts-liberation
fonts-liberation2
fonts-lklug-sinhala
fonts-lohit-beng-assamese
fonts-lohit-beng-bengali
fonts-lohit-deva
fonts-lohit-gujr
fonts-lohit-guru
fonts-lohit-knda
fonts-lohit-mlym
fonts-lohit-orya
fonts-lohit-taml
fonts-lohit-taml-classical
fonts-lohit-telu
fonts-mlym
fonts-nakula
fonts-navilu
fonts-noto
fonts-noto-cjk
fonts-noto-color-emoji
fonts-orya
fonts-orya-extra
fonts-pagul
fonts-sahadeva
fonts-samyak-deva
fonts-samyak-gujr
fonts-samyak-mlym
fonts-samyak-taml
fonts-sarai
fonts-sil-abyssinica
fonts-sil-padauk
fonts-smc
fonts-smc-anjalioldlipi
fonts-smc-chilanka
fonts-smc-dyuthi
fonts-smc-karumbi
fonts-smc-keraleeyam
fonts-smc-manjari
fonts-smc-meera
fonts-smc-rachana
fonts-smc-raghumalayalamsans
fonts-smc-suruma
fonts-smc-uroob
fonts-taml
fonts-telu
fonts-telu-extra
fonts-thai-tlwg
fonts-tibetan-machine
fonts-tlwg-garuda
fonts-tlwg-garuda-ttf
fonts-tlwg-kinnari
fonts-tlwg-kinnari-ttf
fonts-tlwg-laksaman
fonts-tlwg-laksaman-ttf
fonts-tlwg-loma
fonts-tlwg-loma-ttf
fonts-tlwg-mono
fonts-tlwg-mono-ttf
fonts-tlwg-norasi
fonts-tlwg-norasi-ttf
fonts-tlwg-purisa
fonts-tlwg-purisa-ttf
fonts-tlwg-sawasdee
fonts-tlwg-sawasdee-ttf
fonts-tlwg-typewriter
fonts-tlwg-typewriter-ttf
fonts-tlwg-typist
fonts-tlwg-typist-ttf
fonts-tlwg-typo
fonts-tlwg-typo-ttf
fonts-tlwg-umpush
fonts-tlwg-umpush-ttf
fonts-tlwg-waree
fonts-tlwg-waree-ttf
fonts-ubuntu
foomatic-db-compressed-ppds
freecad
fwupd
fwupdate
fwupdate-signed
fzy
g++
gajim
gcc
gcr
gdb
gdbserver
gdisk
gdm3
gedit
gedit-common
genisoimage
geoclue-2.0
gettext
gimp
gimp-data
gir1.2-accountsservice-1.0
gir1.2-atk-1.0
gir1.2-atspi-2.0
gir1.2-dbusmenu-glib-0.4
gir1.2-dee-1.0
gir1.2-freedesktop
gir1.2-gck-1
gir1.2-gcr-3
gir1.2-gdesktopenums-3.0
gir1.2-gdkpixbuf-2.0
gir1.2-gdm-1.0
gir1.2-geoclue-2.0
gir1.2-geocodeglib-1.0
gir1.2-gmenu-3.0
gir1.2-gnomebluetooth-1.0
gir1.2-gnomedesktop-3.0
gir1.2-goa-1.0
gir1.2-gst-plugins-base-1.0
gir1.2-gstreamer-1.0
gir1.2-gtk-3.0
gir1.2-gtksource-3.0
gir1.2-gudev-1.0
gir1.2-gweather-3.0
gir1.2-ibus-1.0
gir1.2-javascriptcoregtk-4.0
gir1.2-json-1.0
gir1.2-mutter-2
gir1.2-nm-1.0
gir1.2-nma-1.0
gir1.2-notify-0.7
gir1.2-packagekitglib-1.0
gir1.2-pango-1.0
gir1.2-peas-1.0
gir1.2-polkit-1.0
gir1.2-rb-3.0
gir1.2-rsvg-2.0
gir1.2-secret-1
gir1.2-snapd-1
gir1.2-soup-2.4
gir1.2-totem-1.0
gir1.2-totemplparser-1.0
gir1.2-udisks-2.0
gir1.2-unity-5.0
gir1.2-upowerglib-1.0
gir1.2-vte-2.91
gir1.2-webkit2-4.0
gir1.2-wnck-3.0
git
git-gui
gitk
gjs
gkbd-capplet
glib-networking
glib-networking-common
glib-networking-services
gnome-accessibility-themes
gnome-bluetooth
gnome-calendar
gnome-control-center
gnome-control-center-data
gnome-control-center-faces
gnome-desktop3-data
gnome-disk-utility
gnome-font-viewer
gnome-getting-started-docs
gnome-initial-setup
gnome-keyring
gnome-keyring-pkcs11
gnome-mahjongg
gnome-menus
gnome-mines
gnome-online-accounts
gnome-power-manager
gnome-screenshot
gnome-session-bin
gnome-session-canberra
gnome-session-common
gnome-settings-daemon
gnome-settings-daemon-schemas
gnome-shell
gnome-shell-common
gnome-shell-extension-appindicator
gnome-shell-extension-ubuntu-dock
gnome-software
gnome-software-common
gnome-startup-applications
gnome-sudoku
gnome-terminal
gnome-terminal-data
gnome-themes-extra
gnome-themes-extra-data
gnome-todo
gnome-todo-common
gnome-tweak-tool
gnome-user-docs
gnome-user-guide
gnome-video-effects
gnupg-agent
gobject-introspection
google-chrome-stable
googler
gpick
grilo-plugins-0.3-base
gsettings-desktop-schemas
gsettings-ubuntu-schemas
gstreamer1.0-alsa
gstreamer1.0-clutter-3.0
gstreamer1.0-gl
gstreamer1.0-packagekit
gstreamer1.0-plugins-base
gstreamer1.0-plugins-base-apps
gstreamer1.0-plugins-good
gstreamer1.0-pulseaudio
gstreamer1.0-tools
gstreamer1.0-x
gtk2-engines-murrine
gtk2-engines-pixbuf
gtk-update-icon-cache
guile-2.0-libs
gvfs
gvfs-backends
gvfs-bin
gvfs-common
gvfs-daemons
gvfs-fuse
gvfs-libs
hardcode-tray
hddtemp
hibernate
hicolor-icon-theme
highlight
hplip-data
humanity-icon-theme
hunspell-en-us
i3
ibus
ibus-gtk
ibus-gtk3
ibus-table
ifupdown
iio-sensor-proxy
imagemagick
imagemagick-6-common
imagemagick-6.q16
im-config
inkscape-trunk
inotify-tools
inputattach
intltool
intltool-debian
ipmitool
ippusbxd
iputils-arping
irssi-scripts
jq
kbdd
keepassxc
kerneloops
kicad
ksnip
kvantum
language-selector-gnome
libaa1
libabw-0.1-1
libao4
libao-common
libao-dev
libappindicator3-1
libappstream4
libappstream-glib8
libapt-pkg-perl
libarchive-dev
libarchive-zip-perl
libart-2.0-2
libasound2
libasound2-data
libasound2-dev
libasound2-plugins
libaspell15
libasyncns0
libatasmart4
libatk1.0-0
libatk1.0-data
libatk-adaptor
libatk-bridge2.0-0
libatspi2.0-0
libaubio-dev
libaudio2
libavahi-core7
libavahi-glib1
libavahi-ui-gtk3-0
libavc1394-0
libavcodec-dev
libavformat-dev
libavutil-dev
libbabeltrace1
libbabl-0.1-0
libbinutils
libblockdev2
libblockdev-crypto2
libblockdev-fs2
libblockdev-loop2
libblockdev-part2
libblockdev-part-err2
libblockdev-swap2
libblockdev-utils2
libbluetooth3
libboost-date-time1.65.1
libboost-filesystem1.65.1
libboost-iostreams1.65.1
libboost-locale1.65.1
libboost-system1.65.1
libboost-thread1.65.1
libbrlapi0.6
libbz2-dev
libc6-dbg
libcaca0
libcairo-gobject2
libcairo-gobject-perl
libcairo-perl
libcamel-1.2-61
libcanberra0
libcanberra-gtk3-0
libcanberra-gtk3-module
libcanberra-pulse
libcc1-0
libcdio17
libcdio-cdda2
libcdio-paranoia2
libcdparanoia0
libcdr-0.1-1
libcgi-fast-perl
libcgi-pm-perl
libcheese8
libcheese-gtk25
libclass-accessor-perl
libclone-perl
libclucene-contribs1v5
libclucene-core1v5
libclutter-1.0-0
libclutter-1.0-common
libclutter-gst-3.0-0
libclutter-gtk-1.0-0
libcmis-0.5-5v5
libcogl20
libcogl-common
libcogl-pango20
libcogl-path20
libcolamd2
libcolord2
libcolord-gtk1
libcolorhug2
libconfig-dev
libcrack2
libcroco3
libcupscgi1
libcupsmime1
libcupsppdc1
libcurl3-gnutls
libdaemon0
libdatrie1
libdazzle-1.0-0
libdbus-1-dev
libdbus-glib-1-2
libdbusmenu-glib4
libdbusmenu-gtk3-4
libdbusmenu-gtk4
libdconf1
libdee-1.0-4
libdigest-hmac-perl
libdjvulibre21
libdjvulibre-text
libdmapsharing-3.0-2
libdotconf0
libdpkg-perl
libdrm-dev
libdv4
libdw1
libeb16-dev
libebackend-1.2-10
libe-book-0.1-1
libebook-1.2-19
libebook-contacts-1.2-2
libecal-1.2-19
libedata-book-1.2-25
libedata-cal-1.2-28
libedataserver-1.2-23
libedataserverui-1.2-2
libefiboot1
libefivar1
libegl1
libegl1-mesa
libegl1-mesa-dev
libegl-mesa0
libemail-valid-perl
libenchant1c2a
libeot0
libepoxy0
libepubgen-0.1-1
libespeak-ng1
libetonyek-0.1-1
libev-dev
libevdev2
libevdev-dev
libevdev-tools
libevent-2.1-6
libexempi3
libexif12
libexiv2-14
libexporter-tiny-perl
libexttextcat-2.0-0
libexttextcat-data
libfcgi-perl
libfftw3-dev
libfftw3-double3
libfftw3-single3
libfile-copy-recursive-perl
libfile-fcntllock-perl
libflac8
libfontembed1
libfreehand-0.1-1
libfreerdp2-2
libfreerdp-client2-2
libfwup1
libfwupd2
libgail18
libgail-3-0
libgail-common
libgbm1
libgc1c2
libgcab-1.0-0
libgck-1-0
libgconf-2-4
libgcr-base-3-1
libgcr-ui-3-1
libgcrypt20-dev
libgd3
libgdata22
libgdata-common
libgdk-pixbuf2.0-0
libgdk-pixbuf2.0-bin
libgdk-pixbuf2.0-common
libgdm1
libgee-0.8-2
libgeoclue-2-0
libgeocode-glib0
libgexiv2-2
libgif-dev
libgirepository1.0-dev
libgjs0g
libgl1-mesa-dev
libgles2
libgles2-mesa-dev
libglib2.0-bin
libglibmm-2.4-dev
libglib-object-introspection-perl
libglib-perl
libglu1-mesa
libgmime-3.0-0
libgnome-2-0
libgnome2-0
libgnome-autoar-0-0
libgnome-bluetooth13
libgnome-desktop-3-17
libgnome-games-support-1-3
libgnome-games-support-common
libgnomekbd8
libgnomekbd-common
libgnome-menu-3-0
libgnome-todo
libgnutls28-dev
libgoa-1.0-0b
libgoa-1.0-common
libgoa-backend-1.0-1
libgom-1.0-0
libgomp1
libgpgmepp6
libgphoto2-6
libgphoto2-l10n
libgphoto2-port12
libgpm2
libgpod4
libgpod-common
libgraphene-1.0-0
libgrilo-0.3-0
libgspell-1-1
libgspell-1-common
libgstreamer1.0-0
libgstreamer-gl1.0-0
libgstreamer-plugins-base1.0-0
libgstreamer-plugins-good1.0-0
libgtk2.0-0
libgtk2.0-bin
libgtk2.0-common
libgtk-3-0
libgtk-3-bin
libgtk-3-common
libgtk3-perl
libgtksourceview-3.0-1
libgtksourceview-3.0-common
libgtop-2.0-11
libgtop2-common
libgudev-1.0-0
libgusb2
libgutenprint2
libgweather-3-15
libgweather-common
libgxps2
libhpmud0
libhunspell-1.6-0
libhunspell-dev
libhyphen0
libibus-1.0-5
libical3
libiec61883-0
libieee1284-3
libilmbase12
libimobiledevice6
libindicator3-7
libinput10
libinput-bin
libio-pty-perl
libio-socket-inet6-perl
libio-string-perl
libipc-run-perl
libiw30
libjack-dev
libjavascriptcoregtk-4.0-18
libjpeg-dev
libjson-c-dev
libjson-glib-1.0-0
libjson-glib-1.0-common
libjson-glib-dev
liblangtag1
liblangtag-common
liblcms2-dev
liblcms2-utils
liblilv-dev
liblirc-client0
liblist-moreutils-perl
libllvm6.0
liblo-dev
liblouis14
liblouis-data
liblouisutdml8
liblouisutdml-bin
liblouisutdml-data
liblqr-1-0
libltdl7
liblua5.3-0
liblzo2-dev
libmagickcore-6.q16-3
libmagickcore-6.q16-3-extra
libmagickwand-6.q16-3
libmbim-glib4
libmbim-proxy
libmediaart-2.0-0
libmessaging-menu0
libmhash2
libminiupnpc10
libmm-glib0
libmozjs-52-0
libmp3lame0
libmpg123-0
libmspub-0.1-1
libmtdev1
libmtp9
libmtp-common
libmtp-runtime
libmutter-2-0
libmwaw-0.3-3
libmythes-1.2-0
libnatpmp1
libnautilus-extension1a
libncurses5-dev
libncursesw5-dev
libndp0
libneon27-gnutls
libnet-dns-perl
libnet-domain-tld-perl
libnet-ip-perl
libnet-libidn-perl
libnetpbm10
libnghttp2-14
libnm0
libnma0
libnotify4
libnotify-bin
libnss-mdns
libnss-myhostname
liboauth0
libobasis6.3-base
libobasis6.3-calc
libobasis6.3-core
libobasis6.3-draw
libobasis6.3-en-us
libobasis6.3-extension-beanshell-script-provider
libobasis6.3-extension-javascript-script-provider
libobasis6.3-extension-mediawiki-publisher
libobasis6.3-extension-nlpsolver
libobasis6.3-extension-pdf-import
libobasis6.3-extension-report-builder
libobasis6.3-firebird
libobasis6.3-gnome-integration
libobasis6.3-graphicfilter
libobasis6.3-images
libobasis6.3-impress
libobasis6.3-kde-integration
libobasis6.3-librelogo
libobasis6.3-libreofficekit-data
libobasis6.3-math
libobasis6.3-ogltrans
libobasis6.3-onlineupdate
libobasis6.3-ooofonts
libobasis6.3-ooolinguistic
libobasis6.3-postgresql-sdbc
libobasis6.3-python-script-provider
libobasis6.3-pyuno
libobasis6.3-ru
libobasis6.3-ru-help
libobasis6.3-writer
libobasis6.3-xsltfilter
libodfgen-0.1-1
libogg0
libopenexr22
libopus0
liborc-0.4-0
liborcus-0.13-0
libpackagekit-glib2-18
libpagemaker-0.0-0
libpam-gnome-keyring
libpango-1.0-0
libpangocairo-1.0-0
libpangoft2-1.0-0
libpangoxft-1.0-0
libparse-debianchangelog-perl
libparted-fs-resize0
libpcaudio0
libpcre2-dev
libpcsclite1
libpeas-1.0-0
libpeas-common
libperlio-gzip-perl
libphonenumber7
libpixman-1-dev
libplist3
libpng-dev
libpolkit-agent-1-0
libpolkit-backend-1-0
libpoppler-glib8
libprotobuf10
libproxy1-plugin-gsettings
libproxy1-plugin-networkmanager
libproxy1v5
libpulse0
libpulsedsp
libpulse-mainloop-glib0
libpurple-dev
libpwquality1
libpwquality-common
libpython3.6
libpython-dev
libqmi-glib5
libqmi-proxy
libqpdf21
libqqwing2v5
libqt5core5a
libqt5multimedia5-plugins
libqt5svg5-dev
libqt5webkit5
libqt5webkit5-dev
libqt5x11extras5
libqt5x11extras5-dev
libraptor2-0
librasqal3
libraw1394-11
libraw16
librdf0
librdf0-dev
libreoffice6.3
libreoffice6.3-base
libreoffice6.3-calc
libreoffice6.3-debian-menus
libreoffice6.3-dict-en
libreoffice6.3-dict-es
libreoffice6.3-dict-fr
libreoffice6.3-dict-ru
libreoffice6.3-draw
libreoffice6.3-en-us
libreoffice6.3-impress
libreoffice6.3-math
libreoffice6.3-ru
libreoffice6.3-ure
libreoffice6.3-writer
libreoffice-avmedia-backend-gstreamer
libreoffice-base-core
libreoffice-calc
libreoffice-common
libreoffice-core
libreoffice-draw
libreoffice-gnome
libreoffice-gtk3
libreoffice-impress
libreoffice-math
libreoffice-ogltrans
libreoffice-pdfimport
libreoffice-style-breeze
libreoffice-style-galaxy
libreoffice-style-tango
libreoffice-writer
librest-0.7-0
librevenge-0.0-0
librhythmbox-core10
librsvg2-2
librsvg2-bin
librsvg2-common
librsvg2-dev
librtmp1
librubberband-dev
libsamplerate0
libsamplerate0-dev
libsane1
libsane-common
libsane-hpaio
libsbc1
libsdl2-2.0-0
libsdl2-dev
libsecret-1-0
libsecret-common
libsecret-tools
libserd-dev
libsgutils2-2
libshout3
libsmbios-c2
libsnapd-glib1
libsndfile1
libsndfile1-dev
libsnmp30
libsnmp-base
libsocket6-perl
libsodium23
libsonic0
libsord-dev
libsoup2.4-1
libsoup-gnome2.4-1
libspeechd2
libspeex1
libspeexdsp1
libsqlite3-dev
libsratom-dev
libssh-4
libstartup-notification0
libstartup-notification0-dev
libstemmer0d
libstfl-dev
libsub-name-perl
libsuitesparseconfig5
libsysmetrics1
libtag1-dev
libtag1v5
libtag1v5-vanilla
libteamdctl0
libtext-levenshtein-perl
libthai0
libthai-data
libtheora0
libtiff5-dev
libtiff-dev
libtool
libtool-bin
libtotem0
libtotem-plparser18
libtotem-plparser-common
libtracker-sparql-2.0-0
libtwolame0
libu2f-udev
libudisks2-0
libunity9
libunity-protocol-private0
libunity-scopes-json-def-desktop
libupower-glib3
libusbmuxd4
libutf8proc-dev
libv4l-0
libv4lconvert0
libvisio-0.1-1
libvisual-0.4-0
libvncclient1
libvolume-key1
libvorbis0a
libvorbis-dev
libvorbisenc2
libvorbisfile3
libvpx5
libvte-2.91-0
libvte-2.91-common
libwacom2
libwacom-bin
libwacom-common
libwavpack1
libwayland-client0
libwayland-cursor0
libwayland-egl1-mesa
libwayland-server0
libwebkit2gtk-4.0-37
libwebp6
libwebpdemux2
libwebp-dev
libwebpmux3
libwebrtc-audio-processing1
libwhoopsie0
libwhoopsie-preferences0
libwinpr2-2
libwmf0.2-7
libwmf0.2-7-gtk
libwnck-3-0
libwnck-3-common
libwpd-0.10-10
libwpg-0.3-3
libwps-0.4-4
libx11-dev
libxapian30
libxatracker2
libxcb1-dev
libxcb-composite0-dev
libxcb-damage0-dev
libxcb-ewmh-dev
libxcb-icccm4
libxcb-icccm4-dev
libxcb-image0
libxcb-image0-dev
libxcb-keysyms1
libxcb-keysyms1-dev
libxcb-present-dev
libxcb-randr0
libxcb-randr0-dev
libxcb-render0-dev
libxcb-render-util0
libxcb-render-util0-dev
libxcb-res0
libxcb-shape0-dev
libxcb-util1
libxcb-util-dev
libxcb-xfixes0
libxcb-xfixes0-dev
libxcb-xinerama0-dev
libxcb-xkb1
libxcb-xkb-dev
libxcb-xrm-dev
libxcb-xv0
libxdg-basedir-dev
libxext-dev
libxfont2
libxkbcommon0
libxkbcommon-dev
libxkbcommon-x11-0
libxkbcommon-x11-dev
libxkbfile1
libxklavier16
libxml2-dev
libxml-libxml-perl
libxml-namespacesupport-perl
libxml-sax-base-perl
libxml-sax-expat-perl
libxml-sax-perl
libxmlsec1
libxmlsec1-nss
libxml-simple-perl
libxpm-dev
libxres1
libxslt1.1
libxss1
libxtst-dev
libxvmc1
libyajl2
libyaml-libyaml-perl
libyelp0
libzeitgeist-2.0-0
light-themes
linkchecker
linkchecker-gui
lintian
linux-sound-base
lnav
lp-solve
lv2-dev
lxappearance
lynx
maim
make
mediainfo
media-player-info
memtest86+
mesa-common-dev
mesa-utils
mesa-utils-extra
mesa-vdpau-drivers
meson
microcode.ctl
mintdrivers
mobile-broadband-provider-info
modemmanager
mousetweaks
mpv
mscompress
mtools
mutter
mutter-common
nautilus
nautilus-data
nautilus-extension-gnome-terminal
nautilus-sendto
nautilus-share
ncdu
neovim
netpbm
network-manager
network-manager-config-connectivity-ubuntu
network-manager-gnome
network-manager-pptp
network-manager-pptp-gnome
ninja-build
nitrogen
notification-daemon
npm
numix-gtk-theme
numix-icon-theme
nvidia-driver-430
obs-studio
ocl-icd-opencl-dev
odt2txt
openprinting-ppds
openvpn
opera-stable
orca
p11-kit
p11-kit-modules
p7zip-full
packagekit
packagekit-tools
papirus-icon-theme
parcellite
patch
patchutils
pavucontrol
pcmciautils
pidgin
pidgin-data
pinentry-gnome3
pkg-config
plymouth-label
plymouth-theme-ubuntu-logo
policykit-1
policykit-desktop-privileges
poppler-utils
ppa-purge
ppp
pppconfig
pppoeconf
pptp-linux
printer-driver-brlaser
printer-driver-c2esp
printer-driver-foo2zjs
printer-driver-foo2zjs-common
printer-driver-m2300w
printer-driver-min12xxw
pulseaudio
pulseaudio-module-bluetooth
pulseaudio-utils
pureref
python3.7
python3-apport
python3-aptdaemon
python3-aptdaemon.gtk3widgets
python3-asn1crypto
python3-brlapi
python3-cairo
python3-cffi-backend
python3-crypto
python3-cryptography
python3-cups
python3-cupshelpers
python3-debconf
python3-debian
python3-defer
python3-dev
python3-gi-cairo
python3-httplib2
python3-keyring
python3-keyrings.alt
python3-launchpadlib
python3-lazr.restfulclient
python3-lazr.uri
python3-louis
python3-macaroonbakery
python3-mako
python3-markupsafe
python3-nacl
python3-oauth
python3-olefile
python3-pexpect
python3-pil
python3-pip
python3-problem-report
python3-protobuf
python3-ptyprocess
python3-pyatspi
python3-pymacaroons
python3-pyqt5.qtmultimedia
python3-pyqt5.qtwebengine
python3-recoll
python3-renderpm
python3-reportlab
python3-reportlab-accel
python3-requests-unixsocket
python3-rfc3339
python3-secretstorage
python3-setuptools
python3-simplejson
python3-software-properties
python3-speechd
python3-systemd
python3-tz
python3-uno
python3-venv
python3-wadllib
python3-xdg
python3-xkit
python3-zope.interface
python-all
python-dev
python-pip
python-stdeb
qalc
qjackctl
qpdf
qt5ct
qt5-qmake
qtbase5-dev
qttools5-dev-tools
recoll
redis-tools
remmina
remmina-common
remmina-plugin-rdp
remmina-plugin-secret
remmina-plugin-vnc
resilio-sync
rfkill
rhythmbox
rhythmbox-data
rhythmbox-plugin-alternative-toolbar
rhythmbox-plugins
ripgrep
rtkit
rtv
rygel-gst-launch
sane-utils
sbsigntool
seahorse
secureboot-db
session-migration
shotwell
shotwell-common
simple-scan
skypeforlinux
sni-qt
sni-qt:i386
software-properties-common
software-properties-gtk
sound-icons
sound-theme-freedesktop
speech-dispatcher
speech-dispatcher-audio-plugins
speech-dispatcher-espeak-ng
spice-vdagent
spotify-client
sqlite
sqlite3
squashfs-tools
ssl-cert
suckless-tools
sur5r-keyring
surfraw
swatch
sxiv
synergy
syslinux
syslinux-common
syslinux-legacy
sysstat
system-config-printer
system-config-printer-common
system-config-printer-gnome
system-config-printer-udev
texinfo
thunderbird
thunderbird-gnome-support
tilda
tmux
totem
totem-common
totem-plugins
transmission
transmission-cli
transmission-common
transmission-gtk
trash-cli
ubuntu-artwork
ubuntu-docs
ubuntu-drivers-common
ubuntu-mono
ubuntu-release-upgrader-gtk
ubuntu-report
ubuntu-session
ubuntu-settings
ubuntu-software
ubuntu-sounds
ubuntu-system-service
ubuntu-wallpapers
ubuntu-wallpapers-bionic
ubuntu-web-launchers
udiskie
udisks2
uno-libs3
unrar
unzip
update-inetd
update-manager
update-notifier
update-notifier-common
upower
upwork
ure
usb-creator-common
usb-creator-gtk
usb-modeswitch
usb-modeswitch-data
usbmuxd
uthash-dev
v4l2loopback-utils
vamp-plugin-sdk
vbetool
vdpau-va-driver
vino
vmpk
w3m-img
whoopsie
whoopsie-preferences
wireless-tools
wmctrl
wpasupplicant
x11-apps
x11proto-record-dev
x11-session-utils
x11-xkb-utils
xautolock
xbitmaps
xbrlapi
xcape
xcb
xclip
xcursor-themes
xdg-desktop-portal-gtk
xdg-user-dirs-gtk
xdotool
xfonts-base
xfonts-terminus
xinit
xinput
xorg
xorg-docs-core
xserver-common
xserver-xephyr
xserver-xorg
xserver-xorg-core
xserver-xorg-input-all
xserver-xorg-input-libinput
xserver-xorg-input-wacom
xserver-xorg-legacy
xserver-xorg-video-all
xserver-xorg-video-amdgpu
xserver-xorg-video-ati
xserver-xorg-video-fbdev
xserver-xorg-video-intel
xserver-xorg-video-nouveau
xserver-xorg-video-qxl
xserver-xorg-video-radeon
xserver-xorg-video-vesa
xserver-xorg-video-vmware
xsltproc
xterm
xul-ext-ubufox
xwayland
xxkb
yandex-disk
yelp
yelp-xsl
zathura
zeal
zeitgeist-core
zenity
zenity-common
zip
zlib1g-dev

fzf
googler

mkdir -p ~/bin
curl -o ~/bin/tldr https://raw.githubusercontent.com/raylee/tldr/master/tldr
chmod +x ~/bin/tldr

marker - bookmark commands
hstr
parallel
xsv

thefuck
sshfs
ripgrep

sshrc #no

https://github.com/Xfennec/progress

ncurses-bin

https://github.com/github/hub

https://github.com/mrowa44/emojify

https://github.com/magicmonty/bash-git-prompt

 npm install --global base16-builder

nvm

lnav

rtv

pip install git+https://github.com/donnemartin/haxor-news.git


sejda # pdf tools

jq

https://github.com/lukechilds/gifgen

https://github.com/mrzool/bash-sensible

hstr

https://github.com/alexanderepstein/Bash-Snippets
wmctrl



Key Promoter X
ideavim
vim-multiple-cursors
tab-shifter
AceJump
Run Configuration as Action
Nyan Progress Bar
Rainbow Brackets
String Manipulation fr
termdown
