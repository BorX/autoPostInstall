#!/bin/bash

[ -n "$APT_MGR" ] && [ -r "$LIB_FILE" ] && . "$LIB_FILE" || { echo >&2 'Need to be invoked by autoinstall.sh'; exit 1; }

showMessage 'Installing mdadm and LVM'
$APT_MGR install mdadm lvm2 || exit $?

showMessage 'Installing kernel'
$APT_MGR install linux-image-amd64 || exit $?

showMessage 'Installing Grub'
$APT_MGR install grub-pc

