#!/usr/bin/env bash
# @file Keybase Configuration
# @brief Updates Keybase's system configuration with the Keybase configuration stored in the `home/dot_config/keybase/config.json` location.
# @description
#     This script ensures Keybase utilizes a configuration that, by default, adds a security fix.

set -Eeuo pipefail
trap "gum log -sl error 'Script encountered an error!'" ERR

if command -v keybase > /dev/null; then
  KEYBASE_CONFIG="${XDG_CONFIG_HOME:-$HOME/.config}/keybase/config.json"
  if [ -f "$KEYBASE_CONFIG" ]; then
    gum log -sl info 'Ensuring /etc/keybase is a directory' && sudo mkdir -p /etc/keybase
    gum log -sl info "Copying $KEYBASE_CONFIG to /etc/keybase/config.json" && sudo cp -f "$KEYBASE_CONFIG" /etc/keybase/config.json
  else
    gum log -sl warn "No Keybase config located at $KEYBASE_CONFIG"
  fi
else
  gum log -sl info 'The keybase executable is not available'
fi
