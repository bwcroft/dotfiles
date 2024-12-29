#!/bin/bash

# Enable immediate exit on error
set -e

# Paths
DOTFILES=$HOME/.dotfiles

# Load setup scripts
source "$(dirname "$0")/../logger.sh"
source "$(dirname "$0")/fonts.sh"
source "$(dirname "$0")/homebrew.sh"
source "$(dirname "$0")/zsh.sh"
source "$(dirname "$0")/nvim.sh"
source "$(dirname "$0")/tmux.sh"
source "$(dirname "$0")/ghostty.sh"

# Trap any command with a non-zero exit status
trap 'log_error "Command failed with exit code $?"' ERR

# Run setup scripts
log_info "Setting Up Dotfiles"
setup_fonts
setup_homebrew
setup_zsh
setup_nvim
setup_tmux
setup_ghostty
log_success "Done!"
