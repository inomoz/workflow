git clone --recursive -j8 git@github.com:inomoz/dotfiles.git ~/dotfiles/ # clone to home directory
# replace to `git clone --recursive -j8  https://github.com/inomoz/dotfiles.git`
# if does't work for you
cd ~/dotfiles
./create_symbolic_links.sh # It's can replace your config files! be careful. 



```
.profile

# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

export EDITOR=nvim

export QT_STYLE_OVERRIDE=kvantum
export QT_AUTO_SCREEN_SCALE_FACTOR=1

# Disable API key warning in Chromium browser
export GOOGLE_API_KEY="api_key"
export GOOGLE_DEFAULT_CLIENT_ID="client_id"
export GOOGLE_DEFAULT_CLIENT_SECRET="client_secret"

# Load Node Version Manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm

# Load pyenv
export PATH="~/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

export PATH="$HOME/.cargo/bin:$PATH"
export PATH=$PATH:/usr/local/go/bin:$HOME/go/bin
```


# Gitignore
```
# IntellJ project specific files
.idea/

# Git Credential files
.gitconfig.local

# Python
*.pyc

# Node
node_modules/

# Folder view configuration files
.DS_Store
Desktop.ini

# Thumbnail cache files
._*
Thumbs.db

# Fish Shell
fishd.*
.config/fish/fish_history
fish/fish_history

# Temporary files
tmp/
trash/
```

# Git config
```
# Use separate file for username / github token / etc
[include]
  path = ~/.gitconfig.local

[core]
	excludesfile = ~/.gitignore
	attributesfile = ~/.gitattributes
	pager = diff-so-fancy | less --tabs=4 -RFX
[color]
	ui = true
[color "diff-highlight"]
	oldNormal = red bold
	oldHighlight = red bold 52
	newNormal = green bold
	newHighlight = green bold 22
[color "diff"]
	meta = 227
	frag = magenta bold
	commit = 227 bold
	old = red bold
	new = green bold
	whitespace = red reverse
```

# Desktop file template
```
[Desktop Entry]
Categories=Other
Comment=
Encoding=UTF-8
Exec=
Exec=/bin/bash -c "sleep 8 && /usr/bin/xcape -e Control_L=Escape"
Name=Xcape Control_L=Escape
Type=Application
Version=1.0
X-GNOME-Autostart-enabled=true
```

# NVM install script
```
#!/usr/bin/env bash

export NVM_DIR="$HOME/.nvm" && (
  git clone https://github.com/inomoz/nvm.git "$NVM_DIR"
  cd "$NVM_DIR"
  git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" origin`
) && . "$NVM_DIR/nvm.sh"
```

# NVM upgrade script
```
#!/usr/bin/env bash

(
  cd "$NVM_DIR"
  git fetch origin
  git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" origin`
) && . "$NVM_DIR/nvm.sh"
```

```
HR script
COLS="$(tput cols)"
if (( COLS <= 0 )) ; then
    COLS="${COLUMNS:-80}"
fi

hr() {
    local WORD="$1"
    if [[ -n "$WORD" ]] ; then
        local LINE=''
        while (( ${#LINE} < COLS ))
        do
            LINE="$LINE$WORD"
        done

        echo "${LINE:0:$COLS}"
    fi
}

hrs() {
    local WORD

    for WORD in "${@:-#}"
    do
        hr "$WORD"
    done
}

[ "$0" == "$BASH_SOURCE" ] && hrs "$@"
```

## Spark
https://github.com/holman/spark

## TLDR
https://github.com/raylee/tldr

## GifGen Script
```
#!/bin/bash

# Echo help/usage message
show_help() {
  echo "gifgen 1.1.2"
  echo
  echo "Usage: gifgen [options] [input]"
  echo
  echo "Options:"
  echo "  -o   Output file [input.gif]"
  echo "  -f   Frames per second [10]"
  echo "  -s   Optimize for static background"
  echo "  -v   Display verbose output from ffmpeg"
  echo
  echo "Examples:"
  echo "  $ gifgen video.mp4"
  echo "  $ gifgen -o demo.gif SCM_1457.mp4"
  echo "  $ gifgen -sf 15 screencap.mov"
}

# Setup defaults
pid=$$
palette="/tmp/gif-palette-$pid.png"
fps="10"
verbosity="warning"
stats_mode="full"
dither="sierra2_4a"

# Parse args
while getopts "hi:o:f:sv" opt; do
  case "$opt" in
    h)
      show_help=true
      ;;
    o)
      output=$OPTARG
      ;;
    f)
      fps=$OPTARG
      ;;
    s)
      stats_mode="diff"
      dither="none"
      ;;
    v)
      verbosity="info"
      ;;
  esac
done
shift "$((OPTIND-1))"
# Grab input file from end of command
input=$1

# Show help and exit if we have no input
[[ "$input" = "" ]] || [[ $show_help = true ]] && show_help && exit

# Check for ffmpeg before encoding
type ffmpeg >/dev/null 2>&1 || {
  echo "Error: gifgen requires ffmpeg to be installed"
  exit 1
}

# Set output if not specified
if [[ "$output" = "" ]]; then
  input_filename=${input##*/}
  output=${input_filename%.*}.gif
fi

# Encode GIF
echo "Generating palette..."
ffmpeg -v "$verbosity" -i "$input" -vf "fps=$fps,palettegen=stats_mode=$stats_mode" -y "$palette"
[[ "$verbosity" = "info" ]] && echo
echo "Encoding GIF..."
ffmpeg -v "$verbosity" -i "$input" -i "$palette" -lavfi "fps=$fps [x]; [x][1:v] paletteuse=dither=$dither" -y "$output"
echo "Done!"
```


### Some config from Fish
```
# bin
set -x PATH "$HOME/bin" $PATH

set -x PATH "$HOME/.pyenv/bin" $PATH
status --is-interactive; and . (pyenv init -|psub)
status --is-interactive; and . (pyenv virtualenv-init -|psub)

# Direnv
eval (direnv hook fish)

# FZF binary
set -x PATH "$HOME/.fzf/bin" $PATH

# TheFuck alias
thefuck --alias | source

# Exa alias
alias ls='exa -l --git'

# Rust env
source $HOME/.cargo/env

# Go path
set -x PATH "$HOME/go/bin" $PATH
set -x PATH "/usr/local/go/bin" $PATH
```

# Inotify function
function inotify --description "inotify <source> <command>"
  echo $argv | read -l source command
  while inotifywait -e close_write $source; eval $command; end
end

#nvm function
source ~/.nvm/nvm.sh --no-use ';' nvm $argv

# yank-cli


## TODO
complections:
fasd
fasd_cd
fzf_key_bindings










-----------


# Some useful, mostly cross-platform CLI tools, here instructions how install them on Ubuntu

- [Fisherman](https://github.com/fisherman/fisherman) - The fish-shell plugin manager.
    ```$bash
        curl -Lo ~/.config/fish/functions/fisher.fish \
        --create-dirs https://raw.githubusercontent.com/inomoz/fisherman/master/fisher.fish
    ``` 

- [Direnv](https://github.com/direnv/direnv) - Unclutter your .profile.
    ```bash
    sudo apt install direnv
    # add to fish config `eval (direnv hook fish)`
    ```
    [Usage](https://github.com/direnv/direnv#usage)

- [fasd](https://github.com/clvv/fasd) - Command-line productivity booster, offers quick access to files and directories, inspired by autojump, z and v.
    ```bash
    sudo apt install -y fasd
    fisher inomoz/fasd
    ```
    [Examples](https://github.com/clvv/fasd#examples) |
    [Introduction](https://github.com/clvv/fasd#introduction)
    
- [fzf](https://github.com/junegunn/fzf) - General-purpose command-line fuzzy finder.
    
    ```
    fisher fzf
    ```
    
- [googler](https://github.com/jarun/googler) - Google Search, Google Site Search, Google News from the terminal
    ```
    sudo apt install -y googler
    ```
    [usage](https://github.com/jarun/googler#usage)
    
- [surfraw](http://surfraw.alioth.debian.org) - Command line interface to a variety of popular WWW search engines
    ```bash
        sudo apt install surfraw
    ``` 
    
    # trash-cli
    sudo apt install trash-cli
    ```
    trash-put           trash files and directories.
    trash-empty         empty the trashcan(s).
    trash-list          list trashed files.
    trash-restore       restore a trashed file.
    trash-rm            remove individual files from the trashcan.
    ```
    
    http://www.gnu.org/software/parallel/
    
    
    https://github.com/mooz/percol
    sudo pip2 install percol
    https://github.com/mooz/percol#usage
    
    
    https://github.com/holman/spark
    https://github.com/holman/spark#usage
    curl -s https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/2.5_day.csv | sed '1d' | cut -d, -f5 | spark
    
    
    https://github.com/libfuse/sshfs
    sudo apt install sshfs
    sudo sshfs -o allow_other,defer_permissions root@xxx.xxx.xxx.xxx:/ /mnt/droplet
    
    
    https://github.com/Russell91/sshrc
    
    
    https://github.com/nvbn/thefuck
    sudo apt install thefuck
    add to config.fish `thefuck --alias | source`
    
    
    
    https://github.com/tldr-pages/tldr/
    curl -o bin/tldr https://raw.githubusercontent.com/raylee/tldr/master/tldr
    
    
    https://github.com/zolrath/wemux
    Multi-User Tmux Made Easy
    
    
    https://github.com/sindresorhus/emoj
    npm install --global emoj
    emoj [text]
    
    https://github.com/jarun/bcal
    sudo apt install bcal
    
    
    Count Lines of Code
    https://github.com/AlDanial/cloc
    sudo apt install cloc
    cloc ubuntu.sh
    
    Little git extras.
    https://github.com/tj/git-extras
    sudo apt-get install git-extras
    https://github.com/tj/git-extras/blob/master/Commands.md#examples-1
    
    Type git open to open the repo website (GitHub, GitLab, Bitbucket) in your browser.
    https://github.com/paulirish/git-open
    npm install --global git-open
    
    
    hub is a command line tool that wraps git in order to extend it with extra features and commands that make working with GitHub easier.
    https://github.com/github/hub
    cd /tmp
    wget -qO- https://github.com/github/hub/releases/download/v2.3.0-pre10/hub-linux-amd64-2.3.0-pre10.tgz | tar xvz # 2.3.0-pre10 - can be other verson
    less ./hub-linux-amd64-2.3.0-pre10/install
    sudo ./hub-linux-amd64-2.3.0-pre10/install
    add to fish config /usr/share/fish/functions/git.fish
    ```
    function git --wraps hub --description 'Alias for hub, which wraps git to provide extra functionality with GitHub.'
        hub $argv
    end
    ``
    
    diff-so-fancy strives to make your diff's human readable instead of machine readable. This helps improve code quality and help you spot defects faster.
    https://github.com/so-fancy/diff-so-fancy
    npm install --global diff-so-fancy
    git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"
    https://github.com/so-fancy/diff-so-fancy#improved-colors-for-the-highlighted-bits
    
    
    
    
    
    
    
    
    # Git up config
    # fetch and rebase all locally-tracked remote branches
    git config --global alias.up 'pull --rebase --autostash'
    # If you'd rather this happened on every git pull, then you can do this:
    git config --global pull.rebase true
    git config --global rebase.autoStash true
    
    
    https://github.com/pre-commit/pre-commit
    pip install pre-commit
    http://pre-commit.com/#usage
    
    
    
    # ripgrep combines the usability of The Silver Searcher with the raw speed of grep.
    https://github.com/BurntSushi/ripgrep
    cargo install ripgrep # require rust
    https://github.com/BurntSushi/ripgrep#whirlwind-tour
    `rg ubuntu`
    
    
    tag - Tag your rg/ag matches
    https://github.com/aykamko/tag
    go get -u github.com/aykamko/tag/...
    go install github.com/aykamko/tag
    add to fish
    ```
    # Go binary path - if needed
    ```
    # Go path
    set -x PATH "$HOME/go/bin" $PATH
    ```
    # Fish
    nvim ~/.config/fish/functions/tag.fish
    function tag
        set -x TAG_SEARCH_PROG ag  # replace with rg for ripgrep
        set -q TAG_ALIAS_FILE; or set -l TAG_ALIAS_FILE /tmp/tag_aliases
        command tag $argv; and source $TAG_ALIAS_FILE ^/dev/null
        alias rg tag  # replace with ag for The Silver Search
    end
    
    
    aria2 - The ultra fast download utility
    https://github.com/aria2/aria2
    sudo apt install aria2
    https://aria2.github.io/manual/en/html/aria2c.html#example
    aria2c "https://www.google.ru/images/branding/googlelogo/2x/googlelogo_color_272x92dp.png"
    
    
    HTTPie: a CLI, cURL-like tool for humans
    https://github.com/jakubroztocil/httpie !!!
    sudo apt install httpie
    https://github.com/jakubroztocil/httpie#examples
    http httpie.org
    
    
    
    mpv
    sudo apt install mpv
    
    youtube-dl
    https://github.com/rg3/youtube-dl
    sudo apt install youtube-dl
    
    mpv "https://www.youtube.com/watch?v=0RvIbVmCOxg"
    env BROWSER=mpv googler --first --noprompt  "Tearing test @60fps" # it's magic !
    
    
    Simple high quality GIF encoding
    https://github.com/lukechilds/gifgen  # ffmpeg dependency
    wget -O bin/gifgen https://raw.githubusercontent.com/lukechilds/gifgen/master/gifgen; chmod +x bin/gifgen
    gifgen -h
    
    
    https://github.com/sananth12/ImageScraper
    pip install ImageScraper
    https://github.com/sananth12/ImageScraper#examples
    image-scraper -s img -m 1 https://imgur.com/gallery/ilPjX
    xdg-open img/*.jpg
    
    jq is a lightweight and flexible command-line JSON processor.
    https://github.com/stedolan/jq
    sudo apt install jq
    https://stedolan.github.io/jq/tutorial/
    curl 'https://api.github.com/repos/stedolan/jq/commits?per_page=5' | jq '.[0] | {message: .commit.message, name: .commit.committer.name}'
    
    
    
    
    https://github.com/donnemartin/haxor-news
    pip install haxor-news
    hn top
    haxor-news
    
    RTV provides an interface to view and interact with reddit from your terminal.
    https://github.com/michael-lazar/rtv
    pip install rtv
    rtv --help
    
    https://github.com/orakaro/rainbowstream
    sudo apt install python-dev libjpeg-dev libfreetype6 libfreetype6-dev zlib1g-dev
    pip install rainbowstream
    
    
    https://github.com/djadmin/medium-cli
    npm install -g mediumcli
    medium --help
    
    
    https://github.com/dutchcoders/transfer.sh # no need install, just use curl and gpg
    Upload:
    curl --upload-file ./hello.txt https://transfer.sh/hello.txt
    Encrypt & upload:
    cat /tmp/rofel|gpg -ac -o-|curl -X PUT --upload-file "-" https://transfer.sh/rofel
    Download & decrypt:
    curl https://transfer.sh/KsEKe/rofel|gpg -o- > /tmp/rofel
    Upload to virustotal:
    curl -X PUT --upload-file nhgbhhj https://transfer.sh/test.txt/virustotal
    
    
    A URL status checker CLI.
    https://github.com/ellisonleao/vl
    
    
    The freegeoip API
    https://github.com/fiorix/freegeoip # no need install, just use curl
    curl freegeoip.net/json/ | jq
    curl freegeoip.net/json/github.com | jq
    
    
    
    
    
    
    
    
    
    
    
    # Just what you've always wanted, it's a caniuse command line tool! All the power of caniuse.com with none of the nice UI or interactivity!
    https://github.com/sgentle/caniuse-cmd
    npm install -g caniuse-cmd
    caniuse websockets
    
    
    
    
    
    
    maim (make image) takes screenshots of your desktop.
    https://github.com/naelstrof/maim
    sudo apt install maim
    or (if not working)
    
    sudo apt install libjpeg-dev libgl1-mesa-dev cmake libicu-dev libxrandr-dev libxfixes-dev libglm-dev libxcomposite-dev
    cd /tmp
    git clone https://github.com/naelstrof/maim.git
    cd maim
    cmake -DCMAKE_INSTALL_PREFIX="/usr" ./
    make && sudo make install
    https://github.com/naelstrof/maim#examples
    
    
    cd /tmp
    git clone https://github.com/naelstrof/maim.git
    cd maim
    cmake -DCMAKE_INSTALL_PREFIX="/usr" ./
    make && sudo make install
    Examples
    
    https://github.com/naelstrof/maim#examples
    
    
    recordmydesktop
    recordMyDesktop is desktop session recorder for GNU / linux
    sudo apt-get install recordmydesktop gtk-recordmydesktop
    launch and control via tray icon
    
    
    Yank terminal output to clipboard.
    https://github.com/mptre/yank
    sudo apt-get install yank
    create fish function
    ~/.config/fish/functions/yank.fish
    ```
    function yank
        yank-cli
    end
    ```
    https://github.com/mptre/yank#examples
    env | yank -d =
    
    
    # Licenses api
    https://api.github.com/licenses
    
    list licenses
    curl https://api.github.com/licenses | jq -c '.[]' | jq '[.key, .url] | .[]'
    curl https://api.github.com/licenses/mit | jq '.body'
    
    export license_name='mit'; \
    export license_owner='Inom T.'; \
    export current_year=(date +'%Y'); \
    curl https://api.github.com/licenses/$license_name | jq --raw-output '.body' | \
    sed -r "s/\[year\]+/$current_year/g; s/\[fullname\]+/$license_owner/g" > $license_name\.txt
    
    simple currency conversion cli (supports BTC/ETH) Edit
    https://github.com/srn/currency
    npm i -g git+https://github.com/inomoz/currency
    currency --help
    
    https://github.com/rastapasta/mapscii
    telnet mapscii.me
    
    
    instant coding answers via the command line
    https://github.com/gleitz/howdoi
    pip install howdoi
    https://github.com/gleitz/howdoi#usage
    howdoi format date bash
    
    
    
    
    
    
    
    Generates table of contents for markdown files inside local git repository.
    https://github.com/thlorenz/doctoc
    npm install -g doctoc
    
    
    exa is a replacement for ls written in Rust.
    https://github.com/ogham/exa
    cargo install exa
    
    
    GoTTY - Share your terminal as a web application
    https://github.com/yudai/gotty
    go get github.com/yudai/gotty # requre go lang
    Usage: gotty [options] <command> [<arguments...>]
    gotty tmux new -A -s gotty top
    
    
    https://github.com/localtunnel/localtunnel
    npm install -g localtunnel
    lt --port 8000
    
    
    https://github.com/asciinema/asciinema
    pip3 install asciinema
    asciinema rec first.cast
    asciinema play first.cast
    
    https://github.com/tav/asciinema2gif
    sudo apt install imagemagick gifsicle
    npm install --global phantomjs2
    https://github.com/asciinema/asciicast2gif
    npm install -g asciicast2gif
    asciicast2gif first.cast demo.gif
    xdg-open demo.gif
    
    
    
    Are you sure? Are you one hundred percent sure?
    https://github.com/p-e-w/maybe
    pip install maybe # - better to use VM and trace tool?
    maybe <command>
    
    
    # Specific
    
    Modular visual interface for GDB in Python
    https://github.com/cyrus-and/gdb-dashboard
    wget -P ~ git.io/.gdbinit
    
    # Locust Load Testing
    https://docs.locust.io/en/latest/quickstart.html
    
    # A REPL for Postgres
    https://github.com/dbcli/pgcli
    
    
    # Manuals > RTFM
    https://ledger-ru.github.io/todotxt/
    https://github.com/Idnan/bash-guide
    https://github.com/jlevy/the-art-of-command-line
    https://www.learnenough.com/command-line-tutorial
    http://wiki.bash-hackers.org/
    https://google.github.io/styleguide/shell.xml
    
    
    # TODO
    http://www.mutt.org/



#!/usr/bin/env bash
set -e # Automatic exit from bash shell script on error

# Create needed directories inint variables, and go to script directory
cd "$( dirname "${BASH_SOURCE[0]}" )"
mkdir -p tmp

# Update system
sudo apt update && sudo apt upgrade

# Installing fish shell
sudo apt install fish
chsh -s `which fish`

# Configure system
sudo apt install -y dconf-tools
gsettings set org.gnome.desktop.interface enable-animations false # Disable Animations, more here https://askubuntu.com/a/689612
gsettings set org.compiz.unityshell:/org/compiz/profiles/unity/plugins/unityshell/ launcher-minimize-window true # Automatically bring an activated window to the foreground, https://askubuntu.com/a/594301/638137
gsettings set org.compiz.unityshell:/org/compiz/profiles/unity/plugins/unityshell/ shortcut-overlay false # Disable shortcuts overlay
gsettings set org.compiz.unityshell:/org/compiz/profiles/unity/plugins/unityshell/ disable-show-desktop true # Disable desktop in alt+tab

# Add specific hotkeys
# gsettings set org.gnome.desktop.input-sources current 0 # us
# gsettings set org.gnome.desktop.input-sources current 1 # ru
# text entry > keyboard settings

# Installing useful binaries
sudo apt install -y tmux \
                        neovim \
                        git \
                        imagemagick \
                        p7zip-full \
                        unity-tweak-tool \
                        gnome-tweak-tool \
                        wget \
                        unzip \
                        curl \
                        inotify-tools \
                        xclip \
                        libncurses5 libncurses5-dev libncursesw5

# Use neovim as default editor
sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60
sudo update-alternatives --config vi
sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
sudo update-alternatives --config vim
sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60
sudo update-alternatives --config editor

# Replace CAPS to Scroll Lock
sudo cp /etc/default/keyboard tmp/keyboard.bak
sudo cp os/keyboard /etc/default/keyboard
sudo dpkg-reconfigure keyboard-configuration

# Install xcape
sudo apt install -y xcape
cp os/xcape.desktop ~/.config/autostart/

# Install fonts
sudo apt install -y fonts-powerline \
                        fonts-hack-otf \
                        fonts-noto \
                        ttf-mscorefonts-installer

# Install papirus icon theme and kvantum (also remove repo - disable updates)
# kvantum - A Linux SVG-based theme engine for Qt4/Qt5 and KDE, you also need add `export QT_STYLE_OVERRIDE=kvantum` into your ~/.profile
sudo add-apt-repository ppa:papirus/papirus
sudo apt update
sudo apt install -y papirus-icon-theme kvantum
sudo add-apt-repository ppa:papirus/papirus --remove
sudo apt update

# Disable evolution services
DBUS_SERVICES_DIR=/usr/share/dbus-1/services
if [ -d "$DBUS_SERVICES_DIR" ]; then
    cd $DBUS_SERVICES_DIR
    sudo ln -snf /dev/null  org.gnome.evolution.dataserver.AddressBook.service
    sudo ln -snf /dev/null  org.gnome.evolution.dataserver.Calendar.service
    sudo ln -snf /dev/null  org.gnome.evolution.dataserver.Sources.service
    sudo ln -snf /dev/null  org.gnome.evolution.dataserver.UserPrompter.service
fi

# Disable CUPS (warning, required if you want use printer!)
sudo systemctl stop cups
sudo systemctl stop cups-browsed
sudo systemctl disable cups
sudo systemctl disable cups-browsed


# Configure shell

# Fix IntelliJ fish config if needed
# ../.local/share/JetBrains/Toolbox/apps/IDEA-U/ch-0/173.3727.127/plugins/terminal/fish
#
# if test -d ~/.config/fish/functions
#  for f in ~/.config/fish/functions/*.fish
#    source $f
#  end
#end

#
#if test -f ~/.config/fish/fishd.*
#  . ~/.config/fish/fishd.*
#end


# Install fish shell, some config already exist
sudo apt-add-repository ppa:fish-shell/release-2
sudo apt update
sudo apt install fish

# Update microcode
sudo apt install -y intel-microcode

# Add Graphic Drivers repository
# https://launchpad.net/~graphics-drivers/+archive/ubuntu/ppa
sudo add-apt-repository ppa:graphics-drivers/ppa
sudo apt update && sudo apt upgrade

# Install properital drivers
sudo apt install -y nvidia-384 nvidia-prime
sudo prime-select intel

# Fix intel tearing
sudo cp os/20-intel.conf /usr/share/X11/xorg.conf.d/20-intel.conf

echo "YOU NEED REBOOT!"


# Install node with configured nvm
./bin/nvm_install.sh
nvm install node

# Install pyenv
sudo apt install -y build-essential \
                        libbz2-dev \
                        libssl-dev \
                        libreadline-dev \
                        libsqlite3-dev tk-dev

./pyenv-installer/bin/pyenv-installer
pyenv install 3.6.3
pyenv global 3.6.3

# Install rust
cd /tmp
wget -O rustup-init https://sh.rustup.rs/
chmod +x ./rustup-init
less ./rustup-init
./rustup-init
# add to config `source $HOME/.cargo/env`

# Install go
cd /tmp
curl -O https://storage.googleapis.com/golang/go1.9.2.linux-amd64.tar.gz # change 1.9.2 to your version
sudo tar -C /usr/local -xzf go1.9.2.linux-amd64.tar.gz

# add to path / fish
# ~/.profile
# export PATH=$PATH:/usr/local/go/bin:$HOME/go/bin
# set -x PATH "$HOME/go/bin" $PATH
# set -x PATH "/usr/local/go/bin" $PATH

# not included:
# https://www.pcsuggest.com/nvidia-optimus-ubuntu/







