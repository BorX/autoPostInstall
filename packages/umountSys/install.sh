#!/bin/bash

[ -r "$LIB_FILE" ] && . "$LIB_FILE" || { echo >&2 'Need to be invoked by autoinstall.sh'; exit 1; }

showMessage 'Stopping daemons'
invoke-rc.d fail2ban stop
invoke-rc.d mdadm    stop
invoke-rc.d lvm2     stop
invoke-rc.d exim4    stop
invoke-rc.d atop     stop

showMessage 'Unmounting filesystems'
sleep 5
umount /dev/pts /sys /proc

