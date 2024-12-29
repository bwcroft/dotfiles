#!/bin/bash

setup_ghostty() {
  echo "${GREEN}Setup Ghostty...${RESET}"
  local configPath="$HOME/.config/ghostty"
  mkdir -p "$HOME/.config"
  mkdir -p "$configPath"
  rm -rf "$configPath/config"
  ln -s $configPath/config ../../ghostty/config
}
