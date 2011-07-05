#!/bin/bash

[ -r "$LIB_FILE" ] && . "$LIB_FILE" || { echo >&2 'Need to be invoked by autoinstall.sh'; exit 1; }

showTitle2 'Coping files to /etc'
# TODO


exit 0
# /etc/dhcp/dhclient.conf
showMessage 'Modification of /etc/dhcp/dhclient.conf'
cat <<EOF >> '/etc/dhcp/dhclient.conf'
# fixer dns opendns
prepend domain-name-servers 208.67.222.222,208.67.220.220,192.168.1.1;
EOF

