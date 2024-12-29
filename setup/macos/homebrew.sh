#!/bin/bash

source "$(dirname "$0")/../logger.sh"

install_homebrew() {
  if test ! $(which brew); then
    log_info "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo -e 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
    log_success "Homebrew Installed"
  else 
    log_info "Homebrew Already Installed"
  fi
}

setup_homebrew() {
  install_homebrew
  log_info "Update homebrew and install packages..."
  brew update
  brew tap homebrew/bundle
  brew bundle --file ../../Brewfile
}
