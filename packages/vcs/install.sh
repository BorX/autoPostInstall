#!/bin/bash

[ -n "$APT_MGR" ] && [ -r "$LIB_FILE" ] && . "$LIB_FILE" || { echo >&2 'Need to be invoked by autoinstall.sh'; exit 1; }

showTitle2 'Installing VCS'
showMessage 'Aptitude : Installing VCS'
$APT_MGR install subversion git mercurial
