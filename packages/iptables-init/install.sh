#!/bin/bash

[ -n "$APT_MGR" ] && [ -r "$LIB_FILE" ] && . "$LIB_FILE" || { echo >&2 'Need to be invoked by autoinstall.sh'; exit 1; }

showTitle2 'Deploying iptables-init'
showMessage 'Take care : This is a mock'
showMessage 'Refer to https://github.com/BorX/iptables-init'

exit 1

