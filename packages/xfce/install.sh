#!/bin/bash

[ -n "$APT_MGR" ] && [ -r "$LIB_FILE" ] && . "$LIB_FILE" || { echo >&2 'Need to be invoked by autoinstall.sh'; exit 1; }

showTitle2 'Installing Desktop'

showMessage 'Aptitude : Installing Desktop minimal'
$APT_MGR install cairo-dock cairo-dock-plug-ins gimp openoffice.org-writer openoffice.org-calc openoffice.org-impress openoffice.org-draw meld totem-plugins rhythmbox-plugins rhythmbox-plugin-cdrecorder filezilla vlc fslint gcalctool gnome-terminal || exit $?
$APT_MGR install -t experimental iceweasel-l10n-fr || exit $?
#totem-mozilla 
#virtualbox-ose inkscape
showMessage 'Aptitude : Installing Desktop minimal non-free'
$APT_MGR install ttf-mscorefonts-installer || exit $?

