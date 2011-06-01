#!/bin/bash

[ -n "$APT_MGR" ] && [ -r "$LIB_FILE" ] && . "$LIB_FILE" || { echo >&2 'Need to be invoked by autoinstall.sh'; exit 1; }

showTitle2 'Upgrading system'
showMessage 'Aptitude : Full-Upgrade'
$APT_MGR -y full-upgrade

