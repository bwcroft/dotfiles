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

			vim.lsp.config("lua_ls", {
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

			vim.lsp.config("ts_ls", {
				init_options = {
					preferences = {
						disableSuggestions = true,
					},
				},
			})

			vim.lsp.config("eslint", {})
			vim.lsp.config("jsonls", {})
			vim.lsp.config("html", {})
			vim.lsp.config("cssls", {})
			vim.lsp.config("dotls", {})
			vim.lsp.config("gopls", {})
			vim.lsp.config("graphql", {})
			vim.lsp.config("marksman", {})
			vim.lsp.config("intelephense", {})
			vim.lsp.config("pylsp", {})
			vim.lsp.config("rust_analyzer", {})
			vim.lsp.config("dockerls", {})
			vim.lsp.config("docker_compose_language_service", {})
			vim.lsp.config("bashls", {})
			vim.lsp.config("sqlls", {})

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
		-- "faultless_local.nvim",
		-- dir = vim.fn.expand("~/Code/personal/faultless.nvim"),
		"bwcroft/faultless.nvim",
		config = function()
			local faultless = require("faultless")
			faultless.setup()
			vim.keymap.set("n", "<leader>d", faultless.toggle_diagnostics)
		end,
	},
}
