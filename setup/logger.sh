#!/bin/bash

if [[ -z "${LOGGER_SH_SOURCED}" ]]; then
  LOGGER_SH_SOURCED=1
  RED='\033[0;31m'
  GREEN='\033[0;32m'
  CYAN='\033[0;36m'
  RESET='\033[0m'

  log_info() {
    local message="$1"
    echo -e "${CYAN}$message${RESET}"
  }

  log_success() {
    local message="$1"
    echo -e "${GREEN}$message${RESET}"
  }

  log_install() {
    local name="$1"
    echo -e "${CYAN}Installing $name...${RESET}"
  }

  log_installed() {
    local name="$1"
    echo -e "${GREEN}Installed $name${RESET}"
  }

  log_exists() {
    local name="$1"
    echo -e "${CYAN}$name already exists${RESET}"
  }

  log_setup_start() {
    local name="$1"
    echo -e "${CYAN}Setting up $name...${RESET}"
  }

  log_setup_complete() {
    local name="$1"
    echo -e "${GREEN}Completed $name setup${RESET}"
  }

  log_error() {
    local message="$1"
    echo -e "${RED}ERROR: $message${RESET}" >&2
  }
fi
