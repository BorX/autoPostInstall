#!/bin/bash

[ -n "$APT_MGR" ] && [ -r "$LIB_FILE" ] && . "$LIB_FILE" || { echo >&2 'Need to be invoked by autoinstall.sh'; exit 1; }

COMPIZ_PACKAGE='compiz compizconfig-settings-manager compiz-fusion-plugins-main'
WM_SESSION='xfce4-session'
#WM_SESSION='gnome-session'

showTitle2 'Installing Xorg'
showMessage 'Aptitude : Installing Compiz, gdm3 and wm-session'
$APT_MGR install xorg $COMPIZ_PACKAGE gdm3 $WM_SESSION || exit $?

