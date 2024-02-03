# VIM -> NVIM
if hash nvim 2>/dev/null; then
  alias vim="nvim"
fi

# Docker
alias dc="docker compose"
alias dcr="dc run --rm"
alias dcrp="dcr --service-ports --use-aliases"
alias dce="dc exec"
