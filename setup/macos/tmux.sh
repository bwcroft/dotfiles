#!/bin/bash

source "$(dirname "$0")/../logger.sh"

setup_tmux() {
  log_info "Setup TMUX..."
  local path="$HOME/.tmux.conf"
  rm -rf "$path" 
  ln -s "$HOME/.dotfiles/tmux/tmux.conf" "$path"
  log_success "TMUX Setup Complete"
}
