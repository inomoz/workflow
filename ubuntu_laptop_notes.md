Installed latest hwe stack
https://wiki.ubuntu.com/Kernel/LTSEnablementStack

Enabled PRIME Sync
```
/etc/modprobe.d/nvidia-drm-nomodeset.conf
options nvidia-drm modeset=1
```

test 
sudo cat /sys/module/nvidia_drm/parameters/modeset
