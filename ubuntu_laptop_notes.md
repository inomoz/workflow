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







# Draft
#!/bin/bash
set -o pipefail
set -s

#####
# This script will take a fresh KDE Neon install and make it suitable for getting stuff done.
# It may not work against another Ubuntu Installation type.
# Run it with: bash <(wget -qO- https://git.io/vSe77)
#####

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
EOF

##### add extra repos
sudo add-apt-repository -y ppa:libreoffice/ppa # latest version
sudo add-apt-repository -y ppa:webupd8team/sublime-text-3 # text editor
sudo add-apt-repository -y ppa:nextcloud-devs/client # nextcloud client
sudo add-apt-repository -y ppa:ubuntu-mozilla-security/ppa # latest firefox
sudo add-apt-repository -y ppa:canonical-chromium-builds/stage # latest chromium
sudo add-apt-repository -y ppa:paulo-miguel-dias/pkppa # latest stable mesa graphics
sudo add-apt-repository -y ppa:webupd8team/java # oracle java
#sudo add-apt-repository -y ppa:troxor/autokey # latest version of text expander

# google chrome
sudo tee /etc/apt/sources.list.d/google-chrome.list <<< "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main"
wget -qO- https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
# spotify
sudo tee /etc/apt/sources.list.d/spotify.list <<< "deb http://repository.spotify.com testing non-free"
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 0DF731E45CE24F27EEEB1450EFDC8610341D9410
# misc apps and games
sudo tee /etc/apt/sources.list.d/getdeb.list <<< "deb http://mirrors.dotsrc.org/getdeb/ubuntu xenial-getdeb apps games"
wget -qO- http://archive.getdeb.net/getdeb-archive.key | sudo apt-key add -
# zulu java
#sudo tee /etc/apt/sources.list.d/zulu.list <<< "deb http://repos.azulsystems.com/ubuntu stable main"
#sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 0x219BD9C9
# wine
sudo apt-add-repository -y https://dl.winehq.org/wine-builds/ubuntu/
wget -qO- https://dl.winehq.org/wine-builds/Release.key | sudo apt-key add -
# signal
wget -qO- https://updates.signal.org/desktop/apt/keys.asc | sudo apt-key add -
sudo tee /etc/apt/sources.list.d/signal-xenial.list <<< "deb [arch=amd64] https://updates.signal.org/desktop/apt xenial main"

# automated installation
#sudo debconf-set-selections <<< 'oracle-java8-installer shared/accepted-oracle-licence-v1-1 boolean true'
sudo debconf-set-selections <<< 'oracle-java9-installer shared/accepted-oracle-license-v1-1 select true'
sudo debconf-set-selections <<< 'ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true'

##### upgrade system
sudo apt update
sudo apt -y dist-upgrade

##### install useful apps
sudo apt install \
    aptitude \
    aria2 \
    atop \
    audacity \
    autossh \
    build-essential \
    chromium-browser \
    chromium-codecs-ffmpeg-extra \
    davfs2 \
    digikam \
    dos2unix \
    exfat-utils \
    ffmpeg \
    flashplugin-installer \
    flatpak \
    git-core \
    gir1.2-gnomekeyring-1.0 \
    gvfs \
    gvfs-bin \
    google-chrome-stable \
    hunspell-en-us \
    htop \
    iotop \
    kcalc \
    kgpg \
    libjpeg62:i386 \
    libxtst6:i386 \
    libgck-1-0 \
    libgcr-3-common \
    libgcr-base-3-1 \
    libgnome-keyring-common \
    libgnome-keyring0 \
    lsb \
    lxc2 \
    mtr \
    mumble \
    network-manager-openvpn \
    network-manager-vpnc \
    nextcloud-client \
    nload \
    oracle-java9-installer \
    oracle-java9-set-default \
    p7zip-rar \
    pavucontrol \
    partitionmanager \
    pidgin-extprefs \
    pidgin-libnotify \
    pidgin-plugin-pack \
    pinta \
    playonlinux \
    powertop \
    pv \
    pycharm \
    pylint \
    pylint3 \
    python3-hunspell \
    qbittorrent \
    qemu-kvm \
    remmina \
    remmina-plugin-{nx,rdp,vnc} \
    shellcheck \
    signal-desktop \
    spotify-client \
    sshfs \
    sshpass \
    steam \
    sublime-text-installer \
    tlp \
    tlp-rdw \
    ubuntu-virt-mgmt \
    ubuntu-virt-server \
    udftools \
    umbrello \
    unrar \
    spectacle \
    vlc \
    virt-manager \
    virt-goodies \
    virt-top \
    winehq-stable \
    zfsutils-linux \
    $(# detect platform and install kernel+modules
    if systemd-detect-virt --vm | grep -i vmware >/dev/null ; then
        echo linux-{cloud-tools,headers,image,tools}-virtual-hwe-16.04-edge open-vm-tools-desktop
    elif systemd-detect-virt --vm | grep -i oracle >/dev/null ; then
        echo linux-{cloud-tools,headers,image,tools}-virtual-hwe-16.04-edge virtualbox-guest-{x11,utils,dkms}
    elif systemd-detect-virt --vm | grep -iP 'kvm|qemu' >/dev/null ; then
        echo linux-{cloud-tools,headers,image,tools}-virtual-hwe-16.04-edge qemu-guest-agent
    elif systemd-detect-virt --vm --quiet ; then
        echo linux-{cloud-tools,headers,image,tools}-virtual-hwe-16.04-edge
    elif grep -i intel /proc/cpuinfo >/dev/null ; then
        echo linux-{cloud-tools,headers,image,tools}-generic-hwe-16.04-edge intel-microcode
    elif grep -i amd /proc/cpuinfo >/dev/null ; then
        echo linux-{cloud-tools,headers,image,tools}-generic-hwe-16.04-edge amd64-microcode
    else 
        echo linux-{cloud-tools,headers,image,tools}-generic-hwe-16.04-edge
    fi)

#sudo apt-get -fyo Dpkg::Options::="--force-overwrite" install
sudo apt dist-upgrade

##### add some packages that have no readily available repositories
sudo mkdir -vp /tmp/extra-debs
cd /tmp/extra-debs
sudo wget "https://go.microsoft.com/fwlink/?LinkID=760868" -O vs-code-amd64.deb
sudo wget -c \
https://go.skype.com/skypeforlinux-64.deb \
http://dbeaver.jkiss.org/files/dbeaver-ce_latest_amd64.deb \
https://downloads.slack-edge.com/linux_releases/slack-desktop-2.8.2-amd64.deb \
https://github.com/magkopian/keepassxc-debian/releases/download/2.2.2-1/keepassxc_2.2.2-1_amd64_16.04_xenial.deb \
# install them and fix their broken dependencies
sudo dpkg -i *.deb
sudo rm -v *.deb
#sudo apt-get -f install

sudo apt -y autoremove
sudo apt -y autoclean
sudo apt -y clean

##### fix umbrello shortcut
sudo ln -sv /usr/bin/umbrello5 /usr/bin/umbrello || true

mkdir -vp ~/.local/share/applications

# add the official adobe flash plugin for firefox
# sudo wget https://fpdownload.macromedia.com/pub/labs/flashruntimes/flashplayer/linux64/libflashplayer.so -O /usr/lib/mozilla/plugins/flashplugin-alternative.so

# add the official pepper flash player for chromium
sudo mkdir -vp /usr/lib/adobe-flashplugin
wget -O- https://fpdownload.macromedia.com/pub/labs/flashruntimes/flashplayer/linux64/flash_player_ppapi_linux.x86_64.tar.gz | sudo tar -xzvC /usr/lib/adobe-flashplugin/ libpepflashplayer.so

# add official android fastboot and adb
sudo wget https://dl.google.com/android/repository/platform-tools-latest-linux.zip -O /tmp/android-platform-tools.zip
sudo unzip -q /tmp/android-platform-tools.zip -d /opt/android/
sudo find /opt/android -mindepth 2 -maxdepth 2 -executable -type f -exec ln -sv {} /usr/bin/ \;

# fix suspedn
https://askubuntu.com/questions/1038375/when-resuming-from-suspend-dekstop-icons-glitch-out-nvidia-problem
