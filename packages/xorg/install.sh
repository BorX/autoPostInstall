#!/bin/bash

[ -n "$APT_MGR" ] && [ -r "$LIB_FILE" ] && . "$LIB_FILE" || { echo >&2 'Need to be invoked by autoinstall.sh'; exit 1; }

showTitle2 'Installing Xorg'
# Necessite l'activation des depots non-free et contrib
showMessage 'Aptitude : Installing nvidia'
$APT_MGR install nvidia-glx nvidia-settings nvidia-xconfig
nvidia-xconfig

exit 0
showMessage 'Aptitude : Installing Xorg'
$APT_MGR install xorg
