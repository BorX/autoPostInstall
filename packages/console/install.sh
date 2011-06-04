#!/bin/bash

[ -n "$APT_MGR" ] && [ -r "$LIB_FILE" ] && . "$LIB_FILE" || { echo >&2 'Need to be invoked by autoinstall.sh'; exit 1; }

showTitle2 'Installing console tools'
showMessage 'Aptitude : Installing console tools'
$APT_MGR install alpine mutt ssh bash-completion lsof less most file bc dc at vim colordiff sudo pv lwatch fdupes sysstat time iftop nmap rsync ftp telnet whois w3m deborphan p7zip-full unzip zip pm-utils hdparm

