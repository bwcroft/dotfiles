# VIM -> NVIM
if hash nvim 2>/dev/null; then
  alias vim="nvim"
fi

# Docker
alias dc="docker compose"
alias dcr="dc run --rm"
alias dcrp="dcr --service-ports --use-aliases"
alias dce="dc exec"

# Tmux
alias ta="tmux attach -t"
alias tnew="tmux new -s"
alias tls="tmux ls"
alias tkill="tmux kill-session -t"
alias tkillall="tmux kill-server"
