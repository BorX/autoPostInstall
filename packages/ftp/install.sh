#!/bin/bash

[ -n "$APT_MGR" ] && [ -r "$LIB_FILE" ] && . "$LIB_FILE" || { echo >&2 'Need to be invoked by autoinstall.sh'; exit 1; }

showTitle2 'Installing FTP Server'
showMessage 'Aptitude : Installing FTP server'
$APT_MGR install vsftpd db4.8-util
$APT_MGR install proftpd-basic
