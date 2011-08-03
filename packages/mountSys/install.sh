#!/bin/bash

[ -r "$LIB_FILE" ] && . "$LIB_FILE" || { echo >&2 'Need to be invoked by autoinstall.sh'; exit 1; }

showTitle2 'Mounting filesystems'
showMessage 'Mounting filesystems proc'
mount -t proc   proc   /proc
showMessage 'Mounting filesystems sysfs'
mount -t sysfs  sysfs  /sys
showMessage 'Mounting filesystems devpts'
mount -t devpts devpts /dev/pts

