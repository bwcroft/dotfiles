return {
	{
		"catppuccin/nvim",
		lazy = false,
		name = "catppuccin",
		priority = 1000,
		config = function()
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
						base = "#141414",
					  mantle = "#0d0d0d",
						crust = "#0d0d0d",
					},
				},
			})
			vim.cmd.colorscheme("catppuccin")
		end,
	},
}
