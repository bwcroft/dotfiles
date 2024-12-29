#!/bin/bash

setup_ghostty() {
  echo -e "${GREEN}Setting Up Ghostty...${RESET}"
  local path="$HOME/.config/ghostty"
  mkdir -p "$path"
  rm -rf "$path/config"
  ln -s "$HOME/.dotfiles/ghostty/config" "$path/config" 
}
