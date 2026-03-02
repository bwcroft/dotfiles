#!/bin/bash

source "$(dirname "$0")/../logger.sh"

install_tpm() {
  local name="TPM"
  local tpm_dir="$HOME/.tmux/plugins/tpm"
  local tpm_repo="https://github.com/tmux-plugins/tpm"

  if [ ! -d "$tpm_dir" ]; then
    log_install "$name"
    mkdir -p "$(dirname "$tpm_dir")"
    git clone "$tpm_repo" "$tpm_dir"
    if [ $? -eq 0 ]; then
      log_installed "$name" 
      echo "TPM installed successfully."
    else
      log_error "Failed to clone $name repository."
      return 1
    fi
  else
    log_exists "TPM is already installed at $tpm_dir."
  fi
}

install_tmux() {
  local path="$HOME/.tmux.conf"
  rm -rf "$path" 
  ln -s "$HOME/.dotfiles/tmux/tmux.conf" "$path"
}

install_tpm

setup_tmux() {
  log_setup_start "tmux"
  install_tmux
  install_tpm
  log_setup_complete "tmux"
}
