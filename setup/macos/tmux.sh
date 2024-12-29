#!/bin/bash

setup_tmux() {
  echo -e "${GREEN}Setup TMUX...${RESET}"
  local path="$HOME/.tmux.conf"
  rm -rf "$path" 
  ln -s "$HOME/.dotfiles/tmux/tmux.conf" "$path"
}
