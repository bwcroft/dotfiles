return {
  {
    "marko-cerovac/material.nvim",
    config = function()
      require("material").setup({
        contrast = {
          terminal = false,
          sidebars = false,
          floating_windows = true,
          cursor_line = false,
          non_current_windows = false,
          filetypes = {},
        },
        plugins = {
          "neo-tree",
          "telescope",
        },
        disable = {
          colored_cursor = false,
          borders = false,
          background = false,
          term_colors = false,
          eob_lines = true,
        },
        lualine_style = "default", -- Lualine style ( can be 'stealth' or 'default' )
        async_loading = true,  -- Load parts of the theme asyncronously for faster startup (turned on by default)
        custom_colors = nil,   -- If you want to override the default colors, set this to a function
      })

      vim.g.material_style = "darker"
      vim.cmd.colorscheme("material")
    end,
  },
}
