#!/bin/bash

source "$(dirname "$0")/../logger.sh"

setup_fonts() {
  log_info "Installing Fronts..."
  rsync -r --ignore-existing "$HOME/.dotfiles/fonts/*" "$HOME/Library/Fonts"
  log_success "Fonts Installed"
}
