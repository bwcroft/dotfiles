.PHONY: help

help:
	@echo "Available Commands:"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "  %-15s %s\n", $$1, $$2}'

macos: ## Setup script for macos (This will run all macos scripts)
	bash setup/macos/setup.sh

macos-ghostty: ## Setup ghostty on macos
	bash setup/macos/setup-ghostty.sh
