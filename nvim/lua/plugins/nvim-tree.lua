return {
  {
    "kyazdani42/nvim-tree.lua",
    config = function()
      -- Change color for arrows in tree to light blue
      vim.cmd([[ highlight NvimTreeIndentMarker guifg=#3FC5FF ]])

      require("nvim-tree").setup({
        renderer = {
          icons = {
            glyphs = {
              folder = {
                arrow_closed = "",
                arrow_open = "",
              },
            },
          },
        },
        actions = {
          open_file = {
            window_picker = {
              enable = false, -- disable window_picker
            },
          },
        },
        filters = {
          dotfiles = true, -- show dotfiles
        },
        view = {
          width = 30, -- set the view width to 30
        },
        -- Uncomment the following if you want to enable git integration
        -- git = {
        --   ignore = false, -- show files ignored by git
        -- },
      })

      -- Key mapping to toggle nvim-tree
      vim.api.nvim_set_keymap("n", "<Leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
    end,
  },
}
