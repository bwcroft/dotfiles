#!/bin/bash

source "$(dirname "$0")/../logger.sh"

setup_nvim() {
  log_setup_start "neovim"
  local path="$HOME/.config/nvim"
  mkdir -p "$HOME/.config"
  rm -rf "$path"
  ln -s "$HOME/.dotfiles/nvim" "$path"
  log_setup_complete "neovim"
}
