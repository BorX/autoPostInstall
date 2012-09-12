#!/bin/bash

[ -n "$APT_MGR" ] && [ -r "$LIB_FILE" ] && . "$LIB_FILE" || { echo >&2 'Need to be invoked by autoinstall.sh'; exit 1; }

showTitle2 'Installing Desktop'

showMessage 'Aptitude : Installing Compiz'
$APT_MGR install compiz compizconfig-settings-manager compiz-fusion-plugins-main || exit $?

showMessage 'Aptitude : Installing Xfce4-session'
$APT_MGR install gdm3 xfce4-session || exit $?

showMessage 'Aptitude : Installing Desktop minimal'
$APT_MGR install cairo-dock hpijs hplip-gui hp-ppd gimp openoffice.org-writer openoffice.org-calc openoffice.org-impress openoffice.org-draw iceweasel-l10n-fr totem-mozilla deluge meld totem-plugins rhythmbox-plugins rhythmbox-plugin-cdrecorder filezilla vlc fslint gcalctool || exit $?
#virtualbox-ose inkscape
showMessage 'Aptitude : Installing Desktop minimal non-free'
$APT_MGR install ttf-mscorefonts-installer conky || exit $?

