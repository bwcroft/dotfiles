return {
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {
			automatic_enable = false,
			ensure_installed = {
				"lua_ls",
				"eslint",
				"ts_ls",
				"jsonls",
				"html",
				"cssls",
				"dotls",
				"gopls",
				"graphql",
				"marksman",
				"intelephense",
				"pylsp",
				"rust_analyzer",
				"dockerls",
				"docker_compose_language_service",
				"bashls",
				"sqlls",
			},
		},
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
		},
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")

			lspconfig.lua_ls.setup({
				settings = {
					Lua = {
						runtime = {
							version = "LuaJIT",
							path = vim.split(package.path, ";"),
						},
						diagnostics = {
							globals = { "vim" },
						},
						workspace = {
							library = vim.api.nvim_get_runtime_file("", true),
							maxPreload = 10000,
							preloadFileSize = 1000,
						},
						telemetry = {
							enable = false,
						},
						format = {
							enable = true,
							defaultConfig = {
								indent_style = "spaces",
								indent_size = "2",
							},
						},
					},
				},
			})

			lspconfig.ts_ls.setup({
				init_options = {
					preferences = {
						disableSuggestions = true,
					},
				},
			})

			lspconfig.eslint.setup({})
			lspconfig.jsonls.setup({})
			lspconfig.html.setup({})
			lspconfig.cssls.setup({})
			lspconfig.dotls.setup({})
			lspconfig.gopls.setup({})
			lspconfig.graphql.setup({})
			lspconfig.marksman.setup({})
			lspconfig.intelephense.setup({})
			lspconfig.pylsp.setup({})
			lspconfig.rust_analyzer.setup({})
			lspconfig.dockerls.setup({})
			lspconfig.docker_compose_language_service.setup({})
			lspconfig.bashls.setup({})
			lspconfig.sqlls.setup({})

			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
			vim.keymap.set("n", "K", function()
				vim.lsp.buf.hover({
					border = "rounded",
					focusable = false,
				})
			end)
		end,
	},
	{
		"stevearc/conform.nvim",
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" },
					javascript = { "prettier" },
					typescript = { "prettier" },
					json = { "prettier" },
				},
			})

			vim.keymap.set("n", "<leader>gf", function()
				require("conform").format({ lsp_fallback = true })
			end, {})
		end,
	},
	{
		"faultless_local.nvim",
		dir = vim.fn.expand("~/Code/personal/faultless.nvim"),
		-- "bwcroft/faultless.nvim",
		config = function()
			local faultless = require("faultless")
			faultless.setup()
			vim.keymap.set("n", "<leader>d", faultless.toggle_diagnostics)
		end,
	},
}
