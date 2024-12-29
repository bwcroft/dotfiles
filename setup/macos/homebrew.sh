#!/bin/bash

setup_homebrew() {
  # Install Homebrew if not already installed.
  if test ! $(which brew); then
    echo "${GREEN}Installing Homebrew...${RESET}"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
  else 
    echo "${CYAN}Homebrew Already Installed${RESET}"
  fi

  # Setup Homebrew
  echo "${GREEN}Update homebrew and install packages...${RESET}"
  brew update
  brew tap homebrew/bundle
  brew bundle --file ../../Brewfile
}
