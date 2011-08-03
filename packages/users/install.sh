#!/bin/bash

[ -r "$LIB_FILE" ] && . "$LIB_FILE" || { echo >&2 'Need to be invoked by autoinstall.sh'; exit 1; }

showMessage 'Modification of root password'
passwd

showMessage 'Creation of user'
adduser borx

