#!/bin/bash

[ -r "$LIB_FILE" ] && . "$LIB_FILE" || { echo >&2 'Need to be invoked by autoinstall.sh'; exit 1; }

showTitle2 'Coping files to /etc'
# TODO vimrc, profile.d, iptables-init, ...

cat <<EOF >>/etc/network/interfaces
# The primary network interface
allow-hotplug eth0
iface eth0 inet dhcp
EOF

exit 0

