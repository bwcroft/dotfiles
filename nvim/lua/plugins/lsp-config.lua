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

			vim.lsp.config("vtsls", {
				settings = {
					typescript = {
						tsserver = {
							-- Set the memory limit to 8192 MB (8GB)
							maxTsServerMemory = 8192,
							-- You can add other tsserver settings here
						},
						-- Other typescript settings
					},
					-- Other vtsls root settings
				},
			})

			vim.lsp.config("eslint", {
				root_dir = function(bufnr, on_dir)
					local root = vim.fs.root(bufnr, {
						".eslintrc",
						".eslintrc.js",
						".eslintrc.cjs",
						".eslintrc.json",
						".eslintrc.yaml",
						".eslintrc.yml",
						"eslint.config.js",
						"eslint.config.mjs",
						"eslint.config.ts",
					})
					local git_root = vim.fs.root(bufnr, { ".git" })
					if root and git_root and vim.startswith(root, git_root) then
						on_dir(root)
					end
				end,
			})

			vim.lsp.config("oxlint", {
				flags = {
					debounce_text_changes = 1000,
				},
			})

			vim.lsp.enable({
				"lua_ls",
				"vtsls",
				"eslint",
				-- "oxlint",
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
