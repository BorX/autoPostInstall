#!/bin/bash

[ -n "$APT_MGR" ] && [ -r "$LIB_FILE" ] && . "$LIB_FILE" || { echo >&2 'Need to be invoked by autoinstall.sh'; exit 1; }

installDebMultimediaSources() {
	showMessage 'Configuration Deb-Multimedia sources'
	cp -v deb-multimedia.list /etc/apt/sources.list.d/ || {
		rcode=$?
		echo >&2 "Can't copy to /etc/apt/sources.list.d/"
		exit $rcode
	}
	chown root:root /etc/apt/sources.list.d/deb-multimedia.list
	chmod 644       /etc/apt/sources.list.d/deb-multimedia.list
}

installIceweaselSources() {
	showMessage 'Configuration Iceweasel sources'
	cp -v iceweasel.list /etc/apt/sources.list.d/ || {
		rcode=$?
		echo >&2 "Can't copy to /etc/apt/sources.list.d/"
		exit $rcode
	}
	chown root:root /etc/apt/sources.list.d/iceweasel.list
	chmod 644       /etc/apt/sources.list.d/iceweasel.list
}

installCairoDockSources() {
	showMessage 'Configuration Cairo-Dock sources'
	cp -v cairo-dock.list /etc/apt/sources.list.d/ || {
		rcode=$?
		echo >&2 "Can't copy to /etc/apt/sources.list.d/"
		exit $rcode
	}
	chown root:root /etc/apt/sources.list.d/cairo-dock.list
	chmod 644       /etc/apt/sources.list.d/cairo-dock.list
}


showTitle2 'Installing sources'

showMessage 'Sauvegarde des fichiers originaux'
mv -v /etc/apt/sources.list{,_orig}
mv -v /etc/apt/preferences{,_orig}

showMessage 'Configuration Debian sources'
cp -v sources.list preferences /etc/apt/ || {
	rcode=$?
	echo >&2 "Can't copy to /etc/apt/"
	exit $rcode
}
chown root:root /etc/apt/{sources.list,preferences}
chmod 644 /etc/apt/{sources.list,preferences}

installDebMultimediaSources
#Inutile pour Sid:installIceweaselSources
installCairoDockSources


showTitle2 'Installing keys'

showMessage 'Aptitude : Updating'
$APT_MGR update || exit $?

showMessage 'Aptitude : Installing keys'
$APT_MGR install debian-archive-keyring deb-multimedia-keyring || exit $?


showTitle2 'Upgrading system'

showMessage 'Aptitude : Full-Upgrade'
$APT_MGR full-upgrade

