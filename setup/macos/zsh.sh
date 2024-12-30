#!/bin/bash

source "$(dirname "$0")/../logger.sh"

setup_oh_my_zsh() {
  local plPath="$HOME/.oh-my-zsh/custom/themes/powerlevel10k"

  if [ ! -d "$HOME/.oh-my-zsh" ]; then
    log_info "Installing Oh-My-Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    log_success "Installed Oh-My-Zsh"
  else 
    echo -e "${CYAN}Oh-My-Zsh Already Installed${RESET}" 
  fi

  if [ ! -d "$plPath" ]; then
    log_info "Installing PowerLevel10K"
    echo -e "${GREEN}${RESET}"
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$plPath"
    log_success "Installed PowerLevel10K"
  else
    log_info "PowerLevel10K Already installed"
  fi

  log_info "Setting Up PowerLevel10K"
  rm -rf $HOME/.p10k.zsh
  ln -s "$HOME/.dotfiles/zsh/p10k.zsh" "$HOME/.p10k.zsh"
  log_success "PowerLevel10K Setup Complete"
}

setup_zsh() {
  setup_oh_my_zsh
  log_info "Setting Up ZSH..."
  rm -rf $HOME/.zshrc
  ln -s "$HOME/.dotfiles/zsh/zshrc" "$HOME/.zshrc"
  log_success "ZSH Setup Complete"
}
