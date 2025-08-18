#!/bin/bash

source "$(dirname "$0")/../logger.sh"

setup_opencode() {
  log_setup_start "opencode"
  brew install sst/tap/opencode
  rm -rf $HOME/.config/opencode
  ln -s "$HOME/.dotfiles/opencode" "$HOME/.config/opencode"
  log_setup_complete "opencode"
}
