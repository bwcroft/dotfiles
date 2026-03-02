.PHONY: help

help:
	@echo "Available Commands:"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "  %-15s %s\n", $$1, $$2}'

macos-install: ## Run all macos setup scripts 
	./setup/macos/setup-all.sh

macos-ghostty: ## Setup ghostty for macos
	./setup/macos/ghostty-setup.sh

macos-nvim: ## Setup neovim for macos
	./setup/macos/nvim-setup.sh

macos-tmux: ## Setup tmux for macos
	./setup/macos/tmux-setup.sh

macos-zsh: ## Setup zsh for macos
	./setup/macos/zsh-setup.sh
