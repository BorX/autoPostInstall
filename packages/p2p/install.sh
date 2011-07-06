#!/bin/bash

[ -n "$APT_MGR" ] && [ -r "$LIB_FILE" ] && . "$LIB_FILE" || { echo >&2 'Need to be invoked by autoinstall.sh'; exit 1; }

showTitle2 'Installing P2P'
showMessage 'Aptitude : Installing amule'
$APT_MGR install amule amule-daemon amule-utils
