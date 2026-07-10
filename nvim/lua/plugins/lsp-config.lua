return {
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {
			automatic_enable = false,
			ensure_installed = {
				"lua_ls",
				"eslint",
        "tsgo",
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
				-- This is the "Magic Sauce":
				-- It tells vtsls to look for the .git folder first.
				-- This forces all sub-projects in one repo into a single LSP instance.
				root_patterns = {
					".git", -- 1. The Repo Root (Most stable)
					"pnpm-workspace.yaml", -- 2. Monorepo Root (Specific to pnpm)
					"nx.json", -- 3. Monorepo Root (Specific to Nx)
					"package.json", -- 4. Fallback (The individual project root)
				},
				settings = {
					typescript = {
						tsserver = {
							-- Keep your 8GB limit for large monorepos
							maxTsServerMemory = 8192,
							-- Performance: Disable the extra 'syntax-only' node process
							useSeparateSyntaxServer = false,
						},
						preferences = {
							-- Prevents those annoying "../../.." imports in monorepos
							importModuleSpecifierPreference = "non-relative",
						},
					},
					vtsls = {
						-- Ensures it uses the version of TS in your node_modules
						autoUseWorkspaceTsdk = true,
						-- Performance: Only index files that are actually in the project
						externalLibraryFiles = {
							exclude = { "**/node_modules/**", "**/dist/**" },
						},
					},
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
        -- "oxlint",
				"lua_ls",
        "tsgo",
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
