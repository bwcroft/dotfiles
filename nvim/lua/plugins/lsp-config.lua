return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"tsserver",
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
					"vuels",
					"dockerls",
					"docker_compose_language_service",
					"bashls",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")

			lspconfig.lua_ls.setup({})
			lspconfig.tsserver.setup({})
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
			lspconfig.vuels.setup({})
			lspconfig.dockerls.setup({})
			lspconfig.docker_compose_language_service.setup({})
			lspconfig.bashls.setup({})

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
