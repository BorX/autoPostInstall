#!/bin/bash

[ -n "$APT_MGR" ] && [ -r "$LIB_FILE" ] && . "$LIB_FILE" || { echo >&2 'Need to be invoked by autoinstall.sh'; exit 1; }

showTitle2 'Installing sources'
cp -v sources.list preferences /etc/apt/ || {
  rcode=$?
  echo >&2 "Can't copy to /etc/apt/"
  exit $rcode
}
chown root:root /etc/apt/{sources.list,preferences}
chmod 644 etc/apt/{sources.list,preferences}

showTitle2 'Installing keys'

showMessage 'Aptitude : Updating'
$APT_MGR update || exit $?

showMessage 'Aptitude : Installing keys'
$APT_MGR install debian-archive-keyring debian-multimedia-keyring || exit $?

showMessage 'Aptitude : Updating'
$APT_MGR update

