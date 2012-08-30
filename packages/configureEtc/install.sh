#!/bin/bash

[ -r "$LIB_FILE" ] && . "$LIB_FILE" || { echo >&2 'Need to be invoked by autoinstall.sh'; exit 1; }

showTitle2 'Coping files to /etc'
# TODO vimrc, profile.d, interface, iptables-init, ...


exit 0

