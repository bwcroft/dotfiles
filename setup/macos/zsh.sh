#!/bin/bash

source "$(dirname "$0")/../logger.sh"

setup_oh_my_zsh() {
  local omz="oh-my-zsh"
  local starshipPath="$HOME/.config/starship.toml"
  if [ ! -d "$HOME/.$omz" ]; then
    log_install "$omz"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    log_installed "$omz"
  else 
    log_exists "$omz"
  fi

  log_setup_start "starship"
  rm -rf "$starshipPath"
  ln -s "$HOME/.dotfiles/zsh/starship.toml" "$starshipPath"
  log_setup_complete "starship"
}

setup_zsh() {
  setup_oh_my_zsh
  log_setup_start "zsh"
  rm -rf $HOME/.zshrc
  ln -s "$HOME/.dotfiles/zsh/zshrc" "$HOME/.zshrc"
  log_setup_complete "zsh"
}
