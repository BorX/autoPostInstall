#!/bin/bash

[ -n "$APT_MGR" ] && [ -r "$LIB_FILE" ] && . "$LIB_FILE" || { echo >&2 'Need to be invoked by autoinstall.sh'; exit 1; }

showTitle2 'Ending installation'

showMessage 'Aptitude : Cleaning packages'
$APT_MGR clean

showMessage 'Stopping daemons'
invoke-rc.d fail2ban stop
invoke-rc.d mdadm    stop
invoke-rc.d lvm2     stop
invoke-rc.d exim4    stop
invoke-rc.d atop     stop
invoke-rc.d dbus     stop
invoke-rc.d cups     stop
