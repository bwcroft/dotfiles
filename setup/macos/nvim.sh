#!/bin/bash

setup_nvim() {
  echo -e "${GREEN}Setting Up Neovim...${RESET}"
  local path="$HOME/.config/nvim"
  mkdir -p "$HOME/.config"
  rm -rf "$path"
  ln -s "$HOME/.dotfiles/nvim" "$path"
}
