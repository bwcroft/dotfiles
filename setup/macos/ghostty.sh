#!/bin/bash

source "$(dirname "$0")/../logger.sh"

setup_ghostty() {
  log_info "Setting Up Ghostty..."
  local path="$HOME/.config/ghostty"
  mkdir -p "$path"
  rm -rf "$path/config"
  ln -s "$HOME/.dotfiles/ghostty/config" "$path/config" 
  log_success "Ghostty Setup Complete"
}
