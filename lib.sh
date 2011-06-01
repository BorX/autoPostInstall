#!/bin/bash

showMessage() {
  cat <<< "$*" | tee -a "$LOG_FILE"
}

showTitle2() {
  showMessage "
-------------------------------------------------------------------------------
--  $*"
}

showError() {
  showMessage "$*" >&2
}

showErrorAndExit() {
  local ret=$1
  shift
  showError "$*"
  exit $ret
}

