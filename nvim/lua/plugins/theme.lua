return {
	{
		"catppuccin/nvim",
		lazy = false,
		name = "catppuccin",
		priority = 1000,
		config = function()
			-- Configure Theme
			require("catppuccin").setup({
				term_colors = false,
				styles = {
					comments = {},
					conditionals = {},
					loops = {},
					functions = {},
					keywords = {},
					strings = {},
					variables = {},
					numbers = {},
					booleans = {},
					properties = {},
					types = {},
				},
				color_overrides = {
					mocha = {
						base = "#0F0F0F",
						mantle = "#0C0C0C",
						crust = "#000000",
					},
				},
			})

			-- Apply Theme
			vim.cmd.colorscheme("catppuccin")

			-- Add Border & Padding to LSP Hover
			local hoverConfig = vim.lsp.with(vim.lsp.handlers.hover, {
				border = "single",
				focusable = false,
			})
			vim.lsp.handlers["textDocument/hover"] = hoverConfig
		end,
	},
}
