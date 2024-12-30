#!/bin/bash

source "$(dirname "$0")/../logger.sh"

setup_oh_my_zsh() {
  local omz="oh-my-zsh"
  local p10k="powerlevel10k"
  local p10kPath="$HOME/.oh-my-zsh/custom/themes/powerlevel10k"

  if [ ! -d "$HOME/.oh-my-zsh" ]; then
    log_install "$omz"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    log_installed "$omz"
  else 
    log_exists "$omz"
  fi

  if [ ! -d "$p10kPath" ]; then
    log_install "$p10k"
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$p10kPath"
    log_installed "$p10k"
  else
    log_exists "$p10k"
  fi

  log_setup_start "$p10k"
  rm -rf $HOME/.p10k.zsh
  ln -s "$HOME/.dotfiles/zsh/p10k.zsh" "$HOME/.p10k.zsh"
  log_setup_complete "$p10k"
}

setup_zsh() {
  setup_oh_my_zsh
  log_setup_start "zsh"
  rm -rf $HOME/.zshrc
  ln -s "$HOME/.dotfiles/zsh/zshrc" "$HOME/.zshrc"
  log_setup_complete "zsh"
}
