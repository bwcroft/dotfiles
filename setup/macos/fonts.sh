#!/bin/bash

setup_fonts() {
  echo -e "${GREEN}Installing Fonts...${RESET}"
  rsync -r --ignore-existing "$HOME/.dotfiles/fonts/*" "$HOME/Library/Fonts"
}
