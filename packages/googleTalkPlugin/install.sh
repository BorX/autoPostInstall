#!/bin/bash

[ -n "$APT_MGR" ] && [ -r "$LIB_FILE" ] && . "$LIB_FILE" || { echo >&2 'Need to be invoked by autoinstall.sh'; exit 1; }

showTitle2 'Installing Google Talk Plugin'

showMessage 'Downloading google-talkplugin_current_amd64.deb'
wget -O /tmp/googleChat.deb http://dl.google.com/linux/direct/google-talkplugin_current_amd64.deb || exit $?

showMessage 'Installing google-talkplugin_current_amd64.deb'
dpkg -i /tmp/googleChat.deb

