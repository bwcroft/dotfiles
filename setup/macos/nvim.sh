#!/bin/bash

setup_nvim() {
  echo "${GREEN}Setup Neovim...${RESET}"
  mkdir -p "$HOME/.config"
  rm -rf "$HOME/.config/nvim"
  ln -s ../../nvim $HOME/.config/nvim
}
