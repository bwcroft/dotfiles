return {
  {
    "marko-cerovac/material.nvim",
    config = function()
      require("material").setup({
        contrast = {
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
        custom_colors = function(colors)
          colors.editor.fg_dark = "#F6F6F6"
          colors.syntax.variable = "#FFFFFF"
          colors.syntax.value = colors.main.purple
          colors.syntax.field = colors.main.purple
        end,
      })

      vim.g.material_style = "darker"
      vim.cmd.colorscheme("material")
    end,
  },
}
