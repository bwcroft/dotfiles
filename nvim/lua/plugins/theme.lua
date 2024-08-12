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
						base = "#000000",
						mantle = "#000000",
						crust = "#000000",
					},
				},
			})

			-- Apply Theme
			vim.cmd.colorscheme("catppuccin")

			-- Add Border & Padding to Lsp Hover
			local hoverConfig = vim.lsp.with(vim.lsp.handlers.hover, {
				border = "single",
				focusable = false,
			})
			vim.lsp.handlers["textDocument/hover"] = hoverConfig

			-- General transparency
			vim.cmd("highlight Normal guibg=#00000050")
			vim.cmd("highlight NonText guibg=#00000050")
			vim.cmd("highlight NormalNC guibg=#00000050")

			-- File tree transparency
			vim.cmd("highlight NvimTreeNormal guibg=#00000099")
			vim.cmd("highlight NvimTreeNormalNC guibg=#00000099")

			-- Additional elements
			vim.cmd("highlight StatusLineNC guibg=#00000050")
			vim.cmd("highlight VertSplit guibg=#00000050")
		end,
	},
}
