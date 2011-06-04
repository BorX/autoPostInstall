#!/bin/bash

[ -n "$APT_MGR" ] && [ -r "$LIB_FILE" ] && . "$LIB_FILE" || { echo >&2 'Need to be invoked by autoinstall.sh'; exit 1; }

showTitle2 'Installing exim4'
showMessage 'Aptitude : Installing exim4'
$APT_MGR install exim4 exim4-daemon-light

