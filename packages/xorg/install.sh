#!/bin/bash

[ -n "$APT_MGR" ] && [ -r "$LIB_FILE" ] && . "$LIB_FILE" || { echo >&2 'Need to be invoked by autoinstall.sh'; exit 1; }

showTitle2 'Installing Xorg'
showMessage 'Aptitude : Installing Xorg'
$APT_MGR install xorg

exit 0
# Necessite l'activation des depots non-free et contrib
showMessage 'Aptitude : Installing nvidia'
$APT_MGR install nvidia-glx nvidia-settings libgl1-mesa-glx
