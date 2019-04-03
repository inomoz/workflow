Installed latest hwe stack
https://wiki.ubuntu.com/Kernel/LTSEnablementStack

Enabled PRIME Sync
```
/etc/modprobe.d/nvidia-drm-nomodeset.conf
options nvidia-drm modeset=1
```

test 
sudo cat /sys/module/nvidia_drm/parameters/modeset

KDE cursor bug workaround
KDE System Settings -> Workspace Appearance -> Cursor Theme: Switch from resolution dependent to 24

KDE effects disable (some to fix bugs in rendering)
Desktop Effects
disable Background Contrast, Blur, Translucency

SDDM fix HIGHDPI
https://wiki.archlinux.org/index.php/SDDM#DPI_settings (seems not working?)
