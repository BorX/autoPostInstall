#!/bin/bash

[ -n "$APT_MGR" ] && [ -r "$LIB_FILE" ] && . "$LIB_FILE" || { echo >&2 'Need to be invoked by autoinstall.sh'; exit 1; }

showTitle2 'Installing Desktop'

showMessage 'Aptitude : Installing Gnome minimal'
$APT_MGR install cairo-dock cairo-dock-plug-ins gnome-screensaver rss-glx gnome-terminal network-manager-gnome update-notifier gdebi xdg-utils hpijs hplip-gui hp-ppd gedit eog evince file-roller gimp openoffice.org-gnome openoffice.org-writer openoffice.org-calc openoffice.org-impress openoffice.org-draw deluge meld totem-plugins gnome-codec-install rhythmbox-plugins rhythmbox-plugin-cdrecorder filezilla vlc fslint gcalctool nautilus-open-terminal nautilus-actions || exit $?
$APT_MGR install -t experimental iceweasel-l10n-fr || exit $?
#totem-mozilla 
#virtualbox-ose inkscape

showMessage 'Aptitude : Installing Gnome minimal non-free'
$APT_MGR install ttf-mscorefonts-installer conky || exit $?

showMessage 'Adding lines to /etc/X11/Xsession.d/55gnome-session_gnomerc'
cat >> /etc/X11/Xsession.d/55gnome-session_gnomerc <<EOF

# Added by BorX
/usr/bin/nvidia-settings -l &
export WINDOW_MANAGER=/usr/bin/compiz
EOF

# TODO
# cp -ai /data/installer/xorg.conf /etc/X11/
# diff /usr/bin/gnome-wm /data/installer/gnome-wm
# cp -ai /data/installer/gnome-wm /usr/bin/gnome-wm

