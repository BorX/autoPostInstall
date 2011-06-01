#!/bin/bash

[ -n "$APT_MGR" ] && [ -r "$LIB_FILE" ] && . "$LIB_FILE" || { echo >&2 'Need to be invoked by autoinstall.sh'; exit 1; }

showTitle2 'Installing Xorg'
showMessage 'Aptitude : Installing nvidia'
$APT_MGR -y install nvidia-glx nvidia-settings libgl1-mesa-glx
