#!/bin/bash

source "$(dirname "$0")/../logger.sh"

setup_fonts() {
  log_install "fonts"
  rsync -r --ignore-existing $HOME/.dotfiles/fonts/* $HOME/Library/Fonts
  log_installed "fonts"
}
