return {
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {
			automatic_enable = false,
			ensure_installed = {
				"lua_ls",
				"eslint",
				"vtsls",
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
			{
				"mason-org/mason.nvim",
				opts = {},
			},
			{
				"WhoIsSethDaniel/mason-tool-installer.nvim",
				dependencies = { "mason-org/mason.nvim" },
				opts = {
					ensure_installed = {
						"prettier",
						"stylua",
						"oxlint",
					},
				},
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
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

			vim.lsp.enable({
				"lua_ls",
				"vtsls",
				"eslint",
				"jsonls",
				"html",
				"cssls",
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
				"dotls",
			})

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
		"mfussenegger/nvim-lint",
		config = function()
			require("lint").linters_by_ft = {
				javascript = { "oxlint" },
				typescript = { "oxlint" },
				javascriptreact = { "oxlint" },
				typescriptreact = { "oxlint" },
			}
			vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "BufEnter" }, {
				callback = function()
					local oxlint = vim.fs.find({ "oxlint.json", ".oxlintrc.json" }, { upward = true })[1]
					if oxlint then
						require("lint").try_lint("oxlint")
					end
				end,
			})
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
