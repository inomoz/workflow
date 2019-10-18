git clone --recursive -j8 git@github.com:inomoz/dotfiles.git ~/dotfiles/ # clone to home directory
# replace to `git clone --recursive -j8  https://github.com/inomoz/dotfiles.git`
# if does't work for you
cd ~/dotfiles
./create_symbolic_links.sh # It's can replace your config files! be careful. 

# dotfiles
Sensible OS defaults

# Getting Started
Required to quick install:
- rsync
- git

# Editor config
```
#--
# EditorConfig helps developers define and maintain consistent
# coding styles between different editors and IDEs.
#
# The EditorConfig project consists of a file format for defining
# coding styles and a collection of text editor plugins that enable
# editors to read the file format and adhere to defined styles. 
#
# http://editorconfig.org
#++

# top-most EditorConfig file
root = true

[*]
# Default indent style
indent_style = space
trim_trailing_whitespace = true

# Unix-style newlines with a newline ending every file
end_of_line = lf
insert_final_newline = true

# Default encoding
charset = utf-8
```


```
./bootstrap.sh
#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

git pull origin master;

function doIt() {
	rsync   --exclude "doc/" \
                --exclude "other/" \
	        --exclude ".git/" \
	        --exclude ".idea/" \
		--exclude ".DS_Store" \
		--exclude "bootstrap.sh" \
		--exclude "README.md" \
		--exclude "LICENSE.txt" \
		-avh --no-perms . ~;
	echo Restart your terminal
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt;
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt;
	fi;
fi;
unset doIt;
```

# Windows stuff
```

/*
 * Windows installation script
 *
 * How run this script:
 * cmd < .windows > NUL
 */

rem VMware Workstation
rem SFTP Net Drive 2017
rem Windows10 DPI Fix
rem ShareX
rem SharpKeys
rem NeoVim
rem Winaero Tweaker
rem uTorrent
rem PotPlayer
rem AdobePhotoshop

rem Installing Chocolatey (package manager for Windows)
rem PowerShell v3+
iwr https://chocolatey.org/install.ps1 -UseBasicParsing | iex

Chrome
Safari
Firefox
IE
```

# ENV
```
# High DPI env. variables
export GDK_DPI_SCALE=0.33
export GDK_SCALE=3
export QT_DEVICE_PIXEL_RATIO=auto

# Fix vmware
export VMWARE_USE_SHIPPED_LIBS=yes

#!/usr/bin/env bash

# Make vim the default editor.
export EDITOR='nvim';

# Enable persistent REPL history for `node`.
export NODE_REPL_HISTORY=~/.node_history;
# Allow 32³ entries; the default is 1000.
export NODE_REPL_HISTORY_SIZE='32768';
# Use sloppy mode by default, matching web browsers.
export NODE_REPL_MODE='sloppy';

# Make Python use UTF-8 encoding for output to stdin, stdout, and stderr.
export PYTHONIOENCODING='UTF-8';

# Increase Bash history size. Allow 32³ entries; the default is 500.
export HISTSIZE='32768';
export HISTFILESIZE="${HISTSIZE}";
# Omit duplicates and commands that begin with a space from history.
export HISTCONTROL='ignoreboth';

# Prefer US English and use UTF-8.
export LANG='en_US.UTF-8';
export LC_ALL='en_US.UTF-8';

# Highlight section titles in manual pages.
export LESS_TERMCAP_md="${yellow}";

# Don’t clear the screen after quitting a manual page.
export MANPAGER='less -X';

# High DPI env. variables
export GDK_DPI_SCALE=0.33
export GDK_SCALE=3
export QT_DEVICE_PIXEL_RATIO=auto

# Fix vmware
export VMWARE_USE_SHIPPED_LIBS=yes
```

```
#--
# Simplest ArchLinux autoinstallation guide
#++

#nvidia drm
#udiskie

# Installation (few notes)
3 primary partitons on 1 drive
/dev/xx1 type EFI bootable ~ 100MB
/dev/xx2 type ext4 ~ 200MB (maybe ext2 also good)
/dev/xx3      lvm group - root, home, swap, can be encrypted

mounted as
mount /dev/mapper/vg-root /mnt
mount /dev/mapper/vg-home /mnt/home
mount /dev/xx2 /mnt/boot
mount /dev/xx1 /mnt/boot/efi

grub installed in UEFI mode with command grub-install (efibootmgr and grub packages required)
then configured specific options in /etc/default/grub

console and HIGHDPI display:
used consolefont hooks in /etc/mkinitcpio.conf and other specific settings

MODULES="i915"
HOOKS="base udev autodetect modconf block consolefont encrypt lvm2 resume filesystems keymap keyboard fsck"

installed terminus font package `terminus-font`
tmpr loaded font - loadfont ter-132n
used specific settings (permanent)
`
/etc/vconsole.conf 
FONT=ter-132n
`

Configure blumbelbee and other stuff
https://gist.github.com/cpburnz/21694595b6dfffebf964

Locale config
/etc/locale.conf                                                                                                           :(
LANG=en_US.UTF-8
LC_COLLATE=C

# Hardware specific
sudo pacman -S --needed \
intel-ucode \
libva-intel-driver \
xf86-input-libinput \
linux-headers

# Utils (dig,...)
sudo pacman -S --needed \
openssh \
dnsutils \
net-tools \
ngrep \
tcpdump \
xclip \
perl-libwww \
perl-crypt-ssleay \
pygmentize \
neovim \
tree \
xorg-utils \
zip unzip \
numlockx \
sysstat \
acpi

# Optional
sudo pacman -S --needed \
python3 \
htop \
i3-wm \
i3blocks \
perl-anyevent-i3 \
vifm \
compton \
lxappearance \
alsa-utils \
mpv

## PowerManagement
tlp & powertop

# Optional fonts (main font "Hack", powerline font "PowerlineSymbols")
# Default UI font (configured in lxapperance) - Noto Sans 10
sudo pacman -S --needed \
ttf-hack  \
ttf-liberation \
ttf-dejavu \
opendesktop-fonts \
powerline-fonts \
noto-fonts 

# Appearance
https://github.com/actionless/oomox with gtk2 hidpi patches
http://www.gimp-forum.net/Thread-GIMP-2-8-Large-size-Icons-Themes
```

# .functions
```
#!/usr/bin/env bash

PYTHON=python2

# Create a new directory and enter it
function mkd() {
	mkdir -p "$@" && cd "$_";
}

# Create a .tar.gz archive, using `zopfli`, `pigz` or `gzip` for compression
function targz() {
	local tmpFile="${@%/}.tar";
	tar -cvf "${tmpFile}" --exclude=".DS_Store" "${@}" || return 1;

	size=$(
		stat -f"%z" "${tmpFile}" 2> /dev/null; # macOS `stat`
		stat -c"%s" "${tmpFile}" 2> /dev/null;  # GNU `stat`
	);

	local cmd="";
	if (( size < 52428800 )) && hash zopfli 2> /dev/null; then
		# the .tar file is smaller than 50 MB and Zopfli is available; use it
		cmd="zopfli";
	else
		if hash pigz 2> /dev/null; then
			cmd="pigz";
		else
			cmd="gzip";
		fi;
	fi;

	echo "Compressing .tar ($((size / 1000)) kB) using \`${cmd}\`…";
	"${cmd}" -v "${tmpFile}" || return 1;
	[ -f "${tmpFile}" ] && rm "${tmpFile}";

	zippedSize=$(
		stat -f"%z" "${tmpFile}.gz" 2> /dev/null; # macOS `stat`
		stat -c"%s" "${tmpFile}.gz" 2> /dev/null; # GNU `stat`
	);

	echo "${tmpFile}.gz ($((zippedSize / 1000)) kB) created successfully.";
}

# Determine size of a file or total size of a directory
function fs() {
	if du -b /dev/null > /dev/null 2>&1; then
		local arg=-sbh;
	else
		local arg=-sh;
	fi
	if [[ -n "$@" ]]; then
		du $arg -- "$@";
	else
		du $arg .[^.]* ./*;
	fi;
}

# Use Git’s colored diff when available
hash git &>/dev/null;
if [ $? -eq 0 ]; then
	function diff() {
		git diff --no-index --color-words "$@";
	}
fi;

# Create a data URL from a file
function dataurl() {
	local mimeType=$(file -b --mime-type "$1");
	if [[ $mimeType == text/* ]]; then
		mimeType="${mimeType};charset=utf-8";
	fi
	echo "data:${mimeType};base64,$(openssl base64 -in "$1" | tr -d '\n')";
}

# Create a git.io short URL
function gitio() {
	if [ -z "${1}" -o -z "${2}" ]; then
		echo "Usage: \`gitio slug url\`";
		return 1;
	fi;
	curl -i https://git.io/ -F "url=${2}" -F "code=${1}";
}

# Start an HTTP server from a directory, optionally specifying the port
function server() {
	local port="${1:-8000}";
	sleep 1 && open "http://localhost:${port}/" &
	# Set the default Content-Type to `text/plain` instead of `application/octet-stream`
	# And serve everything as UTF-8 (although not technically correct, this doesn’t break anything for binary files)
	$PYTHON -c $'import SimpleHTTPServer;\nmap = SimpleHTTPServer.SimpleHTTPRequestHandler.extensions_map;\nmap[""] = "text/plain";\nfor key, value in map.items():\n\tmap[key] = value + ";charset=UTF-8";\nSimpleHTTPServer.test();' "$port";
}

# Start a PHP server from a directory, optionally specifying the port
# (Requires PHP 5.4.0+.)
function phpserver() {
	local port="${1:-4000}";
	local ip=$(ipconfig getifaddr en1);
	sleep 1 && open "http://${ip}:${port}/" &
	php -S "${ip}:${port}";
}

# Compare original and gzipped file size
function gz() {
	local origsize=$(wc -c < "$1");
	local gzipsize=$(gzip -c "$1" | wc -c);
	local ratio=$(echo "$gzipsize * 100 / $origsize" | bc -l);
	printf "orig: %d bytes\n" "$origsize";
	printf "gzip: %d bytes (%2.2f%%)\n" "$gzipsize" "$ratio";
}

# Syntax-highlight JSON strings or files
# Usage: `json '{"foo":42}'` or `echo '{"foo":42}' | json`
function json() {
	if [ -t 0 ]; then # argument
		$PYTHON -mjson.tool <<< "$*" | pygmentize -l javascript;
	else # pipe
		$PYTHON -mjson.tool | pygmentize -l javascript;
	fi;
}

# Run `dig` and display the most useful info
function digga() {
	dig +nocmd "$1" any +multiline +noall +answer;
}

# UTF-8-encode a string of Unicode symbols
function escape() {
	printf "\\\x%s" $(printf "$@" | xxd -p -c1 -u);
	# print a newline unless we’re piping the output to another program
	if [ -t 1 ]; then
		echo ""; # newline
	fi;
}

# Decode \x{ABCD}-style Unicode escape sequences
function unidecode() {
	perl -e "binmode(STDOUT, ':utf8'); print \"$@\"";
	# print a newline unless we’re piping the output to another program
	if [ -t 1 ]; then
		echo ""; # newline
	fi;
}

# Get a character’s Unicode code point
function codepoint() {
	perl -e "use utf8; print sprintf('U+%04X', ord(\"$@\"))";
	# print a newline unless we’re piping the output to another program
	if [ -t 1 ]; then
		echo ""; # newline
	fi;
}

# Show all the names (CNs and SANs) listed in the SSL certificate
# for a given domain
function getcertnames() {
	if [ -z "${1}" ]; then
		echo "ERROR: No domain specified.";
		return 1;
	fi;

	local domain="${1}";
	echo "Testing ${domain}…";
	echo ""; # newline

	local tmp=$(echo -e "GET / HTTP/1.0\nEOT" \
		| openssl s_client -connect "${domain}:443" -servername "${domain}" 2>&1);

	if [[ "${tmp}" = *"-----BEGIN CERTIFICATE-----"* ]]; then
		local certText=$(echo "${tmp}" \
			| openssl x509 -text -certopt "no_aux, no_header, no_issuer, no_pubkey, \
			no_serial, no_sigdump, no_signame, no_validity, no_version");
		echo "Common Name:";
		echo ""; # newline
		echo "${certText}" | grep "Subject:" | sed -e "s/^.*CN=//" | sed -e "s/\/emailAddress=.*//";
		echo ""; # newline
		echo "Subject Alternative Name(s):";
		echo ""; # newline
		echo "${certText}" | grep -A 1 "Subject Alternative Name:" \
			| sed -e "2s/DNS://g" -e "s/ //g" | tr "," "\n" | tail -n +2;
		return 0;
	else
		echo "ERROR: Certificate not found.";
		return 1;
	fi;
}

# `s` with no arguments opens the current directory in Neo Vim, otherwise
# opens the given location
function s() {
	if [ $# -eq 0 ]; then
		nvim .;
	else
		nvim "$@";
	fi;
}

# `o` with no arguments opens the current directory, otherwise opens the given
# location
function o() {
	if [ $# -eq 0 ]; then
		vifm .;
	else
		vifm "$@";
	fi;
}

# `tre` is a shorthand for `tree` with hidden files and color enabled, ignoring
# the `.git` directory, listing directories first. The output gets piped into
# `less` with options to preserve color and line numbers, unless the output is
# small enough for one screen.
function tre() {
	tree -aC -I '.git|node_modules|bower_components' --dirsfirst "$@" | less -FRNX;
}
```

# .extra
```
# Git credentials
# Not in the repository, to prevent people from accidentally committing under my name
GIT_AUTHOR_NAME=""
GIT_COMMITTER_NAME="$GIT_AUTHOR_NAME"
git config --global user.name "$GIT_AUTHOR_NAME"
GIT_AUTHOR_EMAIL=""
GIT_COMMITTER_EMAIL="$GIT_AUTHOR_EMAIL"
git config --global user.email "$GIT_AUTHOR_EMAIL"
```


# Optional:
- .editorconfig                  - Plugin for your editor
- ssh binares (usualy OpenSSH)   - If need push or pull this repo by shh protocol


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


# .bash_promt
```
#!/usr/bin/env bash

# Shell prompt based on the Solarized Dark theme.
# Screenshot: http://i.imgur.com/EkEtphC.png
# Heavily inspired by @necolas’s prompt: https://github.com/necolas/dotfiles
# iTerm → Profiles → Text → use 13pt Monaco with 1.1 vertical spacing.

if [[ $COLORTERM = gnome-* && $TERM = xterm ]] && infocmp gnome-256color >/dev/null 2>&1; then
	export TERM='gnome-256color';
elif infocmp xterm-256color >/dev/null 2>&1; then
	export TERM='xterm-256color';
fi;

prompt_git() {
	local s='';
	local branchName='';

	# Check if the current directory is in a Git repository.
	if [ $(git rev-parse --is-inside-work-tree &>/dev/null; echo "${?}") == '0' ]; then

		# check if the current directory is in .git before running git checks
		if [ "$(git rev-parse --is-inside-git-dir 2> /dev/null)" == 'false' ]; then

			# Ensure the index is up to date.
			git update-index --really-refresh -q &>/dev/null;

			# Check for uncommitted changes in the index.
			if ! $(git diff --quiet --ignore-submodules --cached); then
				s+='+';
			fi;

			# Check for unstaged changes.
			if ! $(git diff-files --quiet --ignore-submodules --); then
				s+='!';
			fi;

			# Check for untracked files.
			if [ -n "$(git ls-files --others --exclude-standard)" ]; then
				s+='?';
			fi;

			# Check for stashed files.
			if $(git rev-parse --verify refs/stash &>/dev/null); then
				s+='$';
			fi;

		fi;

		# Get the short symbolic ref.
		# If HEAD isn’t a symbolic ref, get the short SHA for the latest commit
		# Otherwise, just give up.
		branchName="$(git symbolic-ref --quiet --short HEAD 2> /dev/null || \
			git rev-parse --short HEAD 2> /dev/null || \
			echo '(unknown)')";

		[ -n "${s}" ] && s=" [${s}]";

		echo -e "${1}${branchName}${2}${s}";
	else
		return;
	fi;
}

if tput setaf 1 &> /dev/null; then
	tput sgr0; # reset colors
	bold=$(tput bold);
	reset=$(tput sgr0);
	# Solarized colors, taken from http://git.io/solarized-colors.
	black=$(tput setaf 0);
	blue=$(tput setaf 33);
	cyan=$(tput setaf 37);
	green=$(tput setaf 64);
	orange=$(tput setaf 166);
	purple=$(tput setaf 125);
	red=$(tput setaf 124);
	violet=$(tput setaf 61);
	white=$(tput setaf 15);
	yellow=$(tput setaf 136);
else
	bold='';
	reset="\e[0m";
	black="\e[1;30m";
	blue="\e[1;34m";
	cyan="\e[1;36m";
	green="\e[1;32m";
	orange="\e[1;33m";
	purple="\e[1;35m";
	red="\e[1;31m";
	violet="\e[1;35m";
	white="\e[1;37m";
	yellow="\e[1;33m";
fi;

# Highlight the user name when logged in as root.
if [[ "${USER}" == "root" ]]; then
	userStyle="${red}";
else
	userStyle="${orange}";
fi;

# Highlight the hostname when connected via SSH.
if [[ "${SSH_TTY}" ]]; then
	hostStyle="${bold}${red}";
else
	hostStyle="${yellow}";
fi;

# Set the terminal title and prompt.
PS1="\[\033]0;\W\007\]"; # working directory base name
PS1+="\[${bold}\]\n"; # newline
PS1+="\[${userStyle}\]\u"; # username
PS1+="\[${white}\] at ";
PS1+="\[${hostStyle}\]\h"; # host
PS1+="\[${white}\] in ";
PS1+="\[${green}\]\w"; # working directory full path
PS1+="\$(prompt_git \"\[${white}\] on \[${violet}\]\" \"\[${blue}\]\")"; # Git repository details
PS1+="\n";
PS1+="\[${white}\]\$ \[${reset}\]"; # `$` (and reset color)
export PS1;

PS2="\[${yellow}\]→ \[${reset}\]";
export PS2;
```


-------------------------------------------------------------
# .aliases
```
#!/usr/bin/env bash

# Easier navigation: .., ..., ...., ....., ~ and -
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ~="cd ~" # `cd` is probably faster to type though
alias -- -="cd -"

# Shortcuts
alias d="cd ~/Documents"
alias dl="cd ~/Downloads"
alias dt="cd ~/Desktop"
alias p="cd /projects"
alias g="git"
alias h="history"
alias j="jobs"

# Detect which `ls` flavor is in use
if ls --color > /dev/null 2>&1; then # GNU `ls`
	colorflag="--color"
	export LS_COLORS='no=00:fi=00:di=01;31:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:'
else # macOS `ls`
	colorflag="-G"
	export LSCOLORS='BxBxhxDxfxhxhxhxhxcxcx'
fi

# List all files colorized in long format
alias l="ls -lF ${colorflag}"

# List all files colorized in long format, including dot files
alias la="ls -laF ${colorflag}"

# List only directories
alias lsd="ls -lF ${colorflag} | grep --color=never '^d'"

# Always use color output for `ls`
alias ls="command ls ${colorflag}"

# Always enable colored `grep` output
# Note: `GREP_OPTIONS="--color=auto"` is deprecated, hence the alias usage.
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Enable aliases to be sudo’ed
alias sudo='sudo '

# Get week number
alias week='date +%V'

# Stopwatch
alias timer='echo "Timer started. Stop with Ctrl-D." && date && time cat && date'

# Get macOS Software Updates, and update installed Ruby gems, Homebrew, npm, and their installed packages
alias update='sudo softwareupdate -i -a; brew update; brew upgrade; brew cleanup; npm install npm -g; npm update -g; sudo gem update --system; sudo gem update; sudo gem cleanup'

# Google Chrome
alias chrome='chromium-dev --enable-native-gpu-memory-buffers'

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ifconfig enp7s0 | grep 'inet' | cut -d: -f2"
alias ips="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"

# Show active network interfaces
alias ifactive="ifconfig | pcregrep -M -o '^[^\t:]+:([^\n]|\n\t)*status: active'"

# Flush Directory Service cache
alias flush="sudo systemctl restart nscd"

# View HTTP traffic
alias sniff="sudo ngrep -d 'enp7s0' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i enp7s0 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

# Canonical hex dump; some systems have this symlinked
command -v hd > /dev/null || alias hd="hexdump -C"

# macOS has no `md5sum`, so use `md5` as a fallback
command -v md5sum > /dev/null || alias md5sum="md5"

# macOS has no `sha1sum`, so use `shasum` as a fallback
command -v sha1sum > /dev/null || alias sha1sum="shasum"

# Trim new lines and copy to clipboard
alias c="tr -d '\n' | xsel --clipboard --input"

# Empty the Trash on all mounted volumes and the main HDD.
# Also, clear Apple’s System Logs to improve shell startup speed.
# Finally, clear download history from quarantine. https://mths.be/bum
alias emptytrash="sudo rm -rfv ~/.local/share/Trash/*"

# URL-encode strings
alias urlencode='python2 -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1]);"'

# Merge PDF files
# Usage: `pdfunite input{1,2,3}.pdf output.pdf`
alias mergepdf='pdfunite'

# Ring the terminal bell, and put a badge on Terminal.app’s Dock icon
# (useful when executing time-consuming commands)
alias badge="tput bel"

# Intuitive map function
# For example, to list all directories that contain a certain file:
# find . -name .gitattributes | map dirname
alias map="xargs -n1"

# One of @janmoesen’s ProTip™s
for method in GET HEAD POST PUT DELETE TRACE OPTIONS; do
	alias "$method"="lwp-request -m '$method'"
done

# Make Grunt print stack traces by default
command -v grunt > /dev/null && alias grunt="grunt --stack"

# Reload the shell (i.e. invoke as a login shell)
alias reload="exec $SHELL -l"

# Print each PATH entry on a separate line
alias path='echo -e ${PATH//:/\\n}'
```

# .bash_profile
```
# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH";

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,bash_prompt,exports,aliases,functions,extra,cmd}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# Case-insensitive globbing (used in pathname expansion)
# shopt -s nocaseglob;

# Append to the Bash history file, rather than overwriting it
# shopt -s histappend;

# Autocorrect typos in path names when using `cd`
# shopt -s cdspell;

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
# for option in autocd globstar; do
# 	shopt -s "$option" 2> /dev/null;
# done;

# Add tab completion for many Bash commands
# if which brew &> /dev/null && [ -f "$(brew --prefix)/share/bash-completion/bash_completion" ]; then
# 	source "$(brew --prefix)/share/bash-completion/bash_completion";
# elif [ -f /etc/bash_completion ]; then
# 	source /etc/bash_completion;
# fi;

# Enable tab completion for `g` by marking it as an alias for `git`
# if type _git &> /dev/null && [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
# 	complete -o default -o nospace -F _git g;
# fi;

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
# [ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2- | tr ' ' '\n')" scp sftp ssh;

# Add tab completion for `defaults read|write NSGlobalDomain`
# You could just use `-g` instead, but I like being explicit
# complete -W "NSGlobalDomain" defaults;

# Add `killall` tab completion for common apps
# complete -o "nospace" -W "Contacts Calendar Dock Finder Mail Safari iTunes SystemUIServer Terminal Twitter" killall;
```


--------


# comment style
```
/*
 * Usualy "root file" description, useful when main file require other
 *
 * Second paragraph.
 */
<code>
<code>
 
/**
 * This is section.
 * @property: value
 *
 * additional text/config
 */
<code>
<code>

<code>

demo function {
	/* description comment */
	<code>
	<code>
	<code>

	/* description comment */
	<code>
	<code>
	<code>
	<code>	/* line comment */
};
--------------------------------------------------------------------------------
#--
# Usualy "root file" description, useful when main file require other
#
# Second paragraph.
#
# Thrid paragraph.
#++

# This is section.
# @property value
#
# additional text

# Single line comment
```

# Checklist
```
# Hardware:
- video        - browser & videoplayer & apps, no tearing, FPS, gpu 2D acceleration, gpu decoding
- 3D           - FPS, benchmark
- RAM test     - passed or not passed
- SSD/HDD test - S.M.A.R.T, etc
- stress test  - passed or not passed
- sensors      - check temperature 

- hibernate/resume auto on critical state OR manual (require swap partition)
- check modules:
  * microphone & audio
  * wifi & lan
  * external monitors
  * SSD & HDD (+ check OS optimizations, required or not)
  * monitors test (refresh rate, color depth, ...)


## config:
- xrandr script
- xorg.conf
- /etc/default/grub
- /etc/fstab
- /etc/mkinitcpio.conf
- drivers

# Software
- [ ] tiling WM + notification daemon + apps/files menu
- [ ] global hotkeys to control hardware (monitor, lock, suspend, volume, brightness, monitor color temeperature)
- [ ] global hotkeys to control windows, work with extrenal monitor
- [ ] global hotkeys to control browser, audio player, video player
- [ ] unify color scheme & fonts scheme in terminal, browser, IDE, editor, WM, fm, apps
- [ ] apps list with default/custom configs
- [ ] global hotkeys to quick launch or activate apps, restart app, switch between windows or tabs

# Data management
http://libraries.mit.edu/data-management

### Organize
- check for established file naming conventions. This is must be step #1.
- spend time planning out both folder hierarchy and file naming conventions in the beginning of a project
- provide a method for easy adoption
- naming conventions & hierarchy must be **consistent**

my default convention:
- `project-name`
- `file.txt`
- `file-name.txt` "- is unix style"
- `directory`
- `directory-name`
if needed file can start with `YYYYMM` (requirement for better sorting). For code just use VCS
- unix style based structure: `dist, bin, share, etc, src, vendor, doc, lib, cache, tmp`

### Back up your data
- Make 3 copies (e.g. original + external/local + external/remote), verify your backup!
- Copies should be geographically distributed (local vs. remote)
- At least 1 manual backup without automatization and WITH backup verification!

### Documentation and metadata
- file names and formats associated with the project
- explanation of codes, abbreviations, or variables used in the data or in the file naming structure
- keep notes about where you got the data so that you and others can find it.

### Share
- VSC
- sftp/sshfs
- encrypted tunneling with autorization
- rsync

some universal meta fields:
Title, Creator, Identifier, Dates, Subject, Rights, Language, Methodology
```

# HTOP config
based on  https://haydenjames.io/htop-heres-how-to-customize-it/
```
# Beware! This file is rewritten by htop when settings are changed in the interface.
# The parser is also very primitive, and not human-friendly.
fields=50 0 48 17 18 38 39 40 2 46 47 49 1
sort_key=111
sort_direction=1
hide_threads=1
hide_kernel_threads=1
hide_userland_threads=1
shadow_other_users=0
show_thread_names=0
show_program_path=1
highlight_base_name=0
highlight_megabytes=0
highlight_threads=0
tree_view=1
header_margin=1
detailed_cpu_time=1
cpu_count_from_zero=1
update_process_names=0
account_guest_in_cpu_meter=0
color_scheme=6
delay=15
left_meters=CPU AllCPUs
left_meter_modes=2 1
right_meters=Blank Clock Uptime LoadAverage Tasks Swap Memory
right_meter_modes=2 2 2 2 2 2 2
```

# MPV config
https://github.com/Argon-/mpv-config


## 2. MouseLess
Chrome
 - vim plugin
 - streamkeys for media control (play, pause, votedown, voteup)
 - ^n, ^N, ^T, ^w, ^tab, ![n], ^r, ^R, ^0, ^+|-, ^l, !enter, ^H, ^J, ^+c, ^+j
 - devtools global:
   ^[|], ^![|] - tabs switch
   ^+d         - dock location
   ^+m         - device mode
   Esc         - toggle console
   ^f, ^+f     - search in panel, sources
   ^o          - search by filename
 - devtools elements:
   ^z, ^y      - undo, redo
   arrows, !>< - navigate, expand or collapse node
   enter, tab  - edit, navigate attributes
   F2, h       - toggle html, hide/unhide element
 - devtools styles sidebar
   ^lclick     - goTo
   Up/Down, +Up/+Down, +PageUp/+PageDown, !Up/!Down - inc/dec 1, inc/dec 10, inc/dec 100, inc/dec 0.1
   
   
 



# Universal code tips

1.  Separate functions, block comments used as "section title" and splitting long functions by 1 line.

2.  Use the rules adopted in the project, for example comments styleguide:

    ```
    /*
     * Usualy "root file" description
     *
     * Second paragraph. Yes new line after this block is needed.
     */

    <code>
    <code>

    /**
     * This is section. Used usualy for function description or even can replace "root file" decription above.
     * @property: value
     *
     * additional text/config
     */
    <code>
    <code>

    <code> = xx; // line comment
    <code> = yy; // line comment

    demo_function_with_many_code
    {
      <code>

      // Some
      // long
      // comment
      <code>

      // Comment
      <code>
    };

    demo_function_with_few_code
    {
      // Comment
      <code>
      //comment
      if
      {
        <code>
        // Comment
        <code>
      }
    }
    ```
  
    I like this style, because it's can be used in a lot programming languages (with specific changes).

3.  File naming - I like simple "short" names and usualy use specific standart (adopted in project) for file name or directory name.

    Variants: 
    
    * file-name, directory-name;
    * file_name, directory_name (preferably lowercase).
   
    If need add versions to files or directories (let's assume that the VCS is not available), use this postfix 001, 002. Usually 999 options are enough.
   
    Dates - you can use popular mask like this - `YYYY-MM-dd_your-title`, if need use nested structure (`YYYY -> YYYY-MM-dd_your-title`, year in subdirectory needed for save year if we copy directory outside of `YYYY`).

4. Few best coding practices for me (this is standart list):
   - Write / recive clear and complete requirements list;
   - Adhere to an conventions and guidelines;
   - Use KISS principle in development;
   - Write portable code;
   - Write / use testing code (proactive methodology);
   - Automate code building (continuous integration, continuous delivery) and deploy.
   
   


/etc/libao.conf
