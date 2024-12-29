#!/bin/bash

setup_fonts() {
  echo "${GREEN}Installing Fonts...${RESET}"
  rsync -r --ignore-existing ../../fonts/* $HOME/Library/Fonts
}
