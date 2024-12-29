#!/bin/bash

setup_oh_my_zsh() {
  local plPath="$HOME/.oh-my-zsh/custom/themes/powerlevel10k"

  # Install Oh-My-Zsh if not already installed
  if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "${GREEN}Installing Oh-My-Zsh...${RESET}"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
  else 
    echo "${CYAN}Oh-My-Zsh Already Installed${RESET}" 
  fi

  # Install PowerLevel10K if not already installed
  if [ ! -d "$plPath" ]; then
    echo "${GREEN}Installing PowerLevel10K${RESET}"
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$plPath"
  else
    echo "${CYAN}PowerLevel10K Already installed${RESET}"
  fi

  # Setup Powerlevel10k
  echo "${GREEN}Setup PowerLevel10K${RESET}"
  rm -rf $HOME/.p10k.zsh
  ln -s ../../zsh/p10k.zsh $HOME/.p10k.zsh
}

setup_zsh() {
  setup_oh_my_zsh
  echo "${GREEN}Setup ZSH...${RESET}"
  rm -rf $HOME/.zshrc
  ln -s ../../zsh/zshrc $HOME/.zshrc
}
