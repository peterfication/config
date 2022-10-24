return function(use)
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require("nvim-tree").setup({
        view = {
          float = {
            enable = true,
            open_win_config = {
              relative = "editor",
              border = "rounded",
              width = 100,
              height = 60,
              row = 1,
              col = 75,
            },
          },
        },
      })

      vim.keymap.set('n', '<Leader>n', ":NvimTreeToggle<CR>", { noremap = true })
      vim.keymap.set('n', '<Leader>N', ":NvimTreeFindFile<CR>", { noremap = true })
    end
  }
end
