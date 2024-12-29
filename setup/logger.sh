#!/bin/bash

# Log errors and exit
log_error() {
  local message="$1"
  echo -e "${RED}ERROR: $message${RESET}" >&2
}
