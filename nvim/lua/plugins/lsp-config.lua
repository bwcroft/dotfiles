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
          "vuels",
          "dockerls",
          "docker_compose_language_service",
          "bashls",
          "sqlls",
        },
      })
    end,
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
      lspconfig.vuels.setup({})
      lspconfig.dockerls.setup({})
      lspconfig.docker_compose_language_service.setup({})
      lspconfig.bashls.setup({})
      lspconfig.sqlls.setup({})

      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
    end,
  },
  {
    enabled = true,
    "https://github.com/bwcroft/lsp_lines.nvim",
    config = function()
      require("lsp_lines").setup()

      -- Disable virtual_text since it's redundant due to lsp_lines.
      vim.diagnostic.config({
        virtual_text = false,
      })
    end,
  },
  {
    enabled = false,
    "lsp_lines_local.nvim",
    dir = "~/Code/personal/lsp_lines.nvim",
    config = function()
      require("lsp_lines").setup()

      -- Disable virtual_text since it's redundant due to lsp_lines.
      vim.diagnostic.config({
        virtual_text = false,
      })
    end,
  },
}
