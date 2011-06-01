#!/bin/bash

[ -n "$APT_MGR" ] && [ -r "$LIB_FILE" ] && . "$LIB_FILE" || { echo >&2 'Need to be invoked by autoinstall.sh'; exit 1; }

showTitle2 'Installing Gnome'

showMessage 'Aptitude : Installing gdm3 gnome-session'
$APT_MGR -y install gdm3 gnome-session || exit $?

showMessage 'Aptitude : Installing Gnome minimal'
$APT_MGR -y install gnome-screensaver rss-glx gnome-terminal network-manager-gnome update-notifier gdebi xdg-utils cairo-dock hpijs hplip-gui hp-ppd gedit eog evince file-roller gimp openoffice.org-gnome openoffice.org-writer openoffice.org-calc openoffice.org-impress openoffice.org-draw iceweasel-l10n-fr icedtea6-plugin totem-mozilla deluge meld totem-plugins gnome-codec-install rhythmbox-plugins rhythmbox-plugin-cdrecorder inkscape virtualbox-ose filezilla vlc fslint gcalctool nautilus-open-terminal nautilus-actions || exit $?

showMessage 'Aptitude : Installing Compiz'
$APT_MGR -y install compiz compizconfig-settings-manager compiz-fusion-plugins-main || exit $?

showMessage 'Aptitude : Installing Gnome minimal non-free'
$APT_MGR -y install ttf-mscorefonts-installer conky || exit $?

showMessage 'Adding lines to /etc/X11/Xsession.d/55gnome-session_gnomerc'
cat >> /etc/X11/Xsession.d/55gnome-session_gnomerc <<EOF

# Added by BorX
/usr/bin/nvidia-settings -l &
export WINDOW_MANAGER=/usr/bin/compiz
EOF

