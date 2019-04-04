Installed latest hwe stack
https://wiki.ubuntu.com/Kernel/LTSEnablementStack

Enabled PRIME Sync
```
/etc/modprobe.d/nvidia-drm-nomodeset.conf
options nvidia-drm modeset=1
```
- kdeconnect

test 
sudo cat /sys/module/nvidia_drm/parameters/modeset

KDE cursor bug workaround
KDE System Settings -> Workspace Appearance -> Cursor Theme: Switch from resolution dependent to 24

KDE effects disable (some to fix bugs in rendering)
Desktop Effects
disable Background Contrast, Blur, Translucency

SDDM fix HIGHDPI
https://wiki.archlinux.org/index.php/SDDM#DPI_settings (seems not working?)

# Disable AKONADI
https://userbase.kde.org/Akonadi/ru

# Some configs from ~/.config
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


# config in ~/
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

