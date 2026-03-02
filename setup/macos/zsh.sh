#!/bin/bash

source "$(dirname "$0")/../logger.sh"

setup_oh_my_zsh() {
  local omz="oh-my-zsh"
  local starshipPath="$HOME/.config/starship.toml"
  if [ ! -d "$HOME/.$omz" ]; then
    log_install "$omz"
    KEEP_ZSHRC=yes sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    log_installed "$omz"
  else 
    log_exists "$omz"
  fi

  log_setup_start "starship"
  rm -rf "$starshipPath"
  ln -s "$HOME/.dotfiles/zsh/starship.toml" "$starshipPath"
  log_setup_complete "starship"
}

zsh_config() {
  local target_file="$HOME/.dotfiles/zsh/zshrc"
  local source_line="source $target_file"
  local zshrc_file="$HOME/.zshrc"

  log_setup_start "zsh"

  if grep -Fxq "$source_line" "$zshrc_file"; then
    log_info "zshrc dotfile source already in main .zshrc file"
  else
    echo "" >> "$zshrc_file"
    echo "# --------------------------------------------------------------------" >> "$zshrc_file"
    echo "# CUSTOM DOTFILES CONFIGURATION" >> "$zshrc_file"
    echo "# --------------------------------------------------------------------" >> "$zshrc_file"
    echo "$source_line" >> "$zshrc_file"
  fi

  log_setup_complete "zsh"
}

setup_zsh() {
  setup_oh_my_zsh
  zsh_config
}
