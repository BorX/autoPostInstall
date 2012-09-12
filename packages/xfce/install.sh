#!/bin/bash

[ -n "$APT_MGR" ] && [ -r "$LIB_FILE" ] && . "$LIB_FILE" || { echo >&2 'Need to be invoked by autoinstall.sh'; exit 1; }

showTitle2 'Installing Desktop'

showMessage 'Aptitude : Installing Desktop minimal'
$APT_MGR install gimp openoffice.org-writer openoffice.org-calc openoffice.org-impress openoffice.org-draw meld totem-plugins rhythmbox-plugins rhythmbox-plugin-cdrecorder filezilla vlc fslint gcalctool gnome-terminal || exit $?
#virtualbox-ose inkscape
$APT_MGR install -t experimental iceweasel-l10n-fr 
#totem-mozilla 
showMessage 'Aptitude : Installing Desktop minimal non-free'
$APT_MGR install ttf-mscorefonts-installer || exit $?

