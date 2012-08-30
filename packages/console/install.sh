#!/bin/bash

[ -n "$APT_MGR" ] && [ -r "$LIB_FILE" ] && . "$LIB_FILE" || { echo >&2 'Need to be invoked by autoinstall.sh'; exit 1; }

showTitle2 'Installing console tools'
showMessage 'Aptitude : Installing console tools'
$APT_MGR install mutt bash-completion lsof less most foremost file vim colordiff sudo pv ccze lwatch fdupes sysstat time iftop atop iotop htop rsync whois deborphan p7zip-full unzip zip byobu #ssh bc dc at nmap ftp telnet w3m pm-utils hdparm

