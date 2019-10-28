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
