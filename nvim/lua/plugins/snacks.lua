return {
	{
		"folke/snacks.nvim",
		lazy = false,
		priority = 1000,
		---@type snacks.Config
		opts = {
			explorer = {
				enabled = true,
				hidden = true,
				ignored = true,
			},
			picker = {
				enabled = true,
				sources = {
					explorer = {
						win = {
							list = {
								keys = {
									["l"] = "",
									["e"] = { "toggle_maximize", mode = { "n", "i" } },
								},
							},
						},
					},
				},
			},
			image = {
				enabled = true,
			},
			zen = {},
		},
		keys = {
			{
				"<leader>ff",
				function()
					Snacks.picker.files()
				end,
				desc = "Find Files",
			},
			{
				"<leader>fg",
				function()
					Snacks.picker.grep()
				end,
				desc = "Live Grep",
			},
			{
				"<leader>e",
				function()
					Snacks.explorer()
				end,
				desc = "File Explorer",
			},
			{
				"<leader>z",
				function()
					Snacks.zen()
				end,
				desc = "Zen Mode",
			},
		},
	},
}
