#!/bin/bash

[ -r "$LIB_FILE" ] && . "$LIB_FILE" || { echo >&2 'Need to be invoked by autoinstall.sh'; exit 1; }

showMessage 'Aptitude : Installing sudo'
$APT_MGR install sudo || exit $?

showMessage 'Creation of user'
adduser borx && usermod -aG sudo borx

