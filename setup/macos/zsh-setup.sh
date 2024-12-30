#!/bin/bash

# Enable immediate exit on error
set -e

source "$(dirname "$0")/zsh.sh"

# Trap any command with a non-zero exit status
trap 'log_error "Command failed with exit code $?"' ERR

# Run setup scripts
setup_zsh
