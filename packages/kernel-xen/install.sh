#!/bin/bash

[ -n "$APT_MGR" ] && [ -r "$LIB_FILE" ] && . "$LIB_FILE" || { echo >&2 'Need to be invoked by autoinstall.sh'; exit 1; }

showMessage 'Installing LVM'
$APT_MGR install lvm2 || exit $?

showMessage 'Installing kernel'
$APT_MGR_PROMPT install linux-image-xen-amd64 xen-hypervisor-4.1-amd64 xen-tools || exit $?

showMessage 'Installing Grub'
$APT_MGR install grub-pc

showMessage 'Updating Grub'
mv /etc/grub.d/{1,5}0_linux
cat >> /etc/default/grub <<EOF

# Disable OS prober to prevent virtual machines on logical volumes from appearing in the boot menu.
GRUB_DISABLE_OS_PROBER=true

# Xen boot parameters for all Xen boots
#GRUB_CMDLINE_XEN=""
# Xen boot parameters for non-recovery Xen boots (in addition to GRUB_CMDLINE_XEN)
#GRUB_CMDLINE_XEN_DEFAULT=""
EOF
update-grub

