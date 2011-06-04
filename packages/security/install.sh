#!/bin/bash

[ -n "$APT_MGR" ] && [ -r "$LIB_FILE" ] && . "$LIB_FILE" || { echo >&2 'Need to be invoked by autoinstall.sh'; exit 1; }

showTitle2 'Installing security tools'

showMessage 'Aptitude : Installing tripwire lire'
$APT_MGR install tripwire lire || exit $?

showMessage 'Aptitude : Installing chkrootkit rkhunter fail2ban checksecurity logcheck'
$APT_MGR install chkrootkit rkhunter fail2ban checksecurity logcheck
