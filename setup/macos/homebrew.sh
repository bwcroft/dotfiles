#!/bin/bash

source "$(dirname "$0")/../logger.sh"

install_homebrew() {
  local name="homebrew"
  if test ! $(which brew); then
    log_install "$name"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo -e 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
    log_installed "$name"
  else 
    log_exists "$name"
  fi
}

setup_homebrew() {
  install_homebrew
  log_info "Update homebrew and install packages..."
  brew update
  brew tap homebrew/bundle
  brew bundle --file "$HOME/.dotfiles/Brewfile"
}
