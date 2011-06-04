#!/bin/bash

[ -n "$APT_MGR" ] && [ -r "$LIB_FILE" ] && . "$LIB_FILE" || { echo >&2 'Need to be invoked by autoinstall.sh'; exit 1; }

showTitle2 'Installing Flash'

showMessage 'Aptitude : Installing flashplugin-nonfree'
$APT_MGR install flashplugin-nonfree || exit $?
exit 0


showMessage 'Aptitude : Installing nspluginwrapper ia32-libs ia32-libs-gtk'
$APT_MGR install nspluginwrapper ia32-libs ia32-libs-gtk || exit $?

showMessage 'Downloading Flash Player 10 Installer'
wget -O /tmp/flash.tar.gz http://fpdownload.macromedia.com/get/flashplayer/current/install_flash_player_10_linux.tar.gz || exit $?

showMessage 'Extracting flash installer in /usr/lib32/flash/'
mkdir -p /usr/lib32/flash/ && cd /usr/lib32/flash/ && tar -xzf /tmp/flash.tar.gz || exit $?

showMessage 'Invoke nspluginwrapper for /usr/lib32/flash/libflashplayer.so'
nspluginwrapper -v -i /usr/lib32/flash/libflashplayer.so

