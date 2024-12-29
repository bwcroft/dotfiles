#!/bin/bash

setup_tmux() {
  echo "${GREEN}Setup TMUX...${RESET}"
  rm -rf $HOME/.tmux.conf
  ln -s $DOTFILES/tmux/tmux.conf $HOME/.tmux.conf
}
