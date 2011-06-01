#!/bin/bash

# #############################################################################
# Customizable vars

# APT manager to invoke
export APT_MGR='aptitude -s'

# The path to this script (used for other pathes)
ROOT_DIR="$(cd "$(dirname "$0")"; pwd)"

# Packages directories are near this script
PACKAGES_DIR="$ROOT_DIR/packages"

# Packages list is in the packages directory
PACKAGES_LIST_FILE="$PACKAGES_DIR/packages.list"

# Name of script to invoke in directory of each package to install
INSTALLER_CMD_NAME='install.sh'

# Log file
mkdir -p "$ROOT_DIR/log"
export LOG_FILE="$ROOT_DIR/log/$(date +%Y%m%d-%H%M).log"

# Path to the common library
export LIB_FILE="$ROOT_DIR/lib.sh"


# #############################################################################
# Script vars

# Return codes
EXIT_CODE_OK=0
EXIT_CODE_USER_HAVE_TO_BE_ROOT=1
EXIT_CODE_FULL_UPGRADE_ERROR=2
EXIT_CODE_USER=3


# #############################################################################
# Loading libs

. "$LIB_FILE"

showTitle1() {
  showMessage "
===============================================================================
==  $*"
}



# #############################################################################
# Main functions

installPackage() {
  local package_dir="$1"

  showTitle1 "Running '$package_dir/$INSTALLER_CMD_NAME'..."

  [ -r "$package_dir/$INSTALLER_CMD_NAME" ] || { showError "'$package_dir/$INSTALLER_CMD_NAME' is not readable"; return 1; }

  # Better go in the package_dir to invoke its installer script (in case the installer script isn't perfect)
  cd "$package_dir"
  chmod +x "$INSTALLER_CMD_NAME"

  # This WTF system only to have the return code in the showError :(
  # (using tee makes $? = 0 in all cases)
  local log_tmp="$(mktemp)"
  "./$INSTALLER_CMD_NAME" &> "$log_tmp"
  local return_code=$?
  cat "$log_tmp" >> "$LOG_FILE"
  rm "$log_tmp"

  [ $return_code -eq 0 ] && return 0
  showError "Something wrong during running of '$package_dir/$INSTALLER_CMD_NAME' (return code : $return_code)"
  return 2
}


# #############################################################################
# Main

# Check if user is root
#TODO[ $(id -u) -eq 0 ] || showErrorAndExit $EXIT_CODE_USER_HAVE_TO_BE_ROOT 'Script can only be invoked by root'

# Keep standard input for subshells
exec 3< "$PACKAGES_LIST_FILE"
while read <&3 package_dir; do
  [ "$(echo $package_dir | cut -c 1)" == '#' ] && continue
  installPackage "$PACKAGES_DIR/$package_dir" || {
    unset canContinue
    while [[ ! "$canContinue" = [YyNn] ]]; do
      read -p 'Continue ? [Y/n] ' canContinue
      [ -z "$canContinue" ] && canContinue='y'
    done
    [[ "$canContinue" = [Yy] ]] || showErrorAndExit $EXIT_CODE_USER 'Stopped by user'
  }
done
exec 3<&-


# #############################################################################
# End of installation

showTitle1 'Ending installation'

showMessage 'Cleaning packages'
$APT_MGR clean


exit $EXIT_CODE_OK

