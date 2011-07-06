#!/bin/bash

[ -n "$APT_MGR" ] && [ -r "$LIB_FILE" ] && . "$LIB_FILE" || { echo >&2 'Need to be invoked by autoinstall.sh'; exit 1; }

showTitle2 'Installing LAMP'
showMessage 'Aptitude : Installing LAMP'
$APT_MGR install apache2 mysql-server php5 php5-mysql phpmyadmin

