return {
  {
    "kyazdani42/nvim-tree.lua",
    config = function()
      -- Change color for arrows in tree to light gray
      vim.cmd([[ highlight NvimTreeIndentMarker guifg=#666666 ]])

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
        view = {
          adaptive_size = true,
        },
        git = {
          ignore = false,
        },
      })

      -- Key mapping to toggle nvim-tree
      vim.api.nvim_set_keymap("n", "<Leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
    end,
  },
}
